//
//  ItemDetailViewController.swift
//  AmazingNature
//
//  Created by vm mac on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit
import CoreLocation

class ItemDetailViewController: UITableViewController {

    
    @IBOutlet weak var nameOfTheItem: UITextField!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var locationDescription: UITextField!
   
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var location: CLLocation?
    var locationManager = CLLocationManager()
    var creatureToEdit:Creature? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a test creature
        let newLocation = CLLocation(latitude: 49.9, longitude: -126.4)
        let newDate = Date();
        
        let newImage = UIImage()
        creatureToEdit = Creature(category: CreatureCategory.Amphibians, title: "Cool Frog", description: "a frog i saw at the lake", location: newLocation, locationDescription: "Some Location description", dateSeen: newDate, image: newImage)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            pickPhoto()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
    }
    
    
    func show(image: UIImage) {
        itemImage.image = image
        itemImage.isHidden = false
        itemImage.frame = CGRect(x: 10, y: 10, width: 260, height: 260)
        //addPhotoLabel.isHidden = true
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
        
        creatureToEdit?.image = info[UIImagePickerControllerEditedImage] as? UIImage
        
        if let theImage = creatureToEdit?.image {
            show(image: theImage)
        }
        
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

