//
//  Month+CoreDataProperties.swift
//  Positivity365
//
//  Created by Paul Keller on 24/1/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import Foundation
import CoreData


extension Month {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Month> {
        return NSFetchRequest<Month>(entityName: "Month");
    }

    @NSManaged public var monthGroup: String?
    @NSManaged public var maxDay: Int16
    @NSManaged public var order: Int16

}
