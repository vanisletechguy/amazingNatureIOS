//
//  MapDetailViewController.swift
//  AmazingNature
//
//  Created by vm mac on 2017-04-03.
//  Copyright © 2017 Michael Aubie. All rights reserved.
//

import UIKit
import MapKit

class MapDetailViewController: UIViewController, MKMapViewDelegate{
    var location: CLLocation?

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //location = CLLocation(latitude: 47.5, longitude: -124.3)
        mapView.frame = self.view.bounds
        let coordinateRegion =
            MKCoordinateRegionMakeWithDistance((location?.coordinate)!, 500, 500)
        mapView.setRegion(coordinateRegion, animated: true)
        
        
        let annotation = MKPointAnnotation()
        let annotation2 = MKAnnotationView()
        annotation.coordinate = (location?.coordinate)!
        annotation2.annotation = annotation
    
       annotation2.isEnabled = true
       annotation2.isDraggable = true
        
        
        //mapView.addAnnotation(annotation2)
        mapView.addAnnotation(annotation);
        //mapView.addAnnotation(annotation);
        
        
        mapView.delegate = self

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
            }
            else {
                pinView!.annotation = annotation
            }
            
            return pinView
        
        
        
        
        
        
        
//        if (annotation is MKUserLocation) {
//            return nil
//        }
//        let reuseId = "test"
//        var anView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
//        if anView == nil {
//            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            anView?.image = UIImage(named:"xaxas")
//            anView?.canShowCallout = true
//        }
//        else {
//            //we are re-using a view, update its annotation reference...
//            anView?.annotation = annotation
//        }
//        
//        return anView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
