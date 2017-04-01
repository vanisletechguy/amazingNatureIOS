//
//  ViewController.swift
//  AmazingNature
//
//  Created by vm mac on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataModel: DataModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let delegate = UIApplication.shared.delegate
        dataModel.loadData(delegate:(UIApplication.shared.delegate) as! AppDelegate)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabbarController = segue.destination as! UITabBarController
        let navVC = tabbarController.viewControllers?[0] as! UINavigationController
        let categoriesVC = navVC.topViewController as! AllCategoriesTableViewController
    }
}

