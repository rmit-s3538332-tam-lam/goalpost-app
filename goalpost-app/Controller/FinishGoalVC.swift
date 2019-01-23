//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Graphene on 23/1/19.
//  Copyright © 2019 Graphene. All rights reserved.
//

import UIKit
import CoreData
class FinishGoalVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    var goalDescription: String!
    var goalType : GoalType!
    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    func initData(description: String, goalType: GoalType){
        self.goalDescription = description
        self.goalType = goalType
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != ""{
            self.save{(complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    func save(completion:(_ finished: Bool) ->()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            completion(true)
            print("Successfully saved data")
        }catch{
            print("Could not save: \(error.localizedDescription)")
        }
    }
    
}
