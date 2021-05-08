//
//  User+CoreDataProperties.swift
//  ToDoApp
//
//  Created by omar mattr on 08/05/2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userName: String?
    @NSManaged public var userEmail: String?
    @NSManaged public var attribute: String?

}

extension User : Identifiable {

}
