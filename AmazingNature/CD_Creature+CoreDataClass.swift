//
//  CD_Creature+CoreDataClass.swift
//  AmazingNature
//
//  Created by vm mac on 2017-03-31.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import Foundation
import CoreData
import UIKit


public class CD_Creature: NSManagedObject {
    func copyCreature(newItem: Creature ) {
        self.name = newItem.title
        self.notes = newItem.description
        self.date = newItem.dateSeen as NSDate?;
        self.latitude = newItem.location.coordinate.latitude
        self.longitude = newItem.location.coordinate.longitude
        self.location = newItem.locationDescription
        self.category = Int64(newItem.category.hashValue)
        
        if(newItem.image != nil) {
//            guard let self.imageData = (UIImageJPEGRepresentation(newItem.image!,1) as NSData)
//        else {
//                // handle failed conversion
//                print("jpg error")
//                return
//            }
            
            self.imageData =
                (UIImageJPEGRepresentation(newItem.image!, 1) as NSData?)
            //self.imageData = imageData as NSData?
        }
        
        
    
    }

}
