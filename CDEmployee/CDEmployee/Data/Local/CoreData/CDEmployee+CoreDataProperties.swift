//
//  CDEmployee+CoreDataProperties.swift
//  CDEmployee
//
//  Created by Vu Thanh Nam on 15/06/2022.
//
//

import Foundation
import CoreData


extension CDEmployee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDEmployee> {
        return NSFetchRequest<CDEmployee>(entityName: "CDEmployee")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var email: String?
    @NSManaged public var profilePic: Data?

}

extension CDEmployee : Identifiable {

}
