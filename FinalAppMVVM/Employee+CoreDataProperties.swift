//
//  Employee+CoreDataProperties.swift
//  FinalAppMVVM
//
//  Created by Vu Thanh Nam on 15/06/2022.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var name: String?

}

extension Employee : Identifiable {

}
