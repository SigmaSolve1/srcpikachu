//
//  ModelManager.swift
//  SportsVenue
//
//  Created by Bhavin Mandaliya on 03/03/17.
//  Copyright © 2017 SlideMenu. All rights reserved.
//

import Foundation
import ObjectMapper
import SwiftyJSON

 class ModelManager: NSObject {
 
     static let sharedInstance = ModelManager()
     private override init() {} //This prevents others from using the default '()' initializer for this class.
    


    func getMyModel(_ dict: NSDictionary) ->MyModel  {
        return Mapper<MyModel>().map(JSON: dict as! [String : Any])!
    }
    
    func getMyLatModel(_ dict: NSDictionary) ->MyLatModel  {
        return Mapper<MyLatModel>().map(JSON: dict as! [String : Any])!
    }

    func getMyLogModel(_ dict: NSDictionary) ->MyLogModel  {
        return Mapper<MyLogModel>().map(JSON: dict as! [String : Any])!
    }
    
    func getSelectBranchModel(_ dict: NSDictionary) -> SelectBranchModel {
        return Mapper<SelectBranchModel>().map(JSON: dict as! [String : Any])!
    }
    
    func getSelectProductModel(_ dict: NSDictionary) -> SelectProductModel {
        return Mapper<SelectProductModel>().map(JSON: dict as! [String : Any])!
    }

    func getProductListModel(_ dict: NSDictionary) -> ProductListModel {
        return Mapper<ProductListModel>().map(JSON: dict as! [String : Any])!
    }
    func getCategoryListModel(_ dict: NSDictionary) -> CategoryListModel {
        return Mapper<CategoryListModel>().map(JSON: dict as! [String : Any])!
    }
    func getSubscribesModel(_ dict: NSDictionary) -> SubscribesModel {
        return Mapper<SubscribesModel>().map(JSON: dict as! [String : Any])!
    }
    
    func getPdfDownlaodModel(_ dict: NSDictionary) -> PdfDownlaodModel {
        return Mapper<PdfDownlaodModel>().map(JSON: dict as! [String : Any])!
    }
    
    //Array of model
    func getSelectProductModelArray(_ arrData: NSArray) -> [SelectProductModel] {
        return Mapper<SelectProductModel>().mapArray(JSONObject: arrData)!
    }

    //# MARK: - Get ResponseDataModel  from Server response
    func getUserDataModel(_ dict: NSDictionary) -> UserDataModel {
        return Mapper<UserDataModel>().map(JSON: dict as! [String : Any])!
    }
    
    func getResponseDataModel(_ dict: NSDictionary) -> ResponseDataModel {
        return Mapper<ResponseDataModel>().map(JSON: dict as! [String : Any])!
    }

}
    /*
    //# MARK: - Get Model from Server responce
    func getUserDataModel(_ dict: NSDictionary) -> UserDataModel {
        return Mapper<UserDataModel>().map(JSON: dict as! [String : Any])!
    }
    
    func getUserDataModelArray(_ arrData: NSArray) -> [UserDataModel] {
        let data : [UserDataModel] = Mapper<UserDataModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getCityModel(_ dict: NSDictionary) -> CityModel {
        return Mapper<CityModel>().map(JSON: dict as! [String : Any])!
    }
    
    func getCityModelArray(_ arrData: NSArray) -> [CityModel] {
        let data : [CityModel] = Mapper<CityModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getFacilitiesModel(_ dict: NSDictionary) -> FacilitiesModel {
        return Mapper<FacilitiesModel>().map(JSON: dict as! [String : Any])!
    }
    func getFacilitiesModelArray(_ arrData: NSArray) -> [FacilitiesModel] {
        let data : [FacilitiesModel] = Mapper<FacilitiesModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getCapacitiesModel(_ dict: NSDictionary) -> CapacitiesModel {
        return Mapper<CapacitiesModel>().map(JSON: dict as! [String : Any])!
    }
    func getCapacitiesModelArray(_ arrData: NSArray) -> [CapacitiesModel] {
        let data : [CapacitiesModel] = Mapper<CapacitiesModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getFloorTypeModel(_ dict: NSDictionary) -> FloorTypeModel {
        return Mapper<FloorTypeModel>().map(JSON: dict as! [String : Any])!
    }
    func getFloorTypeModelArray(_ arrData: NSArray) -> [FloorTypeModel] {
        let data : [FloorTypeModel] = Mapper<FloorTypeModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getCourtTypeModel(_ dict: NSDictionary) -> CourtTypeModel {
        return Mapper<CourtTypeModel>().map(JSON: dict as! [String : Any])!
    }
    func getCourtTypeModelArray(_ arrData: NSArray) -> [CourtTypeModel] {
        let data : [CourtTypeModel] = Mapper<CourtTypeModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getCourtModel(_ dict: NSDictionary) -> CourtModel {
        return Mapper<CourtModel>().map(JSON: dict as! [String : Any])!
    }
    func getCourtModelArray(_ arrData: NSArray) -> [CourtModel] {
        let data : [CourtModel] = Mapper<CourtModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getMyCourtModel(_ dict: NSDictionary) -> MyCourtModel {
        return Mapper<MyCourtModel>().map(JSON: dict as! [String : Any])!
    }
    func getMyCourtModelArray(_ arrData: NSArray) -> [MyCourtModel] {
        let data : [MyCourtModel] = Mapper<MyCourtModel>().mapArray(JSONObject: arrData)!
        return data
    }

    func getCourtDetailModel(_ dict: NSDictionary) -> CourtDetailModel {
        return Mapper<CourtDetailModel>().map(JSON: dict as! [String : Any])!
    }
    func getCourtDetailModelArray(_ arrData: NSArray) -> [CourtDetailModel] {
        let data : [CourtDetailModel] = Mapper<CourtDetailModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getCourtsRatesModel(_ dict: NSDictionary) -> CourtsRatesModel {
        return Mapper<CourtsRatesModel>().map(JSON: dict as! [String : Any])!
    }
    func getCourtsRatesModelArray(_ arrData: NSArray) -> [CourtsRatesModel] {
        let data : [CourtsRatesModel] = Mapper<CourtsRatesModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    func getFriendModel(_ dict: NSDictionary) -> FriendModel {
        return Mapper<FriendModel>().map(JSON: dict as! [String : Any])!
    }
    func getFriendlArray(_ arrData: NSArray) -> [FriendModel] {
        let data : [FriendModel] = Mapper<FriendModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get My Team Model from Server response
    func getMyTeamDataModel(_ dict: NSDictionary) -> MyTeamModel {
        return Mapper<MyTeamModel>().map(JSON: dict as! [String : Any])!
    }
    func getMyTeamDataModelArray(_ arrData: NSArray) -> [MyTeamModel] {
        let data : [MyTeamModel] = Mapper<MyTeamModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get My Notification Model from Server response
    func getMyNotificationModel(_ dict: NSDictionary) -> NotificationModel {
        return Mapper<NotificationModel>().map(JSON: dict as! [String : Any])!
    }
    func getMyNotificationModelArray(_ arrData: NSArray) -> [NotificationModel] {
        let data : [NotificationModel] = Mapper<NotificationModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get My Booking Model from Server response
    func getMyBookingModel(_ dict: NSDictionary) -> MyBookingModel {
        return Mapper<MyBookingModel>().map(JSON: dict as! [String : Any])!
    }
    func getMyBookingModelArray(_ arrData: NSArray) -> [MyBookingModel] {
        let data : [MyBookingModel] = Mapper<MyBookingModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get Opponent Team Model from Server response
    func getOpponentTeamDataModel(_ dict: NSDictionary) -> OpponentTeamModel {
        return Mapper<OpponentTeamModel>().map(JSON: dict as! [String : Any])!
    }
    func getOpponentTeamDataModelArray(_ arrData: NSArray) -> [OpponentTeamModel] {
        let data : [OpponentTeamModel] = Mapper<OpponentTeamModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get Coupon Model from Server response
    func getCouponModel(_ dict: NSDictionary) -> CouponModel {
        return Mapper<CouponModel>().map(JSON: dict as! [String : Any])!
    }
    func getCouponModelArray(_ arrData: NSArray) -> [CouponModel] {
        let data : [CouponModel] = Mapper<CouponModel>().mapArray(JSONObject: arrData)!
        return data
    }

    //# MARK: - Get ReviewData Model from Server response
    func getReviewDataModelModel(_ dict: NSDictionary) -> ReviewDataModel {
        return Mapper<ReviewDataModel>().map(JSON: dict as! [String : Any])!
    }
    func getReviewDataModelArray(_ arrData: NSArray) -> [ReviewDataModel] {
        let data : [ReviewDataModel] = Mapper<ReviewDataModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get ChallangeResult Model from Server response
    func getChallangeResultModel(_ dict: NSDictionary) -> ChallangeResultModel {
        return Mapper<ChallangeResultModel>().map(JSON: dict as! [String : Any])!
    }
    func getChallangeResultModelArray(_ arrData: NSArray) -> [ChallangeResultModel] {
        let data : [ChallangeResultModel] = Mapper<ChallangeResultModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get OpenChallange Model from Server response
    func getOpenChallangeModel(_ dict: NSDictionary) -> OpenChallangeModel {
        return Mapper<OpenChallangeModel>().map(JSON: dict as! [String : Any])!
    }
    func getOpenChallangeModelArray(_ arrData: NSArray) -> [OpenChallangeModel] {
        let data : [OpenChallangeModel] = Mapper<OpenChallangeModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get MyChallangeResult Model from Server response
    func getMyChallangeResultModel(_ dict: NSDictionary) -> MyChallangeResultModel {
        return Mapper<MyChallangeResultModel>().map(JSON: dict as! [String : Any])!
    }
    func getMyChallangeResultModelArray(_ arrData: NSArray) -> [MyChallangeResultModel] {
        let data : [MyChallangeResultModel] = Mapper<MyChallangeResultModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get MyCourtBooking Model from Server response
    func getMyCourtBookingModel(_ dict: NSDictionary) -> MyCourtBookingModel {
        return Mapper<MyCourtBookingModel>().map(JSON: dict as! [String : Any])!
    }
    func getMyCourtBookingModelArray(_ arrData: NSArray) -> [MyCourtBookingModel] {
        let data : [MyCourtBookingModel] = Mapper<MyCourtBookingModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get MyBookingDetail Model from Server response
    func getMyBookingDetailModel(_ dict: NSDictionary) -> MyBookingDetailModel {
        return Mapper<MyBookingDetailModel>().map(JSON: dict as! [String : Any])!
    }
    func getMyBookingDetailModelArray(_ arrData: NSArray) -> [MyBookingDetailModel] {
        let data : [MyBookingDetailModel] = Mapper<MyBookingDetailModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    
    //# MARK: - Get BookingConfirmation Model from Server response
    func getBookingConfirmationModel(_ dict: NSDictionary) -> BookingConfirmationModel {
        return Mapper<BookingConfirmationModel>().map(JSON: dict as! [String : Any])!
    }
    func getBookingConfirmationModelArray(_ arrData: NSArray) -> [BookingConfirmationModel] {
        let data : [BookingConfirmationModel] = Mapper<BookingConfirmationModel>().mapArray(JSONObject: arrData)!
        return data
    }
    
    //# MARK: - Get FilterResultModel  from Plist
    func getFilterResultModel(_ dict: NSDictionary) -> FilterResultModel {
        return Mapper<FilterResultModel>().map(JSON: dict as! [String : Any])!
    }
    
    //# MARK: - Get ErrorResponse Model from Server response
    func getErrorResponseModel(_ dict: NSDictionary) -> ErrorResponseModel {
        return Mapper<ErrorResponseModel>().map(JSON: dict as! [String : Any])!
    }
    */
