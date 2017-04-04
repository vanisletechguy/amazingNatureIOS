//
//  MapDetailViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-04-03.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit
import MapKit

protocol MapDetailViewControllerDelegate: class {
    func didChangeLocation(newLocation: CLLocation)
}

class MapDetailViewController: UIViewController, MKMapViewDelegate{
    var location: CLLocation?
    var creatureTitle = ""
    var image: UIImage?
    weak var delegate: MapDetailViewControllerDelegate?
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.frame = self.view.bounds
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(
            (location?.coordinate)!, 500, 500)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let annotation = MKPointAnnotation()
        
        //let annotation2 = MKAnnotationView()
        annotation.coordinate = (location?.coordinate)!
        annotation.title = creatureTitle
        //annotation2.annotation = annotation
    
       //annotation2.isEnabled = true
       //annotation2.isDraggable = true
        
        
        //mapView.addAnnotation(annotation2)
        mapView.addAnnotation(annotation);
        

        mapView.delegate = self

    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        switch newState {
        case .starting:
            //view.dragState = .dragging
            break
            
        case .ending:
            view.dragState = .none
                        let newLatitude = view.annotation?.coordinate.latitude
                        let newLongitude = view.annotation?.coordinate.longitude
                        let newLocation = CLLocation(latitude: newLatitude!, longitude: newLongitude!)
                       updateMarker(newLocation: newLocation)
            break
        case .canceling:
            view.dragState = .none
            break
            
        default: break
        }
    }
    
    func updateMarker(newLocation: CLLocation) {
        print("GOT TO UPDATE MARKER")
        location = newLocation
        delegate?.didChangeLocation(newLocation: location!)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
            if annotation is MKUserLocation {
                //return nil so map view draws "blue dot" for standard user location
                return nil
            }
        
            let reuseId = "pin"
            var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
            if pinView == nil {
                pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                
                pinView!.canShowCallout = true
                pinView!.animatesDrop = true
                pinView!.pinColor = .purple
                pinView?.isDraggable = true
                
            }
            else {
                pinView!.annotation = annotation
            }
            
            return pinView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
