//
//  InCompleteTaskViewController.swift
//  ToDoApp
//
//  Created by omar mattr on 08/05/2021.
//

import UIKit

class InCompleteTaskViewController: UIViewController ,OnClick{
    var data : [Task] = []
    @IBOutlet var tableTask:UITableView!
    func onClick(_ value: Bool, index: Int) {
        let task = data[index]
        task.setValue(value, forKey: "taskValue")
        print(task.taskValue)
        if manager.save(){
            
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        data = manager.getTaskWhere(value: false)
        tableTask.reloadData()
    }
    let manager = LocalStorageManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // print(manager.addTask(task: MyTask(taskName: "first Details", taskDetails: "first name", taskValue: false)))
        data = manager.getTaskWhere(value: false)
        

        let nib = UINib(nibName:"TaskTableViewCell", bundle: nil)
        tableTask.register(nib, forCellReuseIdentifier: "taskCell")
        // Do any additional setup after loading the view.
    }
    

}
extension InCompleteTaskViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell

        cell.click = self
        cell.index = indexPath.row
       cell.teskComplete.isSelected =   !(data[indexPath.row].taskValue)
      cell.taskName.text = data[indexPath.row].taskName
        return cell
    }
    
    
}

