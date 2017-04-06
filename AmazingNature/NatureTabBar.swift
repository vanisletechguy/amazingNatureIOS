//
//  NatureTabBar.swift
//  AmazingNature
//
//  Created by vm mac on 2017-04-04.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit

class NatureTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 0 { // clicked on category view
        }
        else if item.tag == 1 { // clicked on map view
            if self.selectedIndex == 0 {
                let tabBarController = tabBar.delegate
                    as! UITabBarController
                let destinationNavigationController =
                    tabBarController.viewControllers?[1]
                        as! UINavigationController
                let destinationController =
                    destinationNavigationController.topViewController as!
                MapViewController
                destinationController.creatures =
                    ((tabBarController.viewControllers?[0] as!
                        UINavigationController).topViewController
                        as!AllCategoriesTableViewController)
                        .dataModel.creatureList
            }
            else if self.selectedIndex == 1 {
            }
        }
    }
}
