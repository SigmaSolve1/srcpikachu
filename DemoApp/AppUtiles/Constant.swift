//
//  Constant.swift
//  Notecheck
//
//  Created by Mehul on 20/01/16.
//  Copyright © 2016 OpenXcell Studio. All rights reserved.
//

import Foundation
import UIKit


struct Screen {
    static let STATUS_BAR_HEIGHT        =   20.0
    static let NAVIGATION_BAR_HEIGHT    =   44.0

    static let width                = UIScreen.main.bounds.size.width
    static let height               = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(Screen.width, Screen.height)
    static let SCREEN_MIN_LENGTH    = min(Screen.width, Screen.height)

    static let isIphone4            = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH < 568.0
    static let isIphone5            = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH == 568.0
    static let isIphone6            = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH == 667.0
    static let isIphone6Plus        = UIDevice.current.userInterfaceIdiom == .phone && Screen.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && Screen.SCREEN_MAX_LENGTH == 1024.0

}

struct Constants {
    //Hotel Bids constants
    static let kAppName                 = "SilverGiftz"
    static let kAppIdentifier           = "com.Affluence.SilverGiftz"
    static let kImageBaseURL            = "http://www.silvergiftz.com/images/"
    static let kBtnBaseURL              = "https://www.google.co.in/"
   
    static let KEY_Authorization        = "Authorization"
    static let KEY_remember_token       = "remember-token"
    
    static let KEY_UserDataModel        = "UserDataModel"
    
    static let hbDeviceToken            = "MyDeviceToken"
    static let hbUserStatus             = "UserStatus"
    static let hbUserData               = "UserData"
    
    static let hbUserChipID             = "chipID"
    static let hbUserCountry            = "userCountry"

    static let appDelegate              = UIApplication.shared.delegate as! AppDelegate
    static let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)

    //Service responce
    static let kUnAuthotized = NSLocalizedString("Invalid session, please login again", comment: "")
    static let kNoInternet = NSLocalizedString("No active internet connection.", comment: "")
    
    //User Default constant
    static let KEY_Xapi                             = "Xapi"
    static let KEY_Language                         = "language"
    static let KEY_USER_ID                          = "userid"
    static let KEY_AccessToken                      = "Accesstoken"
    static let KEY_DEVICE_TOKEN                     = "Device_Token"
    
    static let KEY_LOGIN_STATUS                     = "LogInStatus"
    static let KEY_NOTIFICATION_TYPE                = "Notification"
    static let KEY_UserModel                        = "userModel"
    static let KEY_Notification_STATUS              = "Notification Status"
    
    static let KEY_SelectProductModel                = "SelectProductModel"
    static let KEY_SelectProductModelArr             = "SelectProductModelArr"
   
    static let KEY_SelectBranchModel                = "SelectBranchModel"
    static let KEY_SelectBranchModelArr              = "SelectBranchModelArr"

    static let KEY_SelectTransactionModel                = "SelectTransactionModel"
    static let KEY_SelectTransactionModelArr             = "SelectTransactionModelArr"

    
    static let dateFormat                           = "yyyy-MM-dd HH:mm:ss"
    static let dateFormat_AM_PM                     = "yyyy-MM-dd h:mm a"
    static let dateFormat_Date_only                 = "yyyy-MM-dd"
    static let dateFormat_Time_only                 = "h:mm a"
    
    // OLD CODE
    let craftedByURL:String     = "https://www.SIL.com"
    let itunesAppDownloadURL    = "https://itunes.apple.com/us/app"
    
    
}



struct AppAlertMsg {
    //Validation alert that used in this app
    static let KSuccess = "Successfully subscribed"
    static let KCancel = "Please try again"

    static let KEmailEmpty = "Please enter email address"
    static let kPassword = "Please enter password"
    static let KValidEmail = "Please enter valid email address"
    static let KUserName = "Please enter username"
    static let KName = "Please enter name"
    static let KCompany = "Please enter company"
    static let KPhoneNumber = "Please enter phone number"
    static let KValidPhoneNumber = "Please enter valid phone number"
    static let KGender = "Please select your gender"
    static let KLang = "Please select language"
    static let KNationality = "Please select your nationality"
    static let KAvailable = "Please select atleast one available country"
    static let KImage = "Please select image"
    static let KPrice = "Please enter price"
    static let KInfo = "Please enter info"
    static let KAddress = "Please enter address"
    static let KCountry = "Please select atleast one country"
    static let KLanguage = "Please select language"
    static let KFullName = "Please enter full name"

    static let kPasswordOld = NSLocalizedString("Please enter current password", comment: "")
    static let kPasswordNew = NSLocalizedString("Please enter new password", comment: "")
    static let kPasswordConfirm = NSLocalizedString("Please enter confirm password", comment: "")
    static let kPasswordInvalid = NSLocalizedString("Password mismatched", comment: "")
    static let KUniversityName = NSLocalizedString("Please enter university name", comment: "")
    static let KValidPassword = NSLocalizedString("Password length should be minimum 6 characters long", comment: "")
    static let KProfilePicture = NSLocalizedString("Please select profile picture", comment: "")
    static let KUploadingImages = NSLocalizedString("Please wait while uploading images", comment: "")
    static let KDownloadingPDFs = NSLocalizedString("Please wait while downloading PDFs", comment: "")
}

//MARK:- Custom Colour
struct Custom {
   // UIColor(red: 14.0/255.0, green: 30/255.0, blue: 84/255.0, alpha: 1.0)
    static let kHBPurpleColor           = UIColor(red: 14.0/255.0, green: 30/255.0, blue: 84/255.0, alpha:1.0)
    static let kHBBlackColor            = UIColor(red:0.20, green:0.20, blue:0.20, alpha:1.0)
    
    static let CaribbeanGreenColor      = UIColor(heX:0x00D4A9)
    static let DownriverColor           = UIColor(heX:0x0A1A46)
    static let LochmaraColor            = UIColor(heX:0x008ED4)
    static let DustyGrayColor           = UIColor(heX:0x999999)
    static let GrayColor                = UIColor(heX:0x929292)
    static let PorcelainColor           = UIColor(heX:0xE4E8E9)
    static let AmaranthColor            = UIColor(heX:0xED2E67)
    static let ScorpionColor            = UIColor(heX:0x5E5E5E)
    static let SilverColor              = UIColor(heX:0xCCCCCC)
    static let IronColor                = UIColor(heX:0xE6E7E8)
    static let RideActivityColor        = UIColor(heX:0xDE1051)
    static let AzaleaColor              = UIColor(heX:0xF9D2E2)
    static let MintTulipColor           = UIColor(heX:0xCCF7EF)

    /*
    static let navColour                = UIColor(heX:0x8c32ce)
    static let darkGrey_text            = UIColor(heX:0x494949)
    static let lightGrey_text           = UIColor(heX:0x929292)
    
    static let redColour                = UIColor(heX:0xeb6668)
    static let orangeLightColour        = UIColor(heX:0xfcb468)
    static let yellowLightColour        = UIColor(heX:0xfbd654)
    static let greenLightVeryColour     = UIColor(heX:0xbedd60)
    static let greenLightColour         = UIColor(heX:0x66d87f)
    static let pistaColour              = UIColor(heX:0x3ad9c4)
    static let blueSkyColour            = UIColor(heX:0x5fb3ee)
    static let blueDarkColour           = UIColor(heX:0x6e8ee8)
    static let purpleLightColour        = UIColor(heX:0xa977e7)
    static let pinkColour               = UIColor(heX:0xd56de4)
    static let pinkLightColour          = UIColor(heX:0xf166cf)
    static let pinkLightVeryColour      = UIColor(heX:0xef7897)
    
    static let orangeColour             = UIColor(heX:0xf78432)
    static let yellowColour             = UIColor(heX:0xe5ca15)
    static let greenColour              = UIColor(heX:0x30b811)
    static let greenColourBtn           = UIColor(heX:0x30b712)
    
    static let purpleDarkColour         = UIColor(heX:0x38303f)
    static let purpleColour             = UIColor(heX:0x8c32ce)
    static let purpleLightVeryColour    = UIColor(heX:0xbba8e5)
    */
}




//Get user details from models
//var SelectProductObject : SelectProductModel {
//    get{
//        if let data = UserDefaults.standard.object(forKey: Constants.KEY_SelectProductModel) {
//            return NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! SelectProductModel
//        }
//        else {
//            return ModelManager.sharedInstance.getSelectProductModel(["" : ""])
//        }
//    }
//    
//    set(data){
//        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: Constants.KEY_SelectProductModel)
//        UserDefaults.standard.synchronize()
//    }
//}

//var ArrSelectProduct : [SelectProductModel] {
//    get{
//        if let data = UserDefaults.standard.object(forKey: Constants.KEY_SelectProductModelArr) {
//            return NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! [SelectProductModel]
//        }
//        else {
//            return [ModelManager.sharedInstance.getSelectProductModel([:])]
//        }
//    }
//    
//    set(data){
//        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: Constants.KEY_SelectProductModelArr)
//        UserDefaults.standard.synchronize()
//    }
//}


var SelectTransactionObject : ResponseDataModel{
    get{
        if let data = UserDefaults.standard.object(forKey: Constants.KEY_SelectTransactionModel) {
            return NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! ResponseDataModel
        }
        else {
            return ModelManager.sharedInstance.getResponseDataModel(["" : ""])
        }
    }
    
    set(data){
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: Constants.KEY_SelectTransactionModel)
        UserDefaults.standard.synchronize()
    }
}

var ArrSelectTransaction : [ResponseDataModel] {
    get{
        if let data = UserDefaults.standard.object(forKey: Constants.KEY_SelectTransactionModelArr) {
            return NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! [ResponseDataModel]
        }
        else {
            return [ModelManager.sharedInstance.getResponseDataModel([:])]
        }
    }
    
    set(data){
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: Constants.KEY_SelectTransactionModelArr)
        UserDefaults.standard.synchronize()
    }
}

//Get user details from models
var UserDetail : UserDataModel {
    get{
        if let data = UserDefaults.standard.object(forKey: Constants.KEY_UserDataModel) {
            return NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! UserDataModel
        }
        else {
          return ModelManager.sharedInstance.getUserDataModel(["" : ""])
        }
    }
    
    set(data){
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: Constants.KEY_UserDataModel)
        UserDefaults.standard.synchronize()
    }
}


// UserStatus
var UserStatus:String {
    get{
        return UserDefaults.standard.object(forKey: Constants.hbUserStatus) as? String ?? UserType.Fresh.rawValue
    }
    set(status){
        UserDefaults.standard.set(status, forKey: Constants.hbUserStatus)
        UserDefaults.standard.synchronize()
    }
}

var chipID:String {
    get{
        return UserDefaults.standard.object(forKey: Constants.hbUserChipID) as? String ?? ""
    }
    
    set(data){
        UserDefaults.standard.set(data, forKey: Constants.hbUserChipID)
        UserDefaults.standard.synchronize()
    }
}

var UserCountry:String {
    get{
        return UserDefaults.standard.object(forKey: Constants.hbUserCountry) as? String ?? "india"
    }
    
    set(data){
        UserDefaults.standard.set(data, forKey: Constants.hbUserCountry)
        UserDefaults.standard.synchronize()
    }
}

// For Swift 3
func delay(_ delay:Double, closure:@escaping ()->()) {
    let when = DispatchTime.now() + delay
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}

// For Swift 3
func main_thread(closure:@escaping ()->()) {
    let when = DispatchTime.now()
    DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
}
