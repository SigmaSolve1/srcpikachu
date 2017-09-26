//
//  NetworkManager.swift
//  Constants.kAppName.localized()
//
//  Created by Mehul Parmar on 08/06/16.
//  Copyright © 2016 . All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

//used for facebook logour while invalid session

//MARK : - Errors
enum NetworkConnection {
  case available
  case notAvailable
}

class NetworkManager {
    
    let baseUrlDev_OLD : String = "https://hotelbids.com/" + "dev/" + "hb-app/" +  "v3/" + "user/"
    let baseUrlDev : String = "https://raw.githubusercontent.com/mwgg/Airports/master/airports.json"

//    let baseUrlForRequestQuote : String = "https://pocketsitter.ppmdemos.com/webservices/api.php"
    let baseUrlForRequestQuote : String = "https://pocketsitter.ppmdemos.com/api"
    
    //MARK : - Shared Manager
    let sharedManager = SessionManager()

    func getHeaders() -> [String: String] {
        
        var headerDictionary = [String: String]()
        
        if UserDetail.remember_token != nil {
            if UserDetail.remember_token.length > 0 {
                headerDictionary[Constants.KEY_remember_token] = "\(UserDetail.remember_token!)"
            }
        }
        

        /*
        if let xapi = UserDefault.getXapi() {
            headerDictionary[Constants.KEY_Xapi] = xapi
        }
        
        if let accessLanguage = UserDefault.getLanguage() {
            headerDictionary[Constants.KEY_Language] = accessLanguage
        }

        if let userId = UserDefault.getUserId() {
            headerDictionary[Constants.KEY_USER_ID] = userId
        }
        
        if let accessToken = UserDefault.getAccessToken() {
            headerDictionary[Constants.KEY_AccessToken] = accessToken
        }*/
        
        print("headerDictionary : \(headerDictionary)")
        return headerDictionary
    }
    
    // Mark:- Download File
    func DownloadFile(strFileUrl : String, strFileName : String, success:@escaping (_ strResultURL: String) -> Void , failure:@escaping (_ responseObject:AnyObject) -> Void) {
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("\(strFileName)")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        Alamofire.download(strFileUrl, to: destination).response { response in
            
                if SVProgressHUD.isVisible() {
                    if UIApplication.shared.isIgnoringInteractionEvents {
                        UIApplication.shared.endIgnoringInteractionEvents()
                    }
                    SVProgressHUD.dismiss()
                }

                if response.error == nil {
                    success("\(response.destinationURL!)")
                }
                else {
                    failure(response.error as AnyObject)
                }
            }.downloadProgress { (progress) in
                print("Download Progress: \(progress.fractionCompleted)")
                if !UIApplication.shared.isIgnoringInteractionEvents {
                    UIApplication.shared.beginIgnoringInteractionEvents()
                }
                SVProgressHUD.showProgress(Float(progress.fractionCompleted), status: AppAlertMsg.KDownloadingPDFs)
        }
    }
    
    
    func printResponse(urlString: String, paramaters: [String: AnyObject]?, response: AnyObject) {
        
        /*
        let dictResponce = self.isValidated(response as AnyObject)
        
        if let paramatersTemp = paramaters {
            if paramatersTemp.values.count > 0 {
                let jsonParameters = JSON(paramatersTemp)
                print("\n\n\nurlString : \(urlString) ,\n\n paramaters: \(jsonParameters) ,\n\n Response: \(String(describing: dictResponce.1))\n\n\n")
            }
            else {
                print("urlString : \(urlString) ,\n Response: \(String(describing: dictResponce.1))")
            }
        }
        else {
            print("urlString : \(urlString) ,\n Response: \(String(describing: dictResponce.1))")
        }
        */
    }
    
    // MARK: - Get Method
    func Get(_ urlString: String, paramaters: [String: AnyObject]? = nil, showLoader: Bool? = nil, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        switch checkInternetConnection() {
        case .available:
            if let showLoader = showLoader {
                if showLoader {
                    DispatchQueue.main.async {
                        // update some UI
                        SVProgressHUD.show()
                    }
                }
            }
            
            Alamofire.request(baseUrlDev.add(urlString: urlString), method: .get, parameters: paramaters, encoding: URLEncoding.default, headers: self.getHeaders()).responseJSON (completionHandler: { response in

                main_thread {
                    if UIApplication.shared.isIgnoringInteractionEvents {
                        UIApplication.shared.endIgnoringInteractionEvents()
                    }
                    SVProgressHUD.dismiss()
                }
                
                //Success
                if response.result.isSuccess {
                    //                        print("isSuccess")
                    if let value = response.result.value {
                        //Removing null and <null>, and replacing number or integer to string
                        if var dictResponse = value as? NSDictionary {
                            dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                            let jsonResponce = JSON(dictResponse)
                            success(jsonResponce)
                        }
                        else{
                            if var arrResponse = value as? NSArray {
                                arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                let jsonResponce = JSON(arrResponse)
                                success(jsonResponce)
                            }
                            else {
                                success(JSON(value))
                            }
                        }
                        
//
//
//                        let dictResponce = self.isValidated(value as AnyObject)
//
//                        //Print response using below method
//                        self.printResponse(urlString: urlString, paramaters: paramaters, response: (value as AnyObject))
//                        
//                        if dictResponce.0 == true {
//                            success(dictResponce.1)
//                        }
//                        else {
//                            failure(dictResponce.1)
//                        }
                    }
                }
                else {
                    //Check response error using status code
                    if let strErrorReasonCode : Int = response.response?.statusCode {
                        
                        if let data = response.data {
                            let jsonResponce = JSON(data: data)
                            let _ : ResponseDataModel = ModelManager.sharedInstance.getResponseDataModel(jsonResponce.dictionaryObject! as NSDictionary)
                            let authentication_Errors = 400
                            let authentication_Errors_Range = 401..<500
                            let Alamofire_Error = -1005
                            
                            if authentication_Errors == strErrorReasonCode {
//                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
//                                self.isUnAuthotized()
                                failure(jsonResponce)

                            }
                            else if authentication_Errors_Range.contains(strErrorReasonCode) {
//                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
//                                SmoothAlert().ShowAlert(forAlertType: .failure, string: responce.message)
                                failure(jsonResponce)
                            }
                            else if authentication_Errors_Range.contains(Alamofire_Error) {
                                self.POST(urlString, paramaters: paramaters, showLoader: showLoader, success: { (responseObject) in
                                    if response.result.isSuccess {
                                        if let value = response.result.value {
                                            //Removing null and <null>, and replacing number or integer to string
                                            if var dictResponse = value as? NSDictionary {
                                                dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                                                let jsonResponce = JSON(dictResponse)
                                                success(jsonResponce)
                                            }
                                            else{
                                                if var arrResponse = value as? NSArray {
                                                    arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                                    let jsonResponce = JSON(arrResponse)
                                                    success(jsonResponce)
                                                }
                                                else {
                                                    success(JSON(value))
                                                }
                                            }
                                            

//                                            let dictResponce = self.isValidated(value as AnyObject)
//                                            if dictResponce.0 == true {
//                                                success(dictResponce.1)
//                                            }
//                                            else {
//                                                failure(dictResponce.1)
//                                            }
                                        }
                                    }
                                }, failure: {_ in
                                    failure(jsonResponce)
                                })
                            }
                            
                        }
                    }
                    else {
                        failure(nil)
                    }
                }
            })
            
        case .notAvailable:
            if let _ = showLoader {
                UIApplication.shared.keyWindow?.makeToast(message: "No active internet connection.", duration: 3.0, position: "bottom" as AnyObject)
            }
            failure(nil)
            print("No internet")
        }
    }
    
    
    // MARK: - POST_FormData Method
    func POST_FormData(_ urlString: String, paramaters: [String: AnyObject]? = nil, showLoader: Bool? = nil, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        switch checkInternetConnection() {
        case .available:
            if let showLoader = showLoader {
                if showLoader {
                    DispatchQueue.main.async {
                        // update some UI
                        UIApplication.shared.keyWindow?.showLoader()
                    }
                }
            }
            
            Alamofire.request(baseUrlForRequestQuote.add(urlString: urlString), method: .post, parameters: paramaters, encoding: URLEncoding.default)
                .responseJSON(
                    completionHandler:{
                        response in
                        
                        DispatchQueue.main.async {
                            if UIApplication.shared.isIgnoringInteractionEvents {
                                UIApplication.shared.endIgnoringInteractionEvents()
                            }
                            SVProgressHUD.dismiss()
                        }
                        
                        //Success
                        if response.result.isSuccess {
                            //                        print("isSuccess")
                            if let value = response.result.value {
                                //Removing null and <null>, and replacing number or integer to string
                                if var dictResponse = value as? NSDictionary {
                                    dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                                    let jsonResponce = JSON(dictResponse)
                                    success(jsonResponce)
                                }
                                else{
                                    if var arrResponse = value as? NSArray {
                                        arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                        let jsonResponce = JSON(arrResponse)
                                        success(jsonResponce)
                                    }
                                    else {
                                        success(JSON(value))
                                    }
                                }
                                
                                //
                                //
                                //                        let dictResponce = self.isValidated(value as AnyObject)
                                //
                                //                        //Print response using below method
                                //                        self.printResponse(urlString: urlString, paramaters: paramaters, response: (value as AnyObject))
                                //
                                //                        if dictResponce.0 == true {
                                //                            success(dictResponce.1)
                                //                        }
                                //                        else {
                                //                            failure(dictResponce.1)
                                //                        }
                            }
                        }
                        else {
                            //Check response error using status code
                            if let strErrorReasonCode : Int = response.response?.statusCode {
                                
                                if let data = response.data {
                                    let jsonResponce = JSON(data: data)
                                    let _ : ResponseDataModel = ModelManager.sharedInstance.getResponseDataModel(jsonResponce.dictionaryObject! as NSDictionary)
                                    let authentication_Errors = 400
                                    let authentication_Errors_Range = 401..<500
                                    let Alamofire_Error = -1005
                                    
                                    if authentication_Errors == strErrorReasonCode {
                                        //                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
                                        //                                self.isUnAuthotized()
                                        failure(jsonResponce)
                                        
                                    }
                                    else if authentication_Errors_Range.contains(strErrorReasonCode) {
                                        //                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
                                        //                                SmoothAlert().ShowAlert(forAlertType: .failure, string: responce.message)
                                        failure(jsonResponce)
                                    }
                                    else if authentication_Errors_Range.contains(Alamofire_Error) {
                                        self.POST(urlString, paramaters: paramaters, showLoader: showLoader, success: { (responseObject) in
                                            if response.result.isSuccess {
                                                if let value = response.result.value {
                                                    //Removing null and <null>, and replacing number or integer to string
                                                    if var dictResponse = value as? NSDictionary {
                                                        dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                                                        let jsonResponce = JSON(dictResponse)
                                                        success(jsonResponce)
                                                    }
                                                    else{
                                                        if var arrResponse = value as? NSArray {
                                                            arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                                            let jsonResponce = JSON(arrResponse)
                                                            success(jsonResponce)
                                                        }
                                                        else {
                                                            success(JSON(value))
                                                        }
                                                    }
                                                    
                                                    
                                                    //                                            let dictResponce = self.isValidated(value as AnyObject)
                                                    //                                            if dictResponce.0 == true {
                                                    //                                                success(dictResponce.1)
                                                    //                                            }
                                                    //                                            else {
                                                    //                                                failure(dictResponce.1)
                                                    //                                            }
                                                }
                                            }
                                        }, failure: {_ in
                                            failure(jsonResponce)
                                        })
                                    }
                                    
                                }
                            }
                            else {
                                failure(nil)
                            }
                        }
                })
            
        case .notAvailable:
            if let _ = showLoader {
                UIApplication.shared.keyWindow?.makeToast(message: "No active internet connection.", duration: 3.0, position: "bottom" as AnyObject)
            }
            failure(nil)
            print("No internet")
        }
    }

    
    // MARK: - POST Method
    func POST(_ urlString: String, paramaters: [String: AnyObject]? = nil, showLoader: Bool? = nil, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
   
        switch checkInternetConnection() {
        case .available:
            if let showLoader = showLoader {
                if showLoader {
                    DispatchQueue.main.async(execute: {
                        if !UIApplication.shared.isIgnoringInteractionEvents {
                            UIApplication.shared.beginIgnoringInteractionEvents()
                        }
                        SVProgressHUD.show(withStatus: "Please wait")
                    })
                }
            }
            
            sharedManager.request(baseUrlDev.add(urlString: urlString), method: .post, parameters: paramaters, encoding: JSONEncoding.default, headers: self.getHeaders()).validate().responseJSON(completionHandler: { response in
                
                DispatchQueue.main.async {
                    if UIApplication.shared.isIgnoringInteractionEvents {
                        UIApplication.shared.endIgnoringInteractionEvents()
                    }
                    SVProgressHUD.dismiss()
                }
                
                //Success
                if response.result.isSuccess
                {
                    //  print("isSuccess")
                    if let value = response.result.value {
                        //Removing null and <null>, and replacing number or integer to string
                        if var dictResponse = value as? NSDictionary {
                            dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                            let jsonResponce = JSON(dictResponse)
                            success(jsonResponce)
                        }
                        else{
                            if var arrResponse = value as? NSArray {
                                arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                let jsonResponce = JSON(arrResponse)
                                success(jsonResponce)
                            }
                            else {
                                success(JSON(value))
                            }
                        }
                        
//                        let dictResponce = self.isValidated(value as AnyObject)
//
//                        //Print response using below method
//                        self.printResponse(urlString: urlString, paramaters: paramaters, response: (value as AnyObject))
//
//                        if dictResponce.0 == true {
//                            success(dictResponce.1)
//                        }
//                        else {
//                            failure(dictResponce.1)
//                        }
                    }
                } else {
                    //Check response error using status code
                    if let strErrorReasonCode : Int = response.response?.statusCode {
                        
                        if let data = response.data {
                            let jsonResponce = JSON(data: data)
                            _ = ModelManager.sharedInstance.getResponseDataModel(jsonResponce.dictionaryObject! as NSDictionary)
                            let authentication_Errors = 400
                            let authentication_Errors_Range = 401..<500
                            let Alamofire_Error = -1005
                            
                            if authentication_Errors == strErrorReasonCode {
//                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
                              //  self.isUnAuthotized()
                                failure(jsonResponce)
                            }
                            else if authentication_Errors_Range.contains(strErrorReasonCode) {
//                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
//                                SmoothAlert().ShowAlert(forAlertType: .failure, string: responce.message)
                                failure(jsonResponce)
                            }
                            else if authentication_Errors_Range.contains(Alamofire_Error) {
                                self.POST(urlString, paramaters: paramaters, showLoader: showLoader, success: { (responseObject) in
                                    if response.result.isSuccess {
                                        if let value = response.result.value {
                                            //Removing null and <null>, and replacing number or integer to string
                                            if var dictResponse = value as? NSDictionary {
                                                dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                                                let jsonResponce = JSON(dictResponse)
                                                success(jsonResponce)
                                            }
                                            else{
                                                if var arrResponse = value as? NSArray {
                                                    arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                                    let jsonResponce = JSON(arrResponse)
                                                    success(jsonResponce)
                                                }
                                                else {
                                                    success(JSON(value))
                                                }
                                            }
                                            
//                                            let dictResponce = self.isValidated(value as AnyObject)
//                                            if dictResponce.0 == true {
//                                                success(dictResponce.1)
//                                            }
//                                            else {
//                                                failure(dictResponce.1)
//                                            }
                                        }
                                    }
                                }, failure: {_ in
                                    failure(jsonResponce)
                                })
                            }

                        }
                    }
                    else {
                        failure(nil)
                    }
                }
            })
            
        case .notAvailable:
            if let _ = showLoader {
                UIApplication.shared.keyWindow?.makeToast(message: Constants.kNoInternet, duration: 3.0, position: "bottom" as AnyObject)
            }
            failure(nil)
            print("No internet")
        }
    }
    
    
    func POSTFORREQ(_ urlString: String, paramaters: [String: AnyObject]? = nil, showLoader: Bool? = nil, success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        switch checkInternetConnection() {
        case .available:
            if let showLoader = showLoader {
                if showLoader {
                    DispatchQueue.main.async(execute: {
                        if !UIApplication.shared.isIgnoringInteractionEvents {
                            UIApplication.shared.beginIgnoringInteractionEvents()
                        }
                        SVProgressHUD.show(withStatus: "Please wait")
                    })
                }
            }
            
            sharedManager.request(baseUrlForRequestQuote.add(urlString: urlString), method: .post, parameters: paramaters, encoding: JSONEncoding.default, headers: self.getHeaders()).validate().responseJSON(completionHandler: { response in
                
                DispatchQueue.main.async {
                    if UIApplication.shared.isIgnoringInteractionEvents {
                        UIApplication.shared.endIgnoringInteractionEvents()
                    }
                    SVProgressHUD.dismiss()
                }
                
                //Success
                if response.result.isSuccess
                {
                    //  print("isSuccess")
                    if let value = response.result.value {
                        //Removing null and <null>, and replacing number or integer to string
                        if var dictResponse = value as? NSDictionary {
                            dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                            let jsonResponce = JSON(dictResponse)
                            success(jsonResponce)
                        }
                        else{
                            if var arrResponse = value as? NSArray {
                                arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                let jsonResponce = JSON(arrResponse)
                                success(jsonResponce)
                            }
                            else {
                                success(JSON(value))
                            }
                        }
                        
                        //                        let dictResponce = self.isValidated(value as AnyObject)
                        //
                        //                        //Print response using below method
                        //                        self.printResponse(urlString: urlString, paramaters: paramaters, response: (value as AnyObject))
                        //
                        //                        if dictResponce.0 == true {
                        //                            success(dictResponce.1)
                        //                        }
                        //                        else {
                        //                            failure(dictResponce.1)
                        //                        }
                    }
                } else {
                    //Check response error using status code
                    if let strErrorReasonCode : Int = response.response?.statusCode {
                        
                        if let data = response.data {
                            let jsonResponce = JSON(data: data)
                            _ = ModelManager.sharedInstance.getResponseDataModel(jsonResponce.dictionaryObject! as NSDictionary)
                            let authentication_Errors = 400
                            let authentication_Errors_Range = 401..<500
                            let Alamofire_Error = -1005
                            
                            if authentication_Errors == strErrorReasonCode {
                                //                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
                               // self.isUnAuthotized()
                                failure(jsonResponce)
                            }
                            else if authentication_Errors_Range.contains(strErrorReasonCode) {
                                //                                print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: paramaters)) \n\nresponse: \(jsonResponce)\n\n\n\n")
                                //                                SmoothAlert().ShowAlert(forAlertType: .failure, string: responce.message)
                                failure(jsonResponce)
                            }
                            else if authentication_Errors_Range.contains(Alamofire_Error) {
                                self.POST(urlString, paramaters: paramaters, showLoader: showLoader, success: { (responseObject) in
                                    if response.result.isSuccess {
                                        if let value = response.result.value {
                                            //Removing null and <null>, and replacing number or integer to string
                                            if var dictResponse = value as? NSDictionary {
                                                dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                                                let jsonResponce = JSON(dictResponse)
                                                success(jsonResponce)
                                            }
                                            else{
                                                if var arrResponse = value as? NSArray {
                                                    arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                                    let jsonResponce = JSON(arrResponse)
                                                    success(jsonResponce)
                                                }
                                                else {
                                                    success(JSON(value))
                                                }
                                            }
                                            
                                            //                                            let dictResponce = self.isValidated(value as AnyObject)
                                            //                                            if dictResponce.0 == true {
                                            //                                                success(dictResponce.1)
                                            //                                            }
                                            //                                            else {
                                            //                                                failure(dictResponce.1)
                                            //                                            }
                                        }
                                    }
                                }, failure: {_ in
                                    failure(jsonResponce)
                                })
                            }
                            
                        }
                    }
                    else {
                        failure(nil)
                    }
                }
            })
            
        case .notAvailable:
            if let _ = showLoader {
                UIApplication.shared.keyWindow?.makeToast(message: Constants.kNoInternet, duration: 3.0, position: "bottom" as AnyObject)
            }
            failure(nil)
            print("No internet")
        }
    }
    
    func PostMultiPart_uploadFiles(_ urlString: String, parameterDictionary: [String : String]?, arrParameterDictionaryWithFile : [[String: Data]], success:@escaping (_ responseObject:JSON) -> Void , failure:@escaping (_ errorResponse:JSON?) -> Void) {
        
        // Upload
        switch checkInternetConnection() {
        case .available:
            
            sharedManager.upload(multipartFormData: { multipartFormData in
                
                for (_, parameterDictionaryWithFile) in arrParameterDictionaryWithFile.enumerated() {
                    // Image
                    for (key, Data) in parameterDictionaryWithFile {
                        
                        if(key == "file") {
                            multipartFormData.append(Data, withName: key, fileName: "video.mp4", mimeType: "video/mp4")
                        }
                        else {
                            multipartFormData.append(Data, withName: key, fileName: "image.png", mimeType: "image/png")
                        }
                    }
                }
                
                for (key , value) in parameterDictionary! {
                    multipartFormData.append(value.EncodingText(), withName: key)
                }
                }, to: baseUrlDev.add(urlString: urlString), headers: self.getHeaders(), encodingCompletion: { (encodingResult) in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        
                        upload.uploadProgress(closure: { (Progress) in
                            print("Upload Progress: \(Progress.fractionCompleted)")
                            SVProgressHUD.showProgress(Float(Progress.fractionCompleted), status: AppAlertMsg.KUploadingImages)
                            if !UIApplication.shared.isIgnoringInteractionEvents {
                                UIApplication.shared.beginIgnoringInteractionEvents()
                            }
                        })
                        
                        upload.responseJSON { response in
                            if UIApplication.shared.isIgnoringInteractionEvents {
                                UIApplication.shared.endIgnoringInteractionEvents()
                            }
                            SVProgressHUD.dismiss()
                            
                            // Print server log
//                            let dataString = String(data: response.data!, encoding: String.Encoding.utf8)
//                            print(dataString)
                            
                            //Success
                            if response.result.isSuccess {
                                //                        print("isSuccess")
                                if let value = response.result.value {
                                    
                                    //Removing null and <null>, and replacing number or integer to string
                                    if var dictResponse = value as? NSDictionary {
                                        dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                                        let jsonResponce = JSON(dictResponse)
                                        success(jsonResponce)
                                    }
                                    else{
                                        if var arrResponse = value as? NSArray {
                                            arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                            let jsonResponce = JSON(arrResponse)
                                            success(jsonResponce)
                                        }
                                        else {
                                            success(JSON(value))
                                        }
                                    }
                                    
                                    
//                                    let dictResponce = self.isValidated(value as AnyObject)
//
//                                    //Print response using below method
//                                    self.printResponse(urlString: urlString, paramaters: parameterDictionary! as [String : AnyObject], response: (value as AnyObject))
//                                   
//                                    if dictResponce.0 == true {
//                                        success(dictResponce.1)
//                                    }
//                                    else {
//                                        failure(dictResponce.1)
//                                    }
                                }
                            } else {
                                //Check response error using status code
                                if let strErrorReasonCode : Int = response.response?.statusCode {
                                    
                                    if let data = response.data {
                                        let jsonResponce = JSON(data: data)
                                        let _ : ResponseDataModel = ModelManager.sharedInstance.getResponseDataModel(jsonResponce.dictionaryObject! as NSDictionary)
                                        let authentication_Errors = 400
                                        let authentication_Errors_Range = 401..<500
                                        let Alamofire_Error = -1005
                                        
                                        if authentication_Errors == strErrorReasonCode {
//                                            print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: parameterDictionary)) \n\nresponse: \(jsonResponce)\n\n\n\n")
//                                            self.isUnAuthotized()
                                            failure(jsonResponce)
                                        }
                                        else if authentication_Errors_Range.contains(strErrorReasonCode) {
//                                            print("\n\n\n\nauthentication_Errors_Range :\(strErrorReasonCode) \n\nmessage: \(responce.message) \n\nparamaters: \(String(describing: parameterDictionary)) \n\nresponse: \(jsonResponce)\n\n\n\n")
//                                            SmoothAlert().ShowAlert(forAlertType: .failure, string: responce.message)
                                            failure(jsonResponce)
                                        }
                                        else if authentication_Errors_Range.contains(Alamofire_Error) {
                                            self.PostMultiPart_uploadFiles(urlString, parameterDictionary: parameterDictionary, arrParameterDictionaryWithFile: arrParameterDictionaryWithFile, success: { (responseObject) in
                                                if response.result.isSuccess {
                                                    if let value = response.result.value {
                                                        //Removing null and <null>, and replacing number or integer to string
                                                        if var dictResponse = value as? NSDictionary {
                                                            dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
                                                            let jsonResponce = JSON(dictResponse)
                                                            success(jsonResponce)
                                                        }
                                                        else{
                                                            if var arrResponse = value as? NSArray {
                                                                arrResponse = (arrResponse.replacingNullsWithStrings() as NSArray).convertingNumbersToStrings()! as NSArray
                                                                let jsonResponce = JSON(arrResponse)
                                                                success(jsonResponce)
                                                            }
                                                            else {
                                                                success(JSON(value))
                                                            }
                                                        }
                                                        
//                                                        let dictResponce = self.isValidated(value as AnyObject)
//                                                        if dictResponce.0 == true {
//                                                            success(dictResponce.1)
//                                                        }
//                                                        else {
//                                                            failure(dictResponce.1)
//                                                        }
                                                    }
                                                }
                                            }, failure: {_ in
                                                failure(jsonResponce)
                                            })
                                        }
                                    }
                                }
                                else {
                                    failure(nil)
                                }
                            }
                        }
                        
                    case .failure(let encodingError):
                        //self.delegate?.showFailAlert()
                        print(encodingError)
                        break
                    }
            })
            
        case .notAvailable:
            UIApplication.shared.keyWindow?.makeToast(message: "No active internet connection.", duration: 3.0, position: "bottom" as AnyObject)
            failure(nil)
            print("No internet")
        }
    }

    // MARK: - No Internet Connection
    func checkInternetConnection() -> NetworkConnection {

        if isNetworkAvailable() {
            return .available
        }
        return .notAvailable
    }
    
    // MARK: - Check Status
    /*
    func isValidated(_ response: AnyObject?) -> (Bool, JSON) {
        
        
        //Removing null and <null>, and replacing number or integer to string
        guard var dictResponse = response as? NSDictionary else{
            return (false,nil)
        }

      //  dictResponse = (dictResponse.replacingNullsWithStrings() as NSDictionary).convertingNumbersToStrings()! as NSDictionary
        let jsonResponce = JSON(dictResponse)
        let responseModel : ResponseDataModel = ModelManager.sharedInstance.getResponseDataModel(dictResponse)
    
        
        guard let statusCodeInt = responseModel.code.toInt() else {
            print("code is not proper")
            return (false,jsonResponce)
        }
        
        let success_Range = 200..<300
        let authentication_Errors_Range = 400..<500
        let service_Errors_Range = 500..<600

        if success_Range.contains(statusCodeInt) {
            // all okey
            return (true, jsonResponce)
        }
        else if authentication_Errors_Range.contains(statusCodeInt) {
            print("authentication_Errors_Range :\(statusCodeInt)")
            self.isUnAuthotized()
            return (false,jsonResponce)
        }
        else if service_Errors_Range.contains(statusCodeInt) {
            print("service_Errors_Range :\(statusCodeInt)")
            
            SmoothAlert().ShowAlert(forAlertType: .failure, string: responseModel.message)
            return (false,jsonResponce)
        }
        else {
            return (false,nil)
        }
     }
     */
    
//    func isUnAuthotized() {
//        // we have to logout, bcos session expired , or user unauthorized
//        SmoothAlert().ShowAlert(forAlertType: .failure, isCancelButton: false, string: Constants.kUnAuthotized, completion: { (_) in
//            print("\(Constants.kUnAuthotized)")
//            //Delete all data from  user default
//            //Set sign in as Home screen
//            print("set to Login view controller ")
//            
////            GmailClass.sharedInstance().signOut()
////            LoginManager().logOut()
//            
//            UserStatus = UserType.Fresh.rawValue
//            
//            if let bundle = Bundle.main.bundleIdentifier {
//                UserDefaults.standard.removePersistentDomain(forName: bundle)
//            }
//            
//           // Constants.appDelegate.logoutSuccess()
//        })
//    }

    // MARK: - Loader method
    class func ShowActivityIndicatorInStatusBar() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    class func HideActivityIndicatorInStatusBar() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
extension String {
    func add(urlString: String) -> URL {
        return URL(string: self + urlString)!
    }

    func EncodingText() -> Data {
        return self.data(using: String.Encoding.utf8, allowLossyConversion: false)!
    }
}
