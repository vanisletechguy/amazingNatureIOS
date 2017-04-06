//
//  CD_Creature+CoreDataProperties.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-04-02.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import Foundation
import CoreData


extension CD_Creature {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CD_Creature> {
        return NSFetchRequest<CD_Creature>(entityName: "CD_Creature");
    }

    @NSManaged public var category: Int64
    @NSManaged public var date: NSDate?
    @NSManaged public var latitude: Double
    @NSManaged public var location: String?
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var imageData: NSData?

}
