//
//  CD_Creature+CoreDataClass.swift
//  AmazingNature
//
//  Created by vm mac on 2017-03-31.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import Foundation
import CoreData


public class CD_Creature: NSManagedObject {
    func copyCreature(newItem: Creature ) {
        self.name = newItem.title
        self.notes = newItem.creatureDescription
        self.date = newItem.dateSeen as NSDate?;
        self.latitude = newItem.location.coordinate.latitude
        self.longitude = newItem.location.coordinate.longitude
        self.location = newItem.locationDescription
        self.category = Int64(newItem.category.hashValue)
        
        
        
    
    }

}
