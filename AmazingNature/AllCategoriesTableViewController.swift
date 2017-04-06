//
//  AllCategoriesTableViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit

class AllCategoriesTableViewController: UITableViewController,
SubCategoriesProtocol {
    var dataModel: DataModel!
    var creaturesToSend = [Creature]()
    var categoryToSend = CreatureCategory.Amphibians
    
    @IBOutlet weak var BirdsCell: UITableViewCell!
    
    @IBOutlet weak var MammalsCell: UITableViewCell!
    
    @IBOutlet weak var FishCell: UITableViewCell!
    
    @IBOutlet weak var ReptilesCell: UITableViewCell!
    
    @IBOutlet weak var AmphibiansCell: UITableViewCell!
    
    @IBOutlet weak var InvertebratesCell: UITableViewCell!
    
    @IBOutlet weak var TreesCell: UITableViewCell!
    
    @IBOutlet weak var FlowersCell: UITableViewCell!
    
    @IBOutlet weak var FungiCell: UITableViewCell!
    
    @IBOutlet weak var PlantsOtherCell: UITableViewCell!
    
    @IBOutlet weak var CliffsCell: UITableViewCell!
    
    @IBOutlet weak var RiversCell: UITableViewCell!
    
    @IBOutlet weak var LakesCell: UITableViewCell!
    
    @IBOutlet weak var RocksCell: UITableViewCell!
    
    @IBOutlet weak var WaterfallsCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsInfo()
    }

    func setCellsInfo() {
        
        var creatures = [Creature]()
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Mammals})
        MammalsCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Birds})
        BirdsCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Fish})
        FishCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Reptiles})
        ReptilesCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Amphibians})
        AmphibiansCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Invertebrates})
        InvertebratesCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Trees})
        TreesCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Flowers})
        FlowersCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Fungi})
        FungiCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.PlantOther})
        PlantsOtherCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Cliffs})
        CliffsCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Rivers})
        RiversCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Lakes})
        LakesCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Rocks})
        RocksCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
        creatures = dataModel.creatureList.filter(
            {$0.category == CreatureCategory.Waterfalls})
        WaterfallsCell.detailTextLabel?.text =
            String(creatures.count.description + " items")
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
        destinationVC.delegate = self
    }
    
    func didChangeData(dataModel: DataModel) {
        self.dataModel = dataModel
        dataModel.loadData(delegate:(UIApplication.shared.delegate)
            as! AppDelegate)
        setCellsInfo()
        tableView.reloadData()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
