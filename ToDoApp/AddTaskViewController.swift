//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by omar mattr on 08/05/2021.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet var txtName:UITextField!
    @IBOutlet var txtDetail:UITextField!
    @IBAction func btnAdd(_ sender : UIButton){
        if txtName.text!.isEmpty || txtDetail.text!.isEmpty {
            let dialog = UIAlertController(title: "Check input feild", message: "task name or details is empty", preferredStyle: .alert)
            dialog.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(dialog, animated: true, completion: nil)
        }else{
            let manager = LocalStorageManager()
            if manager.addTask(task: MyTask(taskName: txtName.text!, taskDetails:txtDetail.text!, taskValue: false)){
            self.dismiss(animated: true, completion: nil)
            
        }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

}
