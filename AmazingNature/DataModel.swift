//
//  DataModel.swift
//  AmazingNature
//
//  Created by vm mac on 2017-03-31.
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
        
        
        
        let x = context
        let y = context.viewContext

        
        let fetchRequest = NSFetchRequest<CD_Creature>(entityName: "CD_Creature")
        do {
            
            cdCreatureList = try managedObjectContext.fetch(fetchRequest)
            print("was able to fetch")
            importFromCoreData(cdCreatureList: cdCreatureList, context: managedObjectContext)
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
            let newCreature:Creature =
                Creature(category: CreatureCategory(rawValue: Int(($0 as! CD_Creature).category))!,
                         title: ($0 as! CD_Creature).name!,
                         creatureDescription: ($0 as! CD_Creature).description,
                         location: CLLocation(latitude: ($0 as! CD_Creature).latitude, longitude: ($0 as! CD_Creature).latitude),
                         locationDescription: ($0 as! CD_Creature).location!,
                         dateSeen: ($0 as! CD_Creature).date as! Date,
                         image: UIImage())
            
            creatureList.append(newCreature)
            
            let fetchRequest = NSFetchRequest<CD_Creature>(entityName: "CD_Creature")
            //fetchRequest.predicate = NSPredicate.init(format: "inProvince = %@", $0)
            
//            let creatureList = try! context.fetch(fetchRequest)
//            print("size of attraction list " + creatureList.count.description)
//            DataModel.lists[DataModel.lists.count-1].items = attractionList.map{
//                return $0.toAttractionList()
//            }
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
        
        let fetchRequest = NSFetchRequest<CD_Creature>(entityName: "CD_Creature")
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
    
    
    
    
}
