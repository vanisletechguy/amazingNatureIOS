//
//  MapViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit
import MapKit

//protocol MapViewControllerDelegate {
////    func passCreatureLocations()
//}
class MapViewController: UIViewController {

    var location: CLLocation?
    var creatures = [Creature]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = CLLocation(latitude: 49.5, longitude: -128.3)
        mapView.frame = self.view.bounds
        var coordinateRegion = MKCoordinateRegionMakeWithDistance(
            (location?.coordinate)!, 500, 500)
        coordinateRegion.span.latitudeDelta = 50
        coordinateRegion.span.longitudeDelta = 50
        mapView.setRegion(coordinateRegion, animated: true)
        //mapView.camera.set
       
        
        let annotation = MKPointAnnotation();
        annotation.coordinate = (location?.coordinate)!;
        mapView.addAnnotation(annotation);
        print("there are " + creatures.count.description + " creatures")
        
        for creature in creatures {
            let newAnnotation = MKPointAnnotation();
            newAnnotation.coordinate = (creature.location.coordinate)
            newAnnotation.title = creature.title
            newAnnotation.subtitle = creature.locationDescription
            mapView.addAnnotation(newAnnotation);
            print(newAnnotation.coordinate.longitude.description)
            print(newAnnotation.coordinate.latitude.description)
        }
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backBtnPressed(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }

}
