//
//  AllCategoriesTableViewController.swift
//  AmazingNature
//
//  Created by vm mac on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit

class AllCategoriesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
       var category = ""
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                category = "mammals"
                break
            case 1:
                category = "Birds"
                break
            case 2:
                category = "Fish"
                break
            case 3:
                category = "Reptiles"
                break
            case 4:
                category = "Amphibians"
                break
            case 5:
                category = "Invertebrates"
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
                break
            case 1:
                category = "Flowers"
                break
            case 2:
                category = "Fungi"
                break
            case 3:
                category = "Other"
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
                break
            case 1:
                category = "Rivers"
                break
            case 2:
                category = "Lakes"
                break
            case 3:
                category = "Rocks"
                break
            case 4:
                category = "Waterfalls"
                break
            default:
                category = ""
                break
            }
            break
        default:
            break
        }
        print(category)
        
        
        
//        if indexPath.row == 1 {
//            print("Birds")
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
        
        //prepare(for: subCategoryListSegue, sender: indexPath)
        
        let animalData = "racoon"
        
        performSegue(withIdentifier: "subCategoryListSegue", sender: animalData)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationNavC = segue.destination as! UINavigationController
//        let destinationVC = destinationNavC.topViewController as! MapViewController
//        destinationVC.location = itemToEdit?.locationCoord
    
    
    
}
