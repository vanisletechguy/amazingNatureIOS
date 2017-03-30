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
        print("herefirst")
        if indexPath.row == 1 {

            print("clicked here")
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        //prepare(for: subCategoryListSegue, sender: indexPath)
        
        let animalData = "racoon"
        
        performSegue(withIdentifier: "subCategoryListSegue", sender: animalData)
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationNavC = segue.destination as! UINavigationController
//        let destinationVC = destinationNavC.topViewController as! MapViewController
//        destinationVC.location = itemToEdit?.locationCoord
    
    
    
}
