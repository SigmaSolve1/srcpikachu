//
//  NSDate.swift
//  OnSide
//
//  Created by Mehul Parmar on 14/03/16.
//  Copyright © 2016 OpenXcell Studio. All rights reserved.
//

import Foundation
import UIKit

extension NSDate {
    func addMinsToDate(minutes: Int) -> NSDate! {
        return NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!.date(byAdding: NSCalendar.Unit.minute, value: minutes, to: self as Date, options: NSCalendar.Options() ) as NSDate!
    }
    
    func dateFromUTCOfFormat(dateFormat: String, dateString: String) -> NSDate {
        
        let dateFormatter         = DateFormatter()
        dateFormatter.timeZone    = NSTimeZone(name: "UTC") as TimeZone!
        dateFormatter.dateFormat  = dateFormat
        
        if let date = dateFormatter.date(from: dateString){
            return date as NSDate
        } else {
            return NSDate()
        }
    }
    
    func convertDateToStringInCurrentTimezone(requireFormat: String) -> String {
        let dateFormatter         = DateFormatter()
        dateFormatter.timeZone    = NSTimeZone.system
        dateFormatter.dateFormat  = requireFormat
        return dateFormatter.string(from: self as Date)
    }
    
    func convertDateToString(dateFormat: String) -> String {
        let dateFormatter         = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.system
        dateFormatter.dateFormat  = dateFormat
        return dateFormatter.string(from: self as Date)
    }
    
    func convertDateToString(dateFormat: String, isSystemTimeZone : Bool) -> String {
        let dateFormatter         = DateFormatter()
        
        if isSystemTimeZone {
            dateFormatter.timeZone = NSTimeZone.system
        }
        else {
            dateFormatter.timeZone    = NSTimeZone(name: "UTC") as TimeZone!
        }
        dateFormatter.dateFormat  = dateFormat
        return dateFormatter.string(from: self as Date)
    }
    
    
    func addDaystoGivenDate(baseDate:NSDate, numberOfDaysToAdd:Int) -> NSDate {
        let dateComponents = NSDateComponents()
        let currentCalendar = NSCalendar.current
        _ = NSCalendar.Options()
        
        dateComponents.day = numberOfDaysToAdd
        
        let newDate = currentCalendar.date(byAdding: dateComponents as DateComponents, to: baseDate as Date)//(dateComponents, toDate: baseDate, options: calendarOption)
        return newDate! as NSDate
    }
    
    func getAboutTime(timeString: String) -> String {
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "HH:mm:ss"
        let activeTimeDate = dateFormatter.date(from: timeString)
        
        
        dateFormatter.dateFormat = "HH"
        let hourString = dateFormatter.string(from: activeTimeDate!) + "h"
        
        dateFormatter.dateFormat = "mm"
        let minuteString = dateFormatter.string(from: activeTimeDate!) + "m"
        
        if hourString == "00h" && minuteString != "00m" {
            return minuteString
        } else if hourString != "00h" && minuteString == "00m" {
            return hourString
        } else {
            return hourString  + " " + minuteString
        }
    }
    
//    func yearsFrom(date:NSDate) -> Int{
//        return NSCalendar.currentCalendar.dateComponents(Set<Calendar.Component>([.year]), from: date, to: self)
//        //NSCalendar.currentCalendar.components(.Year, fromDate: date, toDate: self, options: []).year
//    }
//    func monthsFrom(date:NSDate) -> Int{
//        return NSCalendar.currentCalendar.components(.Month, fromDate: date, toDate: self, options: []).month
//    }
//    func weeksFrom(date:NSDate) -> Int{
//        return NSCalendar.currentCalendar.components(.WeekOfYear, fromDate: date, toDate: self, options: []).weekOfYear
//    }
//    func daysFrom(date:NSDate) -> Int{
//        return NSCalendar.currentCalendar().components(.Day, fromDate: date, toDate: self, options: []).day
//    }
//    func hoursFrom(date:NSDate) -> Int{
//        return NSCalendar.currentCalendar().components(.Hour, fromDate: date, toDate: self, options: []).hour
//    }
//    func minutesFrom(date:NSDate) -> Int{
//        return NSCalendar.currentCalendar().components(.Minute, fromDate: date, toDate: self, options: []).minute
//    }
//    func secondsFrom(date:NSDate) -> Int{
//        return NSCalendar.currentCalendar().components(.Second, fromDate: date, toDate: self, options: []).second
//    }
    
//    func offsetFrom(date:NSDate) -> String {
//        if yearsFrom(date)   > 0 { return "\(yearsFrom(date: date)) year"   }
//        if monthsFrom(date)  > 0 { return "\(monthsFrom(date)) month"  }
//        if weeksFrom(date)   > 0 { return "\(weeksFrom(date)) week"   }
//        if daysFrom(date)    > 0 { return "\(daysFrom(date)) day"    }
//        if hoursFrom(date)   > 0 { return "\(hoursFrom(date)) hour"   }
//        if minutesFrom(date) > 0 { return "\(minutesFrom(date)) min" }
//        if secondsFrom(date) > 0 { return "\(secondsFrom(date)) sec" }
//        return ""
//    }
    
    func convertTimeStampToTime(timeToBeUsed:Double) -> String {
        let time = NSDate(timeIntervalSince1970: Double(timeToBeUsed/1000))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat_AM_PM
        //        dateFormatter.timeZone    = NSTimeZone(name: "UTC")
        dateFormatter.timeZone = NSTimeZone.system
        let timeCurrent = dateFormatter.string(from: time as Date)
        
        //Compate to current date
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = Constants.dateFormat_Date_only
        let strTodayDate = dateformatter.string(from: NSDate() as Date)
        let strTimestampDate = dateformatter.string(from: time as Date)
        
        //if timestamp date and current date is same then no need to add date only display time bcos its today's message
        if strTodayDate == strTimestampDate {
            dateformatter.dateFormat = Constants.dateFormat_Time_only
            return dateformatter.string(from: time as Date)
        }
        else {
            return timeCurrent
        }
    }
    
    func convertTimeStampToDate(timeToBeUsed:Double) -> NSDate {
        return NSDate(timeIntervalSince1970:(timeToBeUsed/1000))
    }
    
    func convertTimeStampToDate(timeToBeUsed:Int, dateFormat : String) -> NSDate {
        let time = NSDate(timeIntervalSince1970: Double(timeToBeUsed/1000))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        //                dateFormatter.timeZone    = NSTimeZone(name: "UTC")
        dateFormatter.timeZone = NSTimeZone.system
        let strDate = dateFormatter.string(from: time as Date)
        let date = dateFormatter.date(from: strDate)
        return date! as NSDate
    }
    
    func convertStrToDate (dateFormat : String) -> String {
        
        // Destination format :
        let dateDestinationFormat = DateFormatter()
        dateDestinationFormat.dateFormat = dateFormat
        
        // Convert current String Date to NSDate
        let stringFromDate = dateDestinationFormat.string(from: self as Date)
        return stringFromDate
    }
    
    
    class func getDateFromTimeStamp(timestamp: Double) -> NSDate {
        //        if timestamp > 0 {
        return NSDate(timeIntervalSince1970:(timestamp/1000))
        //        }
        //        else {
        //            print("-------------------------------timestamp found zero")
        //            return NSDate()
        //        }
    }
    
    func convertDateToTimestamp () -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.dateFormat
        dateFormatter.timeZone = NSTimeZone.system
        let strDate = dateFormatter.string(from: self as Date)
        let date = dateFormatter.date(from: strDate)
        return Int(date!.timeIntervalSince1970*1000)
    }
    
    var Timestamp: NSNumber {
        let pi:Double = NSDate().timeIntervalSince1970 * 1000
        let strTemp = String(format:"%.0f", pi)
        
        let numberTimestamp = NSNumber(value:(strTemp as NSString).floatValue)
        return numberTimestamp
        //        return NSNumber(double: NSDate().timeIntervalSince1970 * 1000)
    }
    
    //    func getCurrentTimeStamp () -> NSDate {
    //        let dateFormatter = NSDateFormatter()
    //        dateFormatter.dateFormat = Constants.dateFormat
    //        //        dateFormatter.timeZone    = NSTimeZone(name: "UTC")
    //        dateFormatter.timeZone = NSTimeZone.systemTimeZone()
    //        let strDate = NSDate().timeIntervalSince1970 * 1000
    //        let date = dateFormatter.dateFromString(String(strDate))
    //        return date!
    //    }
    
//    func calculateAge () -> Int {
//        return NSCalendar.currentCalendar.components(.Year, fromDate: self, toDate: NSDate(), options: []).year
//    }
    
    func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare as Date) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
        let calendar = NSCalendar.current
        let now = NSDate()
        let earliest = now.earlierDate(date as Date)
        let latest = (earliest == now as Date) ? date : now
//        let components:NSDateComponents = calendar.components([NSCalendar.Unit.Minute , NSCalendar.Unit.Hour , NSCalendar.Unit.Day , NSCalendar.Unit.WeekOfYear , NSCalendar.Unit.Month , NSCalendar.Unit.Year , NSCalendar.Unit.Second], fromDate: earliest, toDate: latest, options: NSCalendar.Options())
        
        let unitFlags = Set<Calendar.Component>([.hour, .year, .minute, .day , .weekOfYear, .month, .second])
//        var calendar = Calendar.current
//        calendar.timeZone = TimeZone(identifier: "UTC")!
        
        let components = calendar.dateComponents(unitFlags, from: earliest, to: latest as Date)
        
//        let newDate = currentCalendar.date(byAdding: dateComponents as DateComponents, to: baseDate as Date)
        
        if (components.year! >= 2) {
            return "\(components.year!) years"
        } else if (components.year! >= 1){
            if (numericDates){
                return "1 year"
            } else {
                return "Last year"
            }
        } else if (components.month! >= 2) {
            return "\(components.month!) months"
        } else if (components.month! >= 1){
            if (numericDates){
                return "1 month"
            } else {
                return "Last month"
            }
        } else if (components.weekOfYear! >= 2) {
            return "\(components.weekOfYear!) weeks"
        } else if (components.weekOfYear! >= 1){
            if (numericDates){
                return "1 week"
            } else {
                return "Last week"
            }
        } else if (components.day! >= 2) {
            return "\(components.day!) days"
        } else if (components.day! >= 1){
            if (numericDates){
                return "1 day"
            } else {
                return "Yesterday"
            }
        } else if (components.hour! >= 2) {
            return "\(components.hour!) hours"
        } else if (components.hour! >= 1){
            if (numericDates){
                return "1 hour"
            } else {
                return "An hour"
            }
        } else if (components.minute! >= 2) {
            return "\(components.minute!) minutes"
        } else if (components.minute! >= 1){
            if (numericDates){
                return "1 minute"
            } else {
                return "A minute"
            }
        } else if (components.second! >= 3) {
            return "\(components.second!) seconds"
        } else {
            return "Just now"
        }
        
    }
}
