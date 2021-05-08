//
//  CompleteTaskViewController.swift
//  ToDoApp
//
//  Created by omar mattr on 08/05/2021.
//

import UIKit

class CompleteTaskViewController: UIViewController ,OnClick{
    @IBOutlet var tableTask:UITableView!
    let manager = LocalStorageManager()
    func onClick(_ value: Bool, index: Int) {
        let task = data[index]
        task.setValue(value, forKey: "taskValue")
        print(task.taskValue)
        if manager.save(){
            data = manager.getTaskWhere(value: true)
            tableTask.reloadData()
        }
    
    }
    override func viewWillAppear(_ animated: Bool) {
        data = manager.getTaskWhere(value: true)
        tableTask.reloadData()
    }
    
    var data : [Task] = []
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        data = manager.getTaskWhere(value: true)
        

        let nib = UINib(nibName:"TaskTableViewCell", bundle: nil)
        tableTask.register(nib, forCellReuseIdentifier: "taskCell")
        // Do any additional setup after loading the view.
    }
    

}
extension CompleteTaskViewController : UITableViewDelegate,UITableViewDataSource{
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
