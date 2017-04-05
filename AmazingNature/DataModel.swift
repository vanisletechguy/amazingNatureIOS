//
//  DataModel.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-31.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation
import UIKit

class DataModel {
    var creatureList = [Creature]()
    
    init () {
    }
    
    func loadData(delegate: AppDelegate) {
        var cdCreatureList: [NSManagedObject] = []
        let appDelegate = delegate
        let context = appDelegate.persistentContainer
        var managedObjectContext: NSManagedObjectContext!
        managedObjectContext = context.viewContext

        let fetchRequest =
            NSFetchRequest<CD_Creature>(entityName: "CD_Creature")
        do {
            cdCreatureList = try managedObjectContext.fetch(fetchRequest)
            print("was able to fetch")
            importFromCoreData(cdCreatureList: cdCreatureList,
                               context: managedObjectContext)
            if(creatureList.isEmpty != true) {
                print(creatureList[0].title)
                }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    func importFromCoreData(cdCreatureList: [NSManagedObject],
                            context: NSManagedObjectContext) {
        creatureList = []
        let _ = cdCreatureList.map{
            var creatureImage:UIImage? = UIImage()
            if let imageData = (($0 as! CD_Creature).imageData) {
                if let loadedImage = UIImage(data:
                    (imageData as NSData) as Data) {
                    creatureImage = loadedImage
                    let newCgIm = loadedImage.cgImage?.copy()
                    creatureImage = UIImage(cgImage: newCgIm!,
                                            scale: loadedImage.scale,
                                            orientation:
                        loadedImage.imageOrientation)
                }
            }
            
            let newCreature:Creature =
                Creature(category: CreatureCategory(rawValue:
                    Int(($0 as! CD_Creature).category))!,
                         title: ($0 as! CD_Creature).name!,
                         creatureDescription: ($0 as! CD_Creature).description,
                         location: CLLocation(
                            latitude: ($0 as! CD_Creature).latitude,
                            longitude: ($0 as! CD_Creature).longitude),
                         locationDescription: ($0 as! CD_Creature).location!,
                         dateSeen: ($0 as! CD_Creature).date as! Date,
                         image: creatureImage!)
            creatureList.append(newCreature)
            
            let fetchRequest =
                NSFetchRequest<CD_Creature>(entityName: "CD_Creature")
        }
    }
                                            //add and edit should have a func to make sure the name is unique
    func addNewCreature(newCreature: Creature) {
        creatureList.append(newCreature)
        
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer
        var managedObjectContext: NSManagedObjectContext!
        managedObjectContext = context.viewContext
        
        let cdNewCreature = CD_Creature(context: managedObjectContext)
        cdNewCreature.copyCreature(newItem: newCreature)
        appDelegate.saveContext()
    }
    
    func editedCreature(editedCreature: Creature,
                        oldCreatureName: String) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer
        var managedObjectContext: NSManagedObjectContext!
        managedObjectContext = context.viewContext
        
        let fetchRequest =
            NSFetchRequest<CD_Creature>(entityName: "CD_Creature")
        fetchRequest.predicate = NSPredicate.init(format: "name = %@",
                                                  oldCreatureName)
        let creatureToEdit = try! managedObjectContext.fetch(fetchRequest)
        creatureToEdit[0].copyCreature(newItem: editedCreature)
        do {
            try managedObjectContext.save()
        } catch {
            print("could not save after adding item to province")
        }
    }
    
    
    
    func deleteAllData() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer
        var managedObjectContext: NSManagedObjectContext!
        managedObjectContext = context.viewContext
        let fetchRequest = NSFetchRequest<CD_Creature>(entityName: "CD_Creature")
//        fetchRequest.predicate = NSPredicate.init(format: "name = %@",
//                                                  creatureName)
        let creaturesToDelete = try! managedObjectContext.fetch(fetchRequest)
        
        
        for creature in creaturesToDelete {
            managedObjectContext.delete(creature)
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("could not delete")
        }
    }

    func generateNewData() {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer
        var managedObjectContext: NSManagedObjectContext!
        managedObjectContext = context.viewContext
        
        
        var newAmphibian =
            Creature(category: .Amphibians, title: "A slimy toad",
                     creatureDescription: "A pretty cool frog",
                     location: CLLocation(latitude: 43.22, longitude: -123.55),
                     locationDescription: "In a swap near Thriftys",
                     dateSeen: Date(), image: #imageLiteral(resourceName: "amphibians"))
        
        var newBird =
            Creature(category: .Birds, title: "Bluebird",
                     creatureDescription: "A pretty cool frog",
                     location: CLLocation(latitude: 41.22, longitude: -122.55),
                     locationDescription: "In a tree by Walmart",
                     dateSeen: Date(), image: #imageLiteral(resourceName: "birds"))
        
        var newReptile =
            Creature(category: .Reptiles, title: "Cool Lizard",
                     creatureDescription: "A pretty cool lizazd",
                     location: CLLocation(latitude: 41.92, longitude: -121.55),
                     locationDescription: "In a pet shop",
                     dateSeen: Date(), image: #imageLiteral(resourceName: "reptiles"))
        
        var newMammal =
            Creature(category: .Mammals, title: "Male Lion",
                     creatureDescription: "What a beast",
                     location: CLLocation(latitude: 40.92, longitude: -114.55),
                     locationDescription: "On safari",
                     dateSeen: Date(), image: #imageLiteral(resourceName: "Mammals"))

        
        
        creatureList.append(newAmphibian)
        creatureList.append(newBird)
        creatureList.append(newReptile)
        creatureList.append(newMammal)
        let cdNewAmphibian = CD_Creature(context: managedObjectContext)
        let cdNewBird = CD_Creature(context: managedObjectContext)
        let cdNewReptile = CD_Creature(context: managedObjectContext)
        let cdNewMammal = CD_Creature(context: managedObjectContext)
        cdNewAmphibian.copyCreature(newItem: newAmphibian)
        appDelegate.saveContext()
        cdNewBird.copyCreature(newItem: newBird)
        appDelegate.saveContext()
        cdNewReptile.copyCreature(newItem: newReptile)
        appDelegate.saveContext()
        cdNewMammal.copyCreature(newItem: newMammal)
        appDelegate.saveContext()
    }
    
    
    
    
    
}
