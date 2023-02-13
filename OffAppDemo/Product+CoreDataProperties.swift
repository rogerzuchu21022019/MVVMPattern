//
//  Product+CoreDataProperties.swift
//  OffAppDemo
//
//  Created by Vu Thanh Nam on 17/06/2022.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var quantity: Double
    @NSManaged public var price: Double
    @NSManaged public var sub: String?

}

extension Product : Identifiable {

}
