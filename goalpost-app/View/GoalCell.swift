//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Graphene on 22/1/19.
//  Copyright © 2019 Graphene. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    
    func configureCell(goal: Goal){
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalCompletionValue)
        
    }
    
}
