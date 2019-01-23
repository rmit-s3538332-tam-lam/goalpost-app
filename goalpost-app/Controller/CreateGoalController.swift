//
//  CreateGoalController.swift
//  goalpost-app
//
//  Created by Graphene on 22/1/19.
//  Copyright © 2019 Graphene. All rights reserved.
//

import UIKit

class CreateGoalController: UIViewController , UITextViewDelegate{

    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var goalTextView: UITextView!
    var goalType : GoalType = .shortTerm
    override func viewDidLoad() {
        super.viewDidLoad()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        goalTextView.delegate = self
        
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        if (goalTextView.text != "" && goalTextView.text != "What is your goal?") {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return}
            finishGoalVC.initData(description: goalTextView.text!, goalType: goalType)
//            presentDetail(finishGoalVC)
            present(finishGoalVC, animated: true, completion: nil)
            print(goalTextView.text)
        }
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
