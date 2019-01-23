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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
    }
    
}
extension GoalsVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else{
            return UITableViewCell()
        }
        cell.configureCell(description: "Eat salad twice a week", type: .shortTerm, goalProgressAmount: 2)
        
        return cell
    }
    
    
}

