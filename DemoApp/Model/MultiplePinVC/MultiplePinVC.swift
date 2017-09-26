//
//  MultiplePinVC.swift
//  DemoApp
//
//  Created by Deval on 08/08/17.
//  Copyright © 2017 Prudent. All rights reserved.
//

import UIKit
import MapKit
import SVProgressHUD
import Alamofire
import SwiftyJSON
import GoogleMaps

struct temp {
    let strLat : String
    let strLong : String
    let strTitle : String

    init(strLat: String, strLong: String, strTitle: String) {
        self.strLat = strLat
        self.strLong = strLong
        self.strTitle = strTitle
    }
}


class MultiplePinVC: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var viewGoogleMap1: GMSMapView!

    var arrLogModel = [MyModel]()
    var arrTemp = [temp]()
    
    var locationManager: CLLocationManager!

    var logoImages = Array<Any>()
    
    var longitudes:[Double]!
    var latitudes:[Double]!
    var architectNames:[String]!
    var completedYear:[String]!
    
    
    let arrLocation = CLLocation()
    var allLocations = NSArray()
    
    var currentUserLocation = [CLLocation]()

    var closestLocation = [CLLocation]()
    

    let closestLocationDistance : CLLocationDistance = 1000
    var nearestLocations = [CLLocation]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.locationManager = CLLocationManager()
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self as CLLocationManagerDelegate
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()

        
        self.MapviewWebservice()


                let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
                swipeRight.direction = UISwipeGestureRecognizerDirection.right
                self.view.addGestureRecognizer(swipeRight)
        
                let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
                swipeLeft.direction = UISwipeGestureRecognizerDirection.left
                self.view.addGestureRecognizer(swipeLeft)
        
 
    }
    

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")

                let ObjCustomMapVC = Constants.mainStoryboard.instantiateViewController(withIdentifier: "TablewDataVC") as! TablewDataVC
                self.navigationController?.pushViewController(ObjCustomMapVC, animated: false)

            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")

            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    @IBAction func btnBackClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: false)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//The list needs to be sorted relative to the the current location of the user
   
    func MapviewWebservice() {
        AllService().PdfDownload( success: { (response) in
            if let arrTable = response.dictionary {
                var arrTemp : [MyModel] = []

                for dict in arrTable {
                    let model = ModelManager.sharedInstance.getMyModel(dict.value.dictionaryObject! as NSDictionary)
                    arrTemp.append(model)

                }
                self.arrLogModel = arrTemp

                self.viewGoogleMap1 = GMSMapView(frame: self.view.frame)
                self.view.addSubview(self.viewGoogleMap1)
                self.viewGoogleMap1.delegate = self as? GMSMapViewDelegate

                for i in 0...self.arrLogModel.count-1 {
                    let coordinates = CLLocationCoordinate2D(latitude: Double(self.arrLogModel[i].lon)!, longitude: Double(self.arrLogModel[i].lon)!)

                    let marker = GMSMarker(position: coordinates)
                    marker.map = self.viewGoogleMap1
                    
                    marker.icon = GMSMarker.markerImage(with: self.randomColor())
                
                    marker.title = self.arrLogModel[i].name

                    
                    if ((self.arrLogModel[i].name) == nil){
                    
                          marker.icon = UIImage(named: "\(i)")
                    }
                    else{
                    
                    }

                    marker.accessibilityLabel = "\(i)"
                }
            }
        })
        { (error) in
            print(error as Any)
        }
    }
    
    func randomColor() -> UIColor{
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
   


}
