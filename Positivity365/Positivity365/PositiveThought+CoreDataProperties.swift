//
//  PositiveThought+CoreDataProperties.swift
//  Positivity365
//
//  Created by Paul Keller on 3/3/17.
//  Copyright © 2017 Paul Keller. All rights reserved.
//

import Foundation
import CoreData


extension PositiveThought {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PositiveThought> {
        return NSFetchRequest<PositiveThought>(entityName: "PositiveThought");
    }

    @NSManaged public var thoughtText: String?
    @NSManaged public var author: String?

}
