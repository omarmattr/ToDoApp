//
//  Task+CoreDataProperties.swift
//  ToDoApp
//
//  Created by omar mattr on 08/05/2021.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var taskName: String?
    @NSManaged public var taskValue: Bool
    @NSManaged public var taskDetails: String?

}

extension Task : Identifiable {

}
