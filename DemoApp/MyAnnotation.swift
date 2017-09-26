//
//  MyAnnotation.swift
//  CollectionDemo
//
//  Created by Nishant on 22/07/17.
//  Copyright © 2017 classroom. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject,MKAnnotation {

    var title : String?
    var subTit : String?
    var coordinate : CLLocationCoordinate2D

    init(title:String,coordinate : CLLocationCoordinate2D,subtitle:String){

        self.title = title;
        self.coordinate = coordinate;
        self.subTit = subtitle;
        
    }
}
