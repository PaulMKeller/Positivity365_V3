//
//  Year+CoreDataProperties.swift
//  Positivity365
//
//  Created by Paul Keller on 24/1/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import Foundation
import CoreData


extension Year {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Year> {
        return NSFetchRequest<Year>(entityName: "Year");
    }

    @NSManaged public var yearGroup: String?
    @NSManaged public var leapYear: Bool

}
