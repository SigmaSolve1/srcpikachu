//
//  UserDefault.swift
//  Reeload
//
//  Created by Dipak on 15/02/16.
//  Copyright © 2016 Dipak. All rights reserved.
//

import Foundation
import CoreLocation

open class UserDefault {
    
    // MARK: - User Id
//    class func setUserModel(_ userModelTemp: UserDataModel) {
//        UserDefaults.standard.set(userModelTemp, forKey: Constants.KEY_UserModel)
//        UserDefaults.standard.synchronize()
//    }
//    
//    class func getUserModel() -> UserDataModel? {
//        
//        return UserDefaults.standard.value(forKey: Constants.KEY_UserModel) as? UserDataModel
//    }
    
    /*
     // MARK: - User Location
     class func setUserLocation(userLocation: CLLocation) {
     
     NSUserDefaults.standardUserDefaults().setObject(userLocation.coordinate.latitude, forKey: Constants.KEY_USER_Lat)
     NSUserDefaults.standardUserDefaults().setObject(userLocation.coordinate.longitude, forKey: Constants.KEY_USER_Long)
     NSUserDefaults.standardUserDefaults().synchronize()
     }
     
     class func getUserLocation() -> CLLocation? {
     let lat = NSUserDefaults.standardUserDefaults().valueForKey(Constants.KEY_USER_Lat) as? Double
     let long = NSUserDefaults.standardUserDefaults().valueForKey(Constants.KEY_USER_Long) as? Double
     if lat == nil {
     return nil
     }
     else {
     return CLLocation(latitude: lat!, longitude: long!)
     }
     }
     */
    
    // MARK: - User Id
    class func setUserId(_ userId: String) {
        
        if !userId.isEmpty
        {
            UserDefaults.standard.set(userId, forKey: Constants.KEY_USER_ID)
        }
        else
        {
            UserDefaults.standard.removeObject(forKey: Constants.KEY_USER_ID)
        }
        
        UserDefaults.standard.synchronize()
        
    }
    
    class func getUserId() -> String? {
        
        return UserDefaults.standard.value(forKey: Constants.KEY_USER_ID) as? String
    }
    
    class func setLoginStatus(_ isLoggedIn:Bool) {
        
        UserDefaults.standard.set(isLoggedIn, forKey: Constants.KEY_LOGIN_STATUS)
        
        UserDefaults.standard.synchronize()
        
    }
    
    class func getLogInStatus()->Bool{
        
        return UserDefaults.standard.bool(forKey: Constants.KEY_LOGIN_STATUS)
    }
    
    class func setNotificationStatus(_ isLoggedIn:Bool) {
        
        UserDefaults.standard.set(isLoggedIn, forKey: Constants.KEY_Notification_STATUS)
        
        UserDefaults.standard.synchronize()
        
    }
    
    class func getNotificationStatus()->Bool{
        
        return UserDefaults.standard.bool(forKey: Constants.KEY_Notification_STATUS)
    }
    
    // MARK: - Access-Token ID
    class func setLanguage(_ strLanguage: String) {
        
        if !strLanguage.isEmpty
        {
            UserDefaults.standard.set(strLanguage, forKey: Constants.KEY_Language)
        }
        else
        {
            UserDefaults.standard.removeObject(forKey: Constants.KEY_Language)
        }
        
        UserDefaults.standard.synchronize()
    }
    
    class func getLanguage() -> String? {
        
        return UserDefaults.standard.value(forKey: Constants.KEY_Language) as? String
    }
    
    // MARK: - Access-Token ID
    class func setAccessToken(_ tokenId: String) {
        
        if !tokenId.isEmpty
        {
            UserDefaults.standard.set(tokenId, forKey: Constants.KEY_AccessToken)
        }
        else
        {
            UserDefaults.standard.removeObject(forKey: Constants.KEY_AccessToken)
        }
        
        UserDefaults.standard.synchronize()
    }
    
    class func getAccessToken() -> String? {
        
        return UserDefaults.standard.value(forKey: Constants.KEY_AccessToken) as? String
        
    }
    
    class func setDeviceToken(_ deviceToken: String) {
        
        if !deviceToken.isEmpty
        {
            UserDefaults.standard.set(deviceToken, forKey:Constants.KEY_DEVICE_TOKEN)
        }
        else
        {
            UserDefaults.standard.removeObject(forKey: Constants.KEY_DEVICE_TOKEN)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func getDeviceToken() -> String? {
        
        return UserDefaults.standard.value(forKey: Constants.KEY_DEVICE_TOKEN) as? String
        
    }
    
    class func setXapi(_ Xapi: String) {
        
        if !Xapi.isEmpty
        {
            UserDefaults.standard.set(Xapi, forKey:Constants.KEY_Xapi)
        }
        else
        {
            UserDefaults.standard.removeObject(forKey: Constants.KEY_Xapi)
        }
        UserDefaults.standard.synchronize()
    }
    
    class func getXapi() -> String? {
        
        return UserDefaults.standard.value(forKey: Constants.KEY_Xapi) as? String
        
    }
    
    class func removeAllData() {
        UserDefaults.standard.removeObject(forKey: Constants.KEY_UserModel)
        UserDefaults.standard.removeObject(forKey: Constants.KEY_USER_ID)
        UserDefaults.standard.removeObject(forKey: Constants.KEY_AccessToken)
        
        UserDefaults.standard.removeObject(forKey: Constants.KEY_LOGIN_STATUS)
        UserDefaults.standard.removeObject(forKey: Constants.KEY_Notification_STATUS)
        
        // No need to remove device token
        //dont remoce device token, lat , long
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_Xapi)
        
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_USER_Country)
        
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_USER_Lat)
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_USER_Long)
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_DEVICE_TOKEN)
        
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_PROFILE_PIC)
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_USER_NAME)
        //        NSUserDefaults.standardUserDefaults().removeObjectForKey(Constants.KEY_USER_BIO)
        
    }
}
