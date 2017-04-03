//
//  Creature.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

enum CreatureCategory: Int{
    case Mammals, Birds, Fish, Reptiles, Amphibians, Invertebrates, Trees,
    Flowers, Fungi, PlantOther, Cliffs, Rivers, Lakes, Rocks, Waterfalls,
    GeoOther
}
class Creature: NSObject {
    var category = CreatureCategory.Birds
    var title = ""
    var creatureDescription = ""
    var location = CLLocation()
    var locationDescription = ""
    var dateSeen = Date()
    var image: UIImage? = nil
    
    
    init(category: CreatureCategory, title:String, creatureDescription:String,
         location:CLLocation, locationDescription:String, dateSeen:Date,
         image:UIImage) {
        
        self.category = category
        self.title = title
        self.creatureDescription = creatureDescription
        self.location = location
        self.locationDescription = locationDescription
        self.dateSeen = dateSeen
        
        
    }

}
