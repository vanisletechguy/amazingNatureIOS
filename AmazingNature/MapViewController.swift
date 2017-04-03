//
//  MapViewController.swift
//  AmazingNature
//
//  Created by Michael Aubie on 2017-03-29.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var location: CLLocation?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        location = CLLocation(latitude: 49.5, longitude: -128.3)
        mapView.frame = self.view.bounds
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(
            (location?.coordinate)!, 500, 500)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let annotation = MKPointAnnotation();
        annotation.coordinate = (location?.coordinate)!;
        mapView.addAnnotation(annotation);

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backBtnPressed(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }

}
