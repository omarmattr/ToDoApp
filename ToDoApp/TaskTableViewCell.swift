//
//  TaskTableViewCell.swift
//  ToDoApp
//
//  Created by omar mattr on 07/05/2021.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    var click : OnClick?
    var index  = 0
    @IBOutlet  var taskName : UILabel!
    @IBOutlet  var teskComplete : UIButton!
    @IBAction func complete(_ sender : UIButton){
        click?.onClick(sender.isSelected,index: index)
        sender.isSelected = !sender.isSelected
    }
    
    
}

protocol OnClick {
    func onClick(_ value : Bool,index:Int)
    }
