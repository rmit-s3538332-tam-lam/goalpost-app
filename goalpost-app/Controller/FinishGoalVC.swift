//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by Graphene on 23/1/19.
//  Copyright © 2019 Graphene. All rights reserved.
//

import UIKit

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
    }
    
    

}
