//
//  RegistrationService.swift
//  OnSide
//
//  Created by Mehul Parmar on 27/05/16.
//  Copyright © 2016 Openxcell. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

open class RegistrationService {
    
    enum listOfApi : String {
        case
        LoginIDocs
    }
    
    func login(control: String, corporate: String, ip :String,module :String,password :String,userid :String,username :String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        // create request parameter
        let requestParameters = ["control"          :   "btngetcorporate",
                                 "corporate"        :   "",
                                 "ip"               :   "",
                                 "module"           :   "Login",
                                 "password"         :   password,
                                 "userid"           :   "",
                                 "username"         :   username
        ]
        
        // create post request
        NetworkManager().POST(listOfApi.LoginIDocs.rawValue,
                              paramaters: requestParameters as [String : AnyObject]?,
                              showLoader: true,
                              success:
            { responseObject in
                print(responseObject)
                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    /*
     func languages(_ success: @escaping (_ responseObject: JSON?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     // create post request
     NetworkManager().Get(listOfApi.languages.rawValue,
     paramaters: nil,
     showLoader: false,
     success: { responseObject in
     success(JSON(responseObject!))
     }) { error in
     failure(error)
     }
     }
     
     func countries(_ success: @escaping (_ responseObject: JSON?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     // create post request
     NetworkManager().Get(listOfApi.countries.rawValue,
     paramaters: nil,
     showLoader: false,
     success: { responseObject in
     success(JSON(responseObject!))
     }) { error in
     failure(error)
     }
     }
     
     func personLogin(email: String, password: String,success :@escaping (_ responseObject:JSON) -> Void , failure:@escaping (AnyObject) -> Void) {
     
     // create request parameter
     let requestParameters = ["email"        :email,
     "password":"123456"
     ]
     
     // create post request
     NetworkManager().POST(listOfApi.personLogin.rawValue,
     paramaters: requestParameters as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     func companyLogin(email: String, password: String,success :@escaping (_ responseObject:JSON) -> Void , failure:@escaping (AnyObject) -> Void) {
     
     // create request parameter
     let requestParameters = ["email"        :email,
     "password":"123456"
     ]
     
     // create post request
     NetworkManager().POST(listOfApi.companyLogin.rawValue,
     paramaters: requestParameters as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     // MARK: - User related
     func users(_ email: String,password: String,nationality_id: String,first_name: String,last_name: String,phone: String,arrImages : [UIImage], success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "email":email,
     "password":"123456",
     "device_type":"1",
     "token":"123456789",
     "nationality_id":nationality_id,
     "phone": phone,
     "first_name":first_name,
     "last_name":last_name
     ]
     
     var parameterDictionaryWithImage = [[String: Data]]()
     for (_, objImage) in arrImages.enumerated() {
     var parameterwithImage = [String: Data]()
     
     if let imageData = objImage.png {
     //            if let imageData = objImage.jpeg(.low) {
     parameterwithImage ["profile_pic"] = imageData
     parameterDictionaryWithImage.append(parameterwithImage)
     }
     }
     
     // create post request
     if arrImages.count > 0 {
     NetworkManager().PostMultiPart_uploadFiles(listOfApi.users.rawValue, parameterDictionary: params, arrParameterDictionaryWithFile: parameterDictionaryWithImage, success: { (responseObject) in
     success(JSON(responseObject!))
     }) { (error) in
     failure(error)
     }
     }
     else {
     NetworkManager().POST(listOfApi.users.rawValue,
     paramaters: params as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     }
     
     func userForgotPassword(_ email: String, success: @escaping (_ responseObject: JSON?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     // create request parameter
     let requestParameters = ["email":email]
     
     // create post request
     NetworkManager().POST(listOfApi.userForgotPassword.rawValue,
     paramaters: requestParameters as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     func userLogin(email: String, password: String,success :@escaping (_ responseObject:JSON) -> Void , failure:@escaping (AnyObject) -> Void) {
     
     // create request parameter
     let requestParameters = ["email"        :email,
     "password":"123456"
     ]
     
     // create post request
     NetworkManager().POST(listOfApi.userLogin.rawValue,
     paramaters: requestParameters as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     func userImageUpload(_ email: String ,arrImages : [UIImage], success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "email":email
     ]
     
     var parameterDictionaryWithImage = [[String: Data]]()
     for (_, objImage) in arrImages.enumerated() {
     var parameterwithImage = [String: Data]()
     if let imageData = objImage.png {
     //            if let imageData = objImage.jpeg(.low) {
     parameterwithImage ["profile_pic"] = imageData
     parameterDictionaryWithImage.append(parameterwithImage)
     }
     }
     
     // create post request
     NetworkManager().PostMultiPart_uploadFiles(listOfApi.userImageUpload.rawValue, parameterDictionary: params, arrParameterDictionaryWithFile: parameterDictionaryWithImage, success: { (responseObject) in
     success(JSON(responseObject!))
     }) { (error) in
     failure(error)
     }
     }
     
     func editUser(_ email: String,password: String,nationality_id: String,first_name: String,last_name: String,phone: String,arrImages : [UIImage], success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "email":email,
     "password":"123456",
     "device_type":"1",
     "token":"123456789",
     "phone":phone,
     "nationality_id":nationality_id,
     "first_name":first_name,
     "last_name":last_name
     ]
     
     // create post request
     NetworkManager().POST(listOfApi.editUser.rawValue,
     paramaters: params as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     // MARK: - persons related
     func persons(_ userId: String, first_name: String,last_name: String,gender: String, phone: String, address: String,nationality_id: String, price: String, info: String,email: String,password: String, countries: String, languages: String,age: String,arrImages : [UIImage], success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "first_name":first_name,
     "last_name":last_name,
     "gender":gender,
     "phone":phone,
     "address":address,
     "nationality_id":nationality_id,
     "price":price,
     "age":age,
     "info":info,
     "userId": userId,
     "password":"123456",
     "device_type":"1",
     "token":"123456789",
     "email":email,
     "countries":countries,
     "languages":languages
     ]
     
     var parameterDictionaryWithImage = [[String: Data]]()
     for (_, objImage) in arrImages.enumerated() {
     var parameterwithImage = [String: Data]()
     
     if let imageData = objImage.png {
     //            if let imageData = objImage.jpeg(.low) {
     parameterwithImage ["profile_pic"] = imageData
     parameterDictionaryWithImage.append(parameterwithImage)
     }
     }
     
     // create post request
     if arrImages.count > 0 {
     NetworkManager().PostMultiPart_uploadFiles(listOfApi.persons.rawValue, parameterDictionary: params, arrParameterDictionaryWithFile: parameterDictionaryWithImage, success: { (responseObject) in
     success(JSON(responseObject!))
     }) { (error) in
     failure(error)
     }
     }
     else {
     NetworkManager().POST(listOfApi.persons.rawValue,
     paramaters: params as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     }
     
     func editPersons(_ personId: String, first_name: String, last_name: String,gender: String, phone: String, address: String,nationality_id: String, price: String, info: String,email: String, countries: String, languages: String,age: String, success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "first_name":first_name,
     "last_name":last_name,
     "gender":gender,
     "phone":phone,
     "address":address,
     "nationality_id":nationality_id,
     "price":price,
     "age":age,
     "info":info,
     "personId" : personId,
     "email":email,
     "countries":countries,
     "languages":languages
     ]
     
     // create post request
     NetworkManager().POST(listOfApi.editPersons.rawValue,
     paramaters: params as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     func company(_ userId: String, first_name: String, phone: String, address: String, price: String,email: String, password: String, countries: String, languages: String,arrImages : [UIImage], success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "name":first_name,
     "phone":phone,
     "address":address,
     "price":price,
     "info":address,
     "userId" : userId,
     "password":"123456",
     "device_type":"1",
     "token":"123456789",
     "email":email,
     "countries":countries,
     "languages":languages
     ]
     
     var parameterDictionaryWithImage = [[String: Data]]()
     for (_, objImage) in arrImages.enumerated() {
     var parameterwithImage = [String: Data]()
     if let imageData = objImage.png {
     //            if let imageData = objImage.jpeg(.low) {
     parameterwithImage ["profile_pic"] = imageData
     parameterDictionaryWithImage.append(parameterwithImage)
     }
     }
     
     // create post request
     if arrImages.count > 0 {
     NetworkManager().PostMultiPart_uploadFiles(listOfApi.company.rawValue, parameterDictionary: params, arrParameterDictionaryWithFile: parameterDictionaryWithImage, success: { (responseObject) in
     success(JSON(responseObject!))
     }) { (error) in
     failure(error)
     }
     }
     else {
     NetworkManager().POST(listOfApi.company.rawValue,
     paramaters: params as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     }
     
     func editCompany(_ userId: String, first_name: String, phone: String, address: String, price: String,email: String, countries: String, languages: String, arrImages : [UIImage], success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "name":first_name,
     "gender":"1",
     "phone":phone,
     "address":address,
     "price":price,
     "info":address,
     "userId": userId,
     "email":email,
     "countries":countries,
     "languages":languages
     ]
     
     var parameterDictionaryWithImage = [[String: Data]]()
     for (_, objImage) in arrImages.enumerated() {
     var parameterwithImage = [String: Data]()
     if let imageData = objImage.png {
     //            if let imageData = objImage.jpeg(.low) {
     parameterwithImage ["profile_pic"] = imageData
     parameterDictionaryWithImage.append(parameterwithImage)
     }
     }
     
     // create post request
     if arrImages.count > 0 {
     NetworkManager().PostMultiPart_uploadFiles(listOfApi.editCompany.rawValue, parameterDictionary: params, arrParameterDictionaryWithFile: parameterDictionaryWithImage, success: { (responseObject) in
     success(JSON(responseObject!))
     }) { (error) in
     failure(error)
     }
     }
     else {
     NetworkManager().POST(listOfApi.editCompany.rawValue,
     paramaters: params as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     // create post request
     }
     
     func personImageUpload(_ email: String ,arrImages : [UIImage], success: @escaping (_ responseObject: JSON) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "email":email
     ]
     
     var parameterDictionaryWithImage = [[String: Data]]()
     for (_, objImage) in arrImages.enumerated() {
     var parameterwithImage = [String: Data]()
     if let imageData = objImage.png {
     //            if let imageData = objImage.jpeg(.low) {
     parameterwithImage ["profile_pic"] = imageData
     parameterDictionaryWithImage.append(parameterwithImage)
     }
     }
     
     // create post request
     NetworkManager().PostMultiPart_uploadFiles(listOfApi.personImageUpload.rawValue, parameterDictionary: params, arrParameterDictionaryWithFile: parameterDictionaryWithImage, success: { (responseObject) in
     success(JSON(responseObject!))
     }) { (error) in
     failure(error)
     }
     }
     
     func personForgotPassword(_ email: String, success: @escaping (_ responseObject: JSON?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     // create request parameter
     let requestParameters = ["email":email]
     
     // create post request
     NetworkManager().POST(listOfApi.personForgotPassword.rawValue,
     paramaters: requestParameters as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     func companyForgotPassword(_ email: String, success: @escaping (_ responseObject: JSON?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     // create request parameter
     let requestParameters = ["email":email]
     
     // create post request
     NetworkManager().POST(listOfApi.companyForgotPassword.rawValue,
     paramaters: requestParameters as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject))
     }) { error in
     failure(error)
     }
     }
     
     func companyCountryList(_ countryID: String, success: @escaping (_ responseObject: JSON?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     let strGenderAppend = "?country_id=\(countryID)"
     var strAPIcompanyCountryListr = listOfApi.companyCountryList.rawValue
     strAPIcompanyCountryListr = strAPIcompanyCountryListr.appending(strGenderAppend)
     print("strAPIcompanyCountryListr : \(strAPIcompanyCountryListr)")
     
     // create post request
     NetworkManager().Get(strAPIcompanyCountryListr,
     paramaters: nil,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject!))
     }) { error in
     failure(error)
     }
     }
     
     func personsGender(_ countryID: String, genderID: String, success: @escaping (_ responseObject: JSON?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     let strGenderAppend = "?gender=\(genderID)"
     let strCountryAppend = "?country_id=\(countryID)"
     let strCountryAppend_withGender = "\(strGenderAppend)&country_id=\(countryID)"
     
     var strAPIPersonsGender = listOfApi.personsGender.rawValue
     if genderID.length > 0 &&  countryID.length > 0 {
     strAPIPersonsGender = strAPIPersonsGender.appending(strCountryAppend_withGender)
     }
     else if countryID.length > 0 && genderID.length == 0 {
     strAPIPersonsGender = strAPIPersonsGender.appending(strCountryAppend)
     }
     else if countryID.length == 0 && genderID.length > 0 {
     strAPIPersonsGender = strAPIPersonsGender.appending(strGenderAppend)
     }
     
     print("strAPIPersonsGender : \(strAPIPersonsGender)")
     
     // create post request
     NetworkManager().Get(strAPIPersonsGender,
     paramaters: nil,
     showLoader: true,
     success: { responseObject in
     success(JSON(responseObject!))
     }) { error in
     failure(error)
     }
     }
     
     func ChangeNotification(_ success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     // create post request
     NetworkManager().POST(listOfApi.changenotification.rawValue,
     paramaters: nil,
     showLoader: true,
     success: { responseObject in
     success(responseObject)
     }) { error in
     failure(error)
     }
     }
     
     func Logout(_ success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     // create post request
     NetworkManager().POST(listOfApi.logout.rawValue,
     paramaters: nil,
     showLoader: true,
     success: { responseObject in
     success(responseObject)
     }) { error in
     failure(error)
     }
     }
     
     func Registration(_ strFullName : String, strEmail: String, strPassword : String, strUniversity : String, strNumber: String,strDevice_token : String, strDevice_type: String,arrImages : [UIImage], success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
     
     //Create request parameter
     let params:[String:String] = [
     "name":strFullName,
     "email":strEmail,
     "password":strPassword,
     "university":strUniversity,
     "number":strNumber,
     "device_token":strDevice_token,
     "device_type":strDevice_type
     ]
     
     var parameterDictionaryWithImage = [[String: Data]]()
     for (_, objImage) in arrImages.enumerated() {
     var parameterwithImage = [String: Data]()
     parameterwithImage ["profile"] = UIImagePNGRepresentation(objImage)
     parameterDictionaryWithImage.append(parameterwithImage)
     }
     
     if arrImages.count > 0 {
     // create post request
     NetworkManager().PostMultiPart_uploadFiles(listOfApi.signup.rawValue, parameterDictionary: params, arrParameterDictionaryWithFile: parameterDictionaryWithImage, success: { (responseObject) in
     success(responseObject)
     }) { (error) in
     failure(error)
     }
     }
     else {
     // create post request
     NetworkManager().POST(listOfApi.signup.rawValue,
     paramaters: params as [String : AnyObject]?,
     showLoader: true,
     success: { responseObject in
     success(responseObject)
     }) { error in
     failure(error)
     }
     }
     }*/
}

// MARK: - save NSObject To User Default
func saveNSObjectToArchive(_ object:NSObject? = nil,key:String) {
    let userDefault = UserDefaults.standard
    if object != nil {
        userDefault.set(NSKeyedArchiver.archivedData(withRootObject: object!), forKey: key)
    } else {
        userDefault.removeObject(forKey: key)
    }
    userDefault.synchronize()
}

func getArchivedDataOfUser()-> UserDataModel? {
    let userDefault = UserDefaults.standard
    let decodedNSData = userDefault.object(forKey: Constants.KEY_UserModel) as? Data
    
    if (decodedNSData != nil) {
        let object = NSKeyedUnarchiver.unarchiveObject(with: decodedNSData!) as? UserDataModel
        return object
    } else {
        return nil
    }
}
