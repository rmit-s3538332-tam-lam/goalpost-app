//
//  GoalsVC.swift
//  goalpost-app
//
//  Created by Graphene on 22/1/19.
//  Copyright © 2019 Graphene. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var goals : [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        debugPrint("ViewWillAppear")
        super.viewDidAppear(animated)
        self.fetchCoreDataObject()
        tableView.reloadData()
    }
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func unwindToGoalsVC(sender: UIStoryboardSegue){
        
    }
    
}

extension GoalsVC{
    func fetch(completion: (_ complete: Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest : NSFetchRequest<Goal> = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
        }catch{
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    func removeGoal(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(goals[indexPath.row])
        
        do{
            try managedContext.save()
            debugPrint("Successfully remove goal")
        }catch {
            debugPrint("Could not remove: \(error.localizedDescription)")
        }
        
    }
    func fetchCoreDataObject(){
        self.fetch{ (complete) in
            if complete {
                if goals.count >= 1{
                    tableView.isHidden = false
                }
            }else{
                tableView.isHidden = true
            }
            
        }
    }
}
extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("numberOfRowInSection is called \(goals.count)")
        
        return goals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        debugPrint("cellForRowAt is called")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else{
            return UITableViewCell()
        }
        let goal = goals[indexPath.row]
        debugPrint("Setting up cell: \(goal.goalDescription)")
        cell.configureCell(goal: goal)
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObject()
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return [deleteAction]
    }
    
}

