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

open class AllService {

    static let EditProfile              =    "register/update"
  
    
    enum listOfApi : String {
        case
        subscribes,
        PlaceOrder
    }
    //Home DemoApp Service
    
  
    
    
    func PdfDownload(success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let url = "https://raw.githubusercontent.com/mwgg/Airports/master/airports.json"
        
        // create post request
        NetworkManager().Get(url,paramaters: [:],
                             showLoader: true,
                             success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    //Home DemoApp Service
    
    func getProduct(_ strCode: String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let url = "categories"
        
        // create post request
        NetworkManager().Get(url,
                             paramaters: [:],
                             showLoader: true,
                             success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func productList(_ selectedID: String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let url = "categories/\(selectedID)/products"
   
        // create post request
        NetworkManager().Get(url,
                             paramaters: [:],
                             showLoader: true,
                             success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func categoryList(_ selectedID: String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let url = "categories/\(selectedID)/subcategories"
        
        // create post request
        NetworkManager().Get(url,
                             paramaters: [:],
                             showLoader: true,
                             success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    func selectCategoryList(_ SelectCategoryID: String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let url = "subcategories/\(SelectCategoryID)/products"
        
        // create post request
        NetworkManager().Get(url,
                             paramaters: [:],
                             showLoader: true,
                             success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func productSearch(_ searchItem: String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let url = "products/search?search=\(searchItem)"
        
        // create post request
        NetworkManager().Get(url,
                             paramaters: [:],
                             showLoader: true,
                             success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func subscribes(strName: String, strEmail: String, strTelephone: String,strCompany : String, strCountry: String, strAdvertise: String,strEvent: String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let requestParameters = [
            "name":strName,
            "email":strEmail,
            "telephone":strTelephone,
            "company":strCompany,
            "country":strCountry,
            "id":"0"
        ]
        // create post request
        NetworkManager().POST("",
                              paramaters: requestParameters as [String : AnyObject]?,
                              showLoader: true,
                              success: { responseObject in
                                print(responseObject)
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }

    func RequestQuote(strContactNo: String, strEmailId: String, strMessage: String,strName : String, arrType: String, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        //        "ContactNo":"7878733991",
        //        "Corpcentre":"C000000008",
        //        "Date":"",
        //        "EmailId":"pateldharmik51294@gmail.com",
        //        "EntryDateTime":"",
        //        "Ipaddress":"",
        //        "Message":"abc",
        //        "Name":"Dharmik",
        //        "Srno":"",
        //        "Type":"[{\"Srno\":\"\",\"product_id\":\"31\",\"product_name\":\"Backpack\",\"product_no\":\"SG5178\",\"product_qty\":\"5\",\"product_printing_option\":\"Without Printing\",\"product_print_location\":\"pl\"},{\"Srno\":\"\",\"product_id\":\"31\",\"product_name\":\"Backpack\",\"product_no\":\"SG5178\",\"product_qty\":\"5\",\"product_printing_option\":\"Without Printing\",\"product_print_location\":\"pl\"}]",
        //        "Unit":"",
        //        "UserId":""
        
        let requestParameters = [
            "ContactNo":strContactNo,
            "Corpcentre":"C000000008",
            "Date":"",
            "EmailId":strEmailId,
            "EntryDateTime":"",
            "Ipaddress":"",
            "Message":strMessage,
            "Name":strName,
            "Srno":"",
            "Type":arrType,
            "Unit":"",
            "UserId":""
        ]
        
        // create post request
        
        NetworkManager().POSTFORREQ(listOfApi.PlaceOrder.rawValue,
                              paramaters: requestParameters as [String : AnyObject]?,
                              showLoader: true,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func DropDown(strId:String,success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        let requestParameters = [
            "ws":"1",
            "method":"get_sitter_groups",
            "user_id":strId
        ]
        
        print("requestParameters\(requestParameters)")
        // create post request
        NetworkManager().POST_FormData("",
                              paramaters: requestParameters as [String : AnyObject]?,
                              showLoader: true,
                              success: { responseObject in
                                print(responseObject)
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    /*
    func Page(_ strPageId: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        let requestParameters = ["pageid" : strPageId]
        
        // create post request
        NetworkManager().POST(listOfApi.page.rawValue,
                              paramaters: requestParameters,
                              showLoader: false,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func Notifications(_ isUp:Bool, strID: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        var requestParameters = ["id" : strID]
        if isUp == true {
            requestParameters = ["up" : strID]
        }
        else {
            requestParameters = ["id" : strID]
        }
        
        // create post request
        NetworkManager().POST(listOfApi.notifications.rawValue,
                              paramaters: requestParameters,
                              showLoader: false,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func Purchase(_ coin: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        let requestParameters = ["coin" : coin]
        
        // create post request
        NetworkManager().POST(listOfApi.purchasecoin.rawValue,
                              paramaters: requestParameters,
                              showLoader: false,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func Buynote(_ coin: NSNumber, noteid: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        let requestParameters = ["noteid" : noteid, "coin" : coin]
        
        // create post request
        NetworkManager().POST(listOfApi.buynote.rawValue,
                              paramaters: requestParameters,
                              showLoader: false,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func Notelist(_ isUp:Bool, subjectId: NSNumber ,strId: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        var requestParameters = ["id" : strId, "subjectid" : subjectId] as [String : Any]
        if isUp == true {
            requestParameters = ["up" : strId, "subjectid" : subjectId]
        }
        else {
            requestParameters = ["id" : strId, "subjectid" : subjectId]
        }
        
        // create post request
        NetworkManager().POST(listOfApi.notelist.rawValue,
                              paramaters: requestParameters as [String : AnyObject]?,
                              showLoader: false,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func Subjectlist(_ isUp:Bool, courseId: NSNumber ,strId: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        var requestParameters = ["id" : strId, "courseid" : courseId] as [String : Any]
        if isUp == true {
            requestParameters = ["up" : strId, "courseid" : courseId]
        }
        else {
            requestParameters = ["id" : strId, "courseid" : courseId]
        }
        
        // create post request
        NetworkManager().POST(listOfApi.subjectlist.rawValue,
                              paramaters: requestParameters as [String : AnyObject]?,
                              showLoader: false,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func Stories(_ isUp:Bool, strID: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        var requestParameters = ["id" : strID]
        if isUp == true {
            requestParameters = ["up" : strID]
        }
        else {
            requestParameters = ["id" : strID]
        }
       
        // create post request
        NetworkManager().POST(listOfApi.stories.rawValue,
                            paramaters: requestParameters,
                            showLoader: false,
                            success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }
    
    func Courselist(_ isUp:Bool, strId: NSNumber, success: @escaping (_ responseObject: AnyObject?) -> Void, failure: @escaping (AnyObject) -> Void) {
        
        // create request parameter
        var requestParameters = ["id" : strId] as [String : Any]
        if isUp == true {
            requestParameters = ["up" : strId]
        }
        else {
            requestParameters = ["id" : strId]
        }
        
        // create post request
        NetworkManager().POST(listOfApi.courselist.rawValue,
                              paramaters: requestParameters as [String : AnyObject]?,
                              showLoader: false,
                              success: { responseObject in
                                success(responseObject)
        }) { error in
            failure(error)
        }
    }*/
}
