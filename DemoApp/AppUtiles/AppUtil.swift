//
//  AppUtil.swift
//  OnSide
//
//  Created by Mehul Parmar on 14/03/16.
//  Copyright © 2016 Openxcell. All rights reserved.
//

import UIKit
import Reachability

// MARK: Reachability class
func isNetworkAvailable() -> Bool {
    let reachability: Reachability = Reachability.forInternetConnection()
    let networkStatus = reachability.currentReachabilityStatus()
    var isAvailable  = false;
    
    switch networkStatus {
    case .NotReachable:
        isAvailable = false;
        break;
    case .ReachableViaWiFi:
        isAvailable = true;
        break;
    case .ReachableViaWWAN:
        isAvailable = true;
        break;
    }
    return isAvailable;
}

func setCornurRedius(_ idObject: UIView, radius: CGFloat) {
    idObject.layer.cornerRadius = radius;
    idObject.layer.masksToBounds = true
}

func setBorder(_ idObject: UIView, width: CGFloat, color:UIColor) {
    idObject.layer.borderWidth = width;
    idObject.layer.borderColor = color.cgColor;
    idObject.layer.masksToBounds = true
}

func showAlert(_ message:NSString, ViewController: UIViewController) {
    
    _ = UIAlertAction(title: "OK", style: .default) { (action) in
        // ...
    }
    
//    AlertView.sharedInstance().showAlert(for: ViewController, withTitle: Constants.kAppName, andMessage: message as String!, withArrayOfTotalActions: [OKAction], andCompletion: nil)
}

func isStringEmpty(_ string:String) -> Bool {
    
    let str = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    
    if str.length > 0 {
        return false
    }
    else {
        return true
    }
}

enum UserType:String {
    
    case Fresh      = "0"
    case Login      = "1"
    case SignUp     = "2"
    case Facebook   = "3"
    case Google     = "4"
    
}

enum SocialType:String {
    
    case Noramal      = "0"
    case Facebook     = "1"
    case Google       = "2"
    
}

//MARK: *** Api Type ***
enum SortBy:String {
    
    case Date        = "0"
    case Price       = "1"
    
}

//MARK: *** Api Type ***
enum BookingStatus:String {
    
    case All                = ""
    case Expired            = "0"
    case Confirmed          = "2"
    
}

//MARK: *** Api Type ***
enum ApiType:String {
    
    case Post      = "POST"
    case Get       = "GET"
    
}

//MARK: *** Types of Unit ***

enum UnitType:Int {
    
    case MILES  = 1
    case KM     = 0
}


// MARK: *** Gender ***

enum Gender:String {
    
    case Male   = "Male"
    case Female = "Female"
    case Other  = "Custom"
}

enum UserAs:String {
    
    case Passenger = "1"
    case Driver = "2"
}


//MARK: *** Fonts ***

enum Fonts:String {
    
    case FontFamily
    var OpenSans:String{
        return "OpenSans"
    }
    var Nexa:String{
        return "Nexa"
    }
}

enum OpenSans:String {
    
    case Style
    
    var Regular:String{
        return "Regular"
    }
    var Bold:String{
        return "Bold"
    }
    var Italic:String{
        return "Italic"
    }
    var SemiBold:String{
        return "SemiBold"
    }
}

enum Nexa:String {
    
    case Style
    var Regular:String{
        return "Nexa"
    }
    var Bold:String{
        return "NexaBold"
    }
    var Heavy:String{
        return "NexaHeavy"
    }
    var XBold:String{
        return "NexaXBold"
    }
}



class Enumerations: NSObject {
    
}
