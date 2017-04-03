//
//  ViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataModel: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.loadData(delegate:(UIApplication.shared.delegate) as! AppDelegate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabbarController = segue.destination as! UITabBarController
        let navVC = tabbarController.viewControllers?[0] as! UINavigationController
        let categoriesVC = navVC.topViewController as! AllCategoriesTableViewController
        categoriesVC.dataModel = dataModel
    }
}

