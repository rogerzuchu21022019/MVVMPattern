//
//  User+CoreDataProperties.swift
//  
//
//  Created by Vu Thanh Nam on 17/06/2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var login: String?
    @NSManaged public var id: UUID?
    @NSManaged public var url: String?
    @NSManaged public var create_at: String?
    @NSManaged public var avatar_url: String?

}
