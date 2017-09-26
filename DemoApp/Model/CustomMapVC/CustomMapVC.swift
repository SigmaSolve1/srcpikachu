//
//  CustomMapVC.swift
//  DemoApp
//
//  Created by Deval on 03/08/17.
//  Copyright © 2017 Prudent. All rights reserved.
//

import UIKit
import MapKit

class CustomMapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //        let location = CLLocationCoordinate2D(
        //            latitude: 23.0225,
        //            longitude: 72.5714
        //        )
        //
        ////        let location2 = CLLocationCoordinate2D(
        ////            latitude: 19.0760,
        ////            longitude: 72.8777
        ////        )
        //        let span = MKCoordinateSpanMake(0.05, 0.05)
        //        let region = MKCoordinateRegion(center: location, span: span)
        //        mapView.setRegion(region, animated: true)
        //
        //        let annotation = MKPointAnnotation()
        //        annotation.coordinate = location
        //        annotation.title = "INDIA"
        //        annotation.subtitle = "Ahmedabad"
        //        mapView.addAnnotation(annotation)
        
        let latitude:CLLocationDegrees = 23.0225
        let longitude:CLLocationDegrees = 72.5714
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        //Second Location lat and long
        let latitudeSec:CLLocationDegrees = 23.2156
        let longitudeSec:CLLocationDegrees = 72.6369
        
        let locationSec:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitudeSec, longitudeSec)
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(1, 1)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        let myAn1 = MyAnnotation(title: "India", coordinate: location, subtitle: "Ahmedabad");
        let myAn2 = MyAnnotation(title: "India", coordinate: locationSec, subtitle: "Gandhinagar");
        
        mapView.addAnnotation(myAn1);
        mapView.addAnnotation(myAn2);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                
                let ObjCustomMapVC = Constants.mainStoryboard.instantiateViewController(withIdentifier: "CustomMapVC") as! CustomMapVC
                self.navigationController?.pushViewController(ObjCustomMapVC, animated: false)
                
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                
                let ObjMultiplePinVC = Constants.mainStoryboard.instantiateViewController(withIdentifier: "MultiplePinVC") as! MultiplePinVC
                self.navigationController?.pushViewController(ObjMultiplePinVC, animated: false)
                
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
}
