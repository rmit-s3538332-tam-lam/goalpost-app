//
//  CreateGoalController.swift
//  goalpost-app
//
//  Created by Graphene on 22/1/19.
//  Copyright © 2019 Graphene. All rights reserved.
//

import UIKit

class CreateGoalController: UIViewController {

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var goalTextView: UITextView!
    var goalType : GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
    }
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        goalType = .longTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
