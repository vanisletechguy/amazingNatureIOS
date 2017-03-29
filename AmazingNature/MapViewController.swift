//
//  MapViewController.swift
//  AmazingNature
//
//  Created by vm mac on 2017-03-29.
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
        let coordinateRegion =
            MKCoordinateRegionMakeWithDistance((location?.coordinate)!, 500, 500)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let annotation = MKPointAnnotation();
        annotation.coordinate = (location?.coordinate)!;
        mapView.addAnnotation(annotation);


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }

}
