//
//  mapObject.swift
//  DemoApp
//
//  Created by Nishant on 21/09/17.
//  Copyright © 2017 Prudent. All rights reserved.
//

import UIKit
import GoogleMaps

class mapObject: NSObject {

    var title : String?
    var subTit : String?
    var coordinate : CLLocationCoordinate2D

    init(title:String,coordinate : CLLocationCoordinate2D,subtitle:String){

        self.title = title;
        self.coordinate = coordinate;
        self.subTit = subtitle;
    }
}
