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
    let alertController = UIAlertController(title: "Data Options", message: "What would you like to do?", preferredStyle: .actionSheet)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataModel.loadData(delegate:(UIApplication.shared.delegate) as! AppDelegate)
        
        let generateButton = UIAlertAction(title: "Generate Sample Data", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            
            self.dataModel.generateNewData()
            self.dataModel.loadData(delegate: (UIApplication.shared.delegate) as! AppDelegate)
        })
        
        let  deleteButton = UIAlertAction(title: "Delete All Data", style: .destructive, handler: { (action) -> Void in
            print("Delete button tapped")
            
            self.dataModel.deleteAllData()
            self.dataModel.loadData(delegate: (UIApplication.shared.delegate) as! AppDelegate)
        })
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancel button tapped")
        })
        
        alertController.addAction(generateButton)
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
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
    
    
    @IBAction func optionsBtnClicked(_ sender: Any) {
        

        
        self.present(alertController, animated: true, completion: nil)
        
    }
    

    
}

