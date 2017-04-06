//
//  ItemDetailViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit
import CoreLocation

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller:
        ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController,
                                  didFinishAdding item: Creature)
    func itemDetailViewController(_ controller: ItemDetailViewController,
                                  didFinishEditing item: Creature)
}


class ItemDetailViewController: UITableViewController, MapDetailViewControllerDelegate {
    let defaultLocation = CLLocation(latitude: 47.823, longitude: -124.897)
    @IBOutlet weak var nameOfTheItem: UITextField!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var locationDescription: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var doneBarBtn: UIBarButtonItem!
    @IBOutlet weak var dateSeen: UILabel!
    @IBOutlet weak var coordsLabel: UILabel!
    var location: CLLocation?
    var locationManager = CLLocationManager()
    var creatureToEdit:Creature? = nil
    var oldName: String = ""
    var creatureCategory: CreatureCategory = CreatureCategory.Amphibians
    weak var delegate: ItemDetailViewControllerDelegate?
    var creatureImage: UIImage?
    var pickingDate = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = defaultLocation
        doneBarBtn.isEnabled = true
        itemImage.image = #imageLiteral(resourceName: "flowers")
        if((creatureToEdit) != nil) {
            loadCreature()
        }
    }

    func loadCreature() {
        nameOfTheItem.text = creatureToEdit?.title
        locationDescription.text = creatureToEdit?.locationDescription
        datePicker.setDate((creatureToEdit?.dateSeen)!, animated: true)
        dateSeen.text = datePicker.date.description
        location = creatureToEdit?.location
        if(location == nil) {
            location = defaultLocation
        }
        var coordsDesc = ""
        coordsDesc += (creatureToEdit?.location.coordinate.latitude.description)!
        coordsDesc += " " + (creatureToEdit?.location.coordinate.longitude.description)!
        coordsLabel.text = coordsDesc
        if(creatureToEdit?.image != nil) {
            show(image: (creatureToEdit?.image)!)
        } else {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-YYYY"
        dateSeen.text = dateFormatter.string(from: datePicker.date)
        pickingDate = false
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            pickPhoto()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return itemImage.isHidden ? 44 : 280
        } else if indexPath.row == 3{
            return 88
        } else if indexPath.row == 5 {
            if(pickingDate){
                return 88
            } else {
                return 0
            }
            }
        return 44
    }

    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        if let creature = creatureToEdit {
            oldName = (creatureToEdit?.title)!
            creature.title = nameOfTheItem.text!
            creature.location = location!
            creature.dateSeen = datePicker.date
            creature.category = creatureCategory
            creature.image = itemImage.image
            delegate?.itemDetailViewController(self, didFinishEditing: creature)
            
        } else {
            let creature =
                Creature(category: creatureCategory,
                         title: nameOfTheItem.text!,
                         creatureDescription: locationDescription.text!,
                         location: location!,
                         locationDescription: "Some place I saw it",
                         dateSeen: datePicker.date,
                         image: itemImage.image!)
        
            delegate?.itemDetailViewController(self, didFinishAdding: creature)
        }
    }
    
    func show(image: UIImage) {
        itemImage.image = image
        itemImage.isHidden = false
        itemImage.frame = CGRect(x: 10, y: 10, width: 260, height: 260)
    }
    
    
    @IBAction func changeDateBtnclicked(_ sender: Any) {
        pickingDate = true
        tableView.reloadData()
    }
    
    @IBAction func useCurrentBtnClicked(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "MapDetailSegue") {
            let navVC = segue.destination as! UINavigationController
            let mapDetailVC =
                navVC.topViewController as! MapDetailViewController
            mapDetailVC.delegate = self
            if(creatureToEdit?.location != nil) {
            mapDetailVC.location = CLLocation(
                latitude: (creatureToEdit?.location.coordinate.latitude)!,
                longitude: (creatureToEdit?.location.coordinate.longitude)!)
                mapDetailVC.creatureTitle = (creatureToEdit?.title)!
            } else {
                mapDetailVC.location =
                    CLLocation(latitude: 47.5, longitude: -124.3)
            }
        }
    }
    
    func didChangeLocation(newLocation: CLLocation) {
        creatureToEdit?.location = newLocation
        location = newLocation
        var coordsDesc = ""
        coordsDesc += (creatureToEdit?.location.coordinate.latitude.description)!
        coordsDesc += " "
        coordsDesc += (creatureToEdit?.location.coordinate.longitude.description)!
        coordsLabel.text = coordsDesc
    }
}

extension ItemDetailViewController: UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    func pickPhoto() {
        if true || UIImagePickerController.isSourceTypeAvailable(.camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let alertController = UIAlertController(title: nil, message: nil,
                                                preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        let takePhotoAction =
            UIAlertAction(title: "Take Photo", style: .default,
                          handler: { _ in self.takePhotoWithCamera() })
        alertController.addAction(takePhotoAction)
        let chooseFromLibraryAction =
            UIAlertAction(title: "Choose From Library",
                          style: .default, handler: { _ in self
                            .choosePhotoFromLibrary() })
        
        alertController.addAction(chooseFromLibraryAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : Any]) {
        
        creatureImage = UIImage()
        creatureImage? = (info[UIImagePickerControllerEditedImage] as? UIImage)!
        
        if let theImage = creatureImage {
            show(image: theImage)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

