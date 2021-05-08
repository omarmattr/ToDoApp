//
//  LocalStorageManager.swift
//  ToDoApp
//
//  Created by omar mattr on 08/05/2021.
//

import UIKit
import CoreData
class LocalStorageManager {
  
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
     let context = appDelegate.persistentContainer.viewContext
    func addTask(task: MyTask) -> Bool{
        let newTask = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as! Task
        newTask.taskDetails = task.taskDetails
        newTask.taskName = task.taskName
        newTask.taskValue = task.taskValue

      return  save()
        
    }
    
    func getTask()-> [Task]{
        let request = NSFetchRequest<Task>(entityName: "Task")
     
        
        do{
            let result = try  context.fetch(request)
    
            return result
            
        }catch{
        return []
        
        }
    }
    func getTaskWhere(value : Bool)-> [Task]{
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(format: "taskValue = \(value)")
        do{
            let result = try  context.fetch(request)
    
            return result
            
        }catch{
        return []
        
        }
    }
    func removeTask(_ task:NSManagedObject) -> Bool {
      context.delete(task)
        return save()
     
    }
   
     func save()-> Bool{
        do{
           try context.save()
         //  try context.fetch(Task.fetchRequest())
            return true
        
        }catch{
            return false
        }
    }
}

