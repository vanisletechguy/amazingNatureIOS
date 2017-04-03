//
//  AllCategoriesTableViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit

class AllCategoriesTableViewController: UITableViewController {
    var dataModel: DataModel!
    var creaturesToSend = [Creature]()
    var categoryToSend = CreatureCategory.Amphibians
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
       var category = ""
        var creatures = [Creature]()
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                category = "mammals"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Mammals})
                categoryToSend = .Mammals
                break
            case 1:
                category = "Birds"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Birds})
                categoryToSend = .Birds
                break
            case 2:
                category = "Fish"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Fish})
                categoryToSend = .Fish
                break
            case 3:
                category = "Reptiles"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Reptiles})
                categoryToSend = .Reptiles
                break
            case 4:
                category = "Amphibians"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Amphibians})
                categoryToSend = .Amphibians
                break
            case 5:
                category = "Invertebrates"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Invertebrates})
                categoryToSend = .Invertebrates
                break
            default:
                category = ""
                break
            }
            break
        case 1:
            switch indexPath.row {
            case 0:
                category = "Trees"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Trees})
                categoryToSend = .Trees
                break
            case 1:
                category = "Flowers"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Flowers})
                categoryToSend = .Flowers
                break
            case 2:
                category = "Fungi"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Fungi})
                categoryToSend = .Fungi
                break
            case 3:
                category = "Other"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.PlantOther})
                categoryToSend = .PlantOther
                break
            default:
                category = ""
                break
            }
            break
        case 2:
            switch indexPath.row {
            case 0:
                category = "Cliffs"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Cliffs})
                categoryToSend = .Cliffs
                break
            case 1:
                category = "Rivers"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Rivers})
                categoryToSend = .Rivers
                break
            case 2:
                category = "Lakes"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Lakes})
                categoryToSend = .Lakes
                break
            case 3:
                category = "Rocks"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Rocks})
                categoryToSend = .Rocks
                break
            case 4:
                category = "Waterfalls"
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.Waterfalls})
                categoryToSend = .Waterfalls
                break
            default:
                category = ""
                creatures = dataModel.creatureList.filter(
                    {$0.category == CreatureCategory.GeoOther})
                categoryToSend = .GeoOther
                break
            }
            break
        default:
            break
        }
        creaturesToSend = creatures
        performSegue(withIdentifier: "subCategoryListSegue", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationNavC = segue.destination as! UINavigationController
        let destinationVC = destinationNavC.topViewController
            as! SubCategoriesTableViewController
        destinationVC.creatures = creaturesToSend
        destinationVC.dataModel = dataModel
        destinationVC.category = categoryToSend
    }
}
