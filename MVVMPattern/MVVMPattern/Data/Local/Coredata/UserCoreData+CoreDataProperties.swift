//
//  UserCoreData+CoreDataProperties.swift
//  
//
//  Created by Vu Thanh Nam on 17/06/2022.
//
//

import Foundation
import CoreData


extension UserCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserCoreData> {
        return NSFetchRequest<UserCoreData>(entityName: "UserCoreData")
    }

    @NSManaged public var login: String?
    @NSManaged public var id: UUID?
    @NSManaged public var create_at: String?
    @NSManaged public var avatar_url: String?

}
