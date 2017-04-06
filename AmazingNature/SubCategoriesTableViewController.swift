//
//  SubCategoriesTableViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-31.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit

class SubCategoriesTableViewController: UITableViewController,
                                        ItemDetailViewControllerDelegate {
    var creatures = [Creature]()
    var dataModel: DataModel!
    var category = CreatureCategory.Amphibians
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(category)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return creatures.count
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CreatureListItem", for: indexPath)
        let item = creatures[indexPath.row]
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.title

        return cell
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController,
                                  didFinishAdding creature: Creature) {
        dataModel.addNewCreature(newCreature: creature)
        let newRowIndex = creatures.count
        creatures.append(creature)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        controller.dismiss(animated: true, completion: nil)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController,
                                  didFinishEditing creature: Creature) {
        if let index = creatures.index(of: creature) {
            dataModel.editedCreature(editedCreature: creature,
                                     oldCreatureName: controller.oldName)
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                let item = creatures[indexPath.row]
                let label = cell.viewWithTag(1000) as! UILabel
                label.text = item.title
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func itemDetailViewControllerDidCancel(_ controller:
        ItemDetailViewController) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewItemSegue" {
            let navigationController =
                segue.destination as! UINavigationController
            let controller = navigationController.topViewController as!
            ItemDetailViewController
            controller.delegate = self
            controller.creatureCategory = category
        } else if segue.identifier == "editItemSegue" {
            let navigationController =
                segue.destination as! UINavigationController
            let controller = navigationController.topViewController as!
            ItemDetailViewController
            controller.delegate = self
            controller.creatureCategory = category
            if let indexPath = tableView.indexPath(
                for: sender as! UITableViewCell) {
                controller.creatureToEdit = creatures[indexPath.row]
                controller.title = creatures[indexPath.row].title
            }
        }
    }
}
