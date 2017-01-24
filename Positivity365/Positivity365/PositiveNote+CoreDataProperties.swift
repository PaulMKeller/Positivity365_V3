//
//  PositiveNote+CoreDataProperties.swift
//  Positivity365
//
//  Created by Paul Keller on 24/1/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import Foundation
import CoreData


extension PositiveNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PositiveNote> {
        return NSFetchRequest<PositiveNote>(entityName: "PositiveNote");
    }

    @NSManaged public var noteText: String?
    @NSManaged public var noteYear: String?
    @NSManaged public var noteMonth: String?
    @NSManaged public var noteDay: String?
    @NSManaged public var day: Day?
    @NSManaged public var month: Month?
    @NSManaged public var year: Year?

}
