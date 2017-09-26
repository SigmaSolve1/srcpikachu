//
//  File.swift
//  SportsVenue
//
//  Created by Bhavin Thummar on 21/02/17.
//  Copyright © 2017 SlideMenu. All rights reserved.
//

import Foundation
import ObjectMapper

class SelectProductModel: NSObject, Mappable  {
    
    var id: String!
    var name: String!
    var image: String!

    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        id <- map["id"]
        name   <- map["name"]
        image   <- map["image"]
    }

    //Custom method
    init(id:String, name:String, image:String) {
        self.id = id
        self.name = name
        self.image = image
    }
}

class ProductListModel: NSObject, Mappable  {
    
    var prod_image: String!
    var prod_num: String!
    var prodname: String!
    var brief_desc: String!
    var id: String!

    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        prod_image <- map["prod_image"]
        prod_num   <- map["prod_num"]
        prodname   <- map["prodname"]
        brief_desc   <- map["brief_desc"]
        id   <- map["id"]

    }
    
    //Custom method
    init(prod_image:String, prod_num:String,prodname:String, brief_desc:String, id:String) {
        self.prod_image = prod_image
        self.prod_num = prod_num
        self.prodname = prodname
        self.brief_desc = brief_desc
        self.id = id
    }
}

class CategoryListModel: NSObject, Mappable  {
    
    var count: String!
    var subcatname: String!
    var id: String!
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        id <- map["id"]
        subcatname   <- map["subcatname"]
        count   <- map["count"]
    }
    
    //Custom method
    init(id:String, subcatname:String, count:String) {
        self.id = id
        self.subcatname = subcatname
        self.count = count
    }
}

class SubscribesModel: Mappable {
    
  
    var strSubscrib: String!
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        strSubscrib <- map["id"]
           }
    
    //Custom method
    init(strSubscrib:String) {
        self.strSubscrib = strSubscrib
    }
}

//class MyModel {
//    
//    private let icao: String
//    private let name: String
//    private let city: String
//    private let country: String
//    private let lat: Int32
//    private let lon: Int32
//    
//    
//    init(dict: NSDictionary) {
//        self.city = dict["city"] as? String ?? ""
//        self.country = dict["country"] as? String ?? ""
//        self.name = dict["name"] as? String ?? ""
//        self.icao = dict["icao"] as? String ?? ""
//        self.lat = dict["lat"] as! Int32
//        self.lon = dict["lon"] as! Int32
//    }
//}


class MyModel: Mappable {
    
    var icao: String!
    var name: String!
    var city: String!
    var country: String!
    var lat: String!
    var lon: String!
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        icao <- map["icao"]
        name   <- map["name"]
        city   <- map["city"]
        country   <- map["country"]
        lat   <- map["lat"]
        lon   <- map["lon"]
    }
    
    //Custom method
    init(icao:String, name:String,city:String, country:String, lat:String, lon: String) {
        
        self.icao = icao
        self.name = name
        self.city = city
        self.country = country
        self.lat = lat
        self.lon = lon
    }
}



class MyLatModel: Mappable {
    
    var lat: Double!
 
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        lat   <- map["lat"]
        
    }
    
    //Custom method
    init(lat:Double) {
    
        self.lat = lat
       
    }
}

class MyLogModel: Mappable {
    

    var lon: Double!
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        

        lon   <- map["lon"]
    }
    
    //Custom method
    init(lon: Double) {
        

        self.lon = lon
    }
}





class PdfDownlaodModel: Mappable {
    
    
    var fromemail: String!
    var toemail: String!
    var manual_file: String!
    var id: String!
    var product: String!
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        
        fromemail <- map["fromemail"]
        toemail   <- map["toemail"]
        manual_file   <- map["manual_file"]
        id <- map["id"]
        product   <- map["product"]
        
    }
    
    //Custom method
    init(fromemail:String, toemail:String, manual_file:String, id:String, product:String) {
     
        self.fromemail = fromemail
        self.toemail = toemail
        self.manual_file = manual_file
        self.id = id
        self.product = product
       
    }
}
class ResponseDataModel: Mappable {
    
    var table : [SelectProductModel]?
    var table_document : [DocumentModel]?
    var table_SelectGroup : [SelectBranchModel]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        table <- map["table"]
        table_document <- map["table"]
        table_SelectGroup <- map["sitter_groups"]
    }
}

class DocumentModel: Mappable {

    var doc_name : String!
    var doc_Value : String!
    var doc_Ext : String!

    required init?(map: Map) {
    }

    // Mappable
    func mapping(map: Map) {
        doc_name <- map["doc_name"]
        doc_Value <- map["doc_Value"]
        doc_Ext <- map["doc_Ext"]
    }
}



//[
//    {
//        "id": "302",
//        "first_name": "NewSitter",
//        "last_name": "Test",
//        "profile_picture": "https://pocketsitter.ppmdemos.com/wp-content/uploads/users-avatar/new@gmail.com/joinus.JPG"
//    }
//]

class SelectBranchModel: NSObject, Mappable , NSCoding {
    
    var tag_name: String!
    var id: String!
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        tag_name <- map["tag_name"]
        id   <- map["id"]
      
    }
    
    //Custom method
    init(tag_name:String, id:String) {
        
        self.tag_name = tag_name
        self.id = id
         }
    
    //To save model in user default
    @objc required public init?(coder decoder: NSCoder) {
        tag_name = decoder.decodeObject(forKey: "tag_name")   as! String
        id   = decoder.decodeObject(forKey: "id")     as! String
   
    }
    
    @objc open func encode(with coder: NSCoder) {
        
        coder.encode(tag_name, forKey: "tag_name")
        coder.encode(id, forKey: "id")
   
    }
}


class UserDataModel : NSObject, Mappable, NSCoding {
    
    var id: String!
    var parent_id: String!
    var name: String!
    var role: String!
    
    var email: String!
    var email_verification_code: String!
    var email_verified: String!
    var mobile: String!
    var mobile_verification_code: String!
    
    var remember_token: String!
    //var activated: String!
    var last_login: String!
    var last_update: String!
    var status: String!
    
    var account_type: String!
    var access_token: String!
    var created_at: String!
    var updated_at: String!
    
    var profile_image: String!

    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        
        id <- map["xcode"]
        parent_id <- map["parent_id"]
        name <- map["name"]
        role <- map["role"]
        
        email <- map["email"]
        email_verification_code <- map["email_verification_code"]
        email_verified <- map["email_verified"]
        mobile <- map["mobile"]
        mobile_verification_code <- map["mobile_verification_code"]
        
        remember_token <- map["remember_token"]
        //activated <- map["activated"]
        last_login <- map["last_login"]
        last_update <- map["last_update"]
        status <- map["status"]
        
        account_type        <- map["account_type"]
        access_token        <- map["access_token"]
        created_at          <- map["created_at"]
        updated_at          <- map["updated_at"]
        
        profile_image       <- map["profile_image"]
    }
    
    @objc required public init?(coder decoder: NSCoder) {
        id = decoder.decodeObject(forKey: "id") as! String
        parent_id = decoder.decodeObject(forKey: "parent_id") as! String
        name = decoder.decodeObject(forKey: "name") as! String
        role = decoder.decodeObject(forKey: "role") as! String
        
        email = decoder.decodeObject(forKey: "email") as! String
        email_verification_code = decoder.decodeObject(forKey: "email_verification_code") as! String
        email_verified = decoder.decodeObject(forKey: "email_verified") as! String
        mobile = decoder.decodeObject(forKey: "mobile") as! String
        mobile_verification_code = decoder.decodeObject(forKey: "mobile_verification_code") as! String
        
        remember_token = decoder.decodeObject(forKey: "remember_token") as! String
        //activated = decoder.decodeObject(forKey: "activated") as! String
        last_login = decoder.decodeObject(forKey: "last_login") as! String
        last_update = decoder.decodeObject(forKey: "last_update") as! String
        status = decoder.decodeObject(forKey: "status") as! String

        
        account_type = decoder.decodeObject(forKey: "account_type") as! String
        access_token = decoder.decodeObject(forKey: "access_token") as! String
        created_at = decoder.decodeObject(forKey: "created_at") as! String
        updated_at = decoder.decodeObject(forKey: "updated_at") as! String
        
        profile_image = decoder.decodeObject(forKey: "profile_image") as! String
    }
    
    @objc open func encode(with coder: NSCoder) {
        
        coder.encode(id, forKey: "id")
        coder.encode(parent_id, forKey: "parent_id")
        coder.encode(name, forKey: "name")
        coder.encode(role, forKey: "role")
        
        coder.encode(email, forKey: "email")
        coder.encode(email_verification_code, forKey: "email_verification_code")
        coder.encode(email_verified, forKey: "email_verified")
        coder.encode(mobile, forKey: "mobile")
        coder.encode(mobile_verification_code, forKey: "mobile_verification_code")

        coder.encode(remember_token, forKey: "remember_token")
        //coder.encode(activated, forKey: "activated")
        coder.encode(last_login, forKey: "last_login")
        coder.encode(last_update, forKey: "last_update")
        coder.encode(status, forKey: "status")

        coder.encode(account_type, forKey: "account_type")
        coder.encode(access_token, forKey: "access_token")
        coder.encode(created_at, forKey: "created_at")
        coder.encode(updated_at, forKey: "updated_at")
        
        coder.encode(profile_image, forKey: "profile_image")
    }
}
