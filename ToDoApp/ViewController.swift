//
//  ViewController.swift
//  ToDoApp
//
//  Created by omar mattr on 07/05/2021.
//

import UIKit

class ViewController: UIViewController, OnClick {
    func onClick(_ value: Bool, index: Int) {
        let task = data[index]
        task.setValue(value, forKey: "taskValue")
        print(task.taskValue)
        manager.save()
        
    
    }
    let manager = LocalStorageManager()
   
    private var data : [Task] = []
    @IBOutlet var tableTask:UITableView!
    @IBAction func btnAddTask(_ sender:UIButton){
        
    }

    override func viewWillAppear(_ animated: Bool) {
        data = manager.getTask()
        tableTask.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
       
     // print(manager.addTask(task: MyTask(taskName: "first Details", taskDetails: "first name", taskValue: false)))
        data = manager.getTask()
        for i in data {
            print(i.taskValue)
        }
        

        let nib = UINib(nibName:"TaskTableViewCell", bundle: nil)
        tableTask.register(nib, forCellReuseIdentifier: "taskCell")
       
    }


}
extension ViewController : UITextViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
      // cell?.teskComplete.setBackgroundImage(UIImage(named: "box"), for: .normal)
      // cell?.teskComplete.setBackgroundImage(UIImage(named: "checkBox"), for: .selected)
        
        let mTask = data[indexPath.row]
        cell.click = self
        cell.index = indexPath.row
       cell.teskComplete.isSelected =  !(mTask.taskValue)
      cell.taskName.text = mTask.taskName
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            manager.removeTask(data[indexPath.row])
            tableTask.reloadData()
        }else{return}
    }
  
    
    
}
struct MyTask {
    let taskName :String
    let taskDetails:String
    let taskValue:Bool
    
}

