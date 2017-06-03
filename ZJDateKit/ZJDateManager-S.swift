//
//  ZJDateManager-S.swift
//  ZJDateKit
//
//  Created by NeroJ on 2017/6/1.
//  Copyright © 2017年 nero. All rights reserved.
//

import UIKit

enum dateUnit:Int {
    case dateUnitDay
    case dateUnitHour
    case dateUnitMinute
    case dateUnitSecond
}

class ZJDateManager_S: NSObject {
    
    static let calendar = NSCalendar(calendarIdentifier: .republicOfChina)!
    
    static func today() -> NSDate {
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT(for: Date())
        return NSDate(timeIntervalSinceNow: TimeInterval(interval))
    }
    static func yesterday() -> NSDate{
        let interval = -24*60*60;
        return NSDate(timeInterval: TimeInterval(interval), since: today() as Date)
    }
    static func tomorrow() -> NSDate {
        let interval = 24*60*60;
        return NSDate(timeInterval: TimeInterval(interval), since: today() as Date)
    }
    static func dayNumberOfCurrentMonth() -> NSInteger{
        let range = calendar.range(of: .day, in: .month, for: today() as Date)
        return range.length
    }
    static func dayNumberOfMonthWith(date: NSDate) -> NSInteger{
        let newDate = transformToCHNZoon(date: date)
        let range = calendar.range(of: .day, in: .month, for: newDate as Date)
        return range.length
    }
    static func dateInfoWithDate(date:NSDate) -> NSDateComponents {
        let newDate = transformToCHNZoon(date: date)
        let comps = calendar.components([.month,.day,.hour,.minute,.second,.weekday], from: newDate as Date)
        return comps as NSDateComponents
    }
    static func dateFromString(_ dateStr:String) -> NSDate {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var date = formatter.date(from: dateStr);
        date = transformToCHNZoon(date: date! as NSDate) as Date;
        return date! as NSDate
    }
    static func dateFromString(_ dateStr:String,format:String) -> NSDate {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        var date = formatter.date(from: dateStr)
        date = transformToCHNZoon(date: date! as NSDate) as Date;
        return date! as NSDate
    }
    static func stringFromDate(_ date :NSDate) -> String {
        let newDate = self.transformToCHNZoon(date: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: newDate as Date)
    }
    
    static func stringFromDate(_ date :NSDate,format:String) -> String {
        let newDate = self.transformToCHNZoon(date: date)
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: newDate as Date)
    }
    
    static func weekDayWithDay(date:NSDate) -> Int{
        let newDate = transformToCHNZoon(date: date)
        let comps = self.calendar.components(.weekday, from: newDate as Date)
        return comps.weekday!
    }
    static func durationFrom(fromDate:NSDate,toDate:NSDate,unit:dateUnit) -> Int {
        var fromDate = fromDate
        fromDate = transformToCHNZoon(date: fromDate)
        var toDate = toDate
        toDate = transformToCHNZoon(date: toDate)
        let interval = toDate.timeIntervalSince(fromDate as Date) 
        switch unit {
        case .dateUnitDay:
            return Int(interval/(24.0*60*60))
        case .dateUnitHour:
            return Int(interval/(60*60))
        case .dateUnitMinute:
            return Int(interval/60)
        case .dateUnitSecond:
            return Int(interval)
        }
    }
    static func dateFromDate(_ fromDate:NSDate, after:Double,unit:dateUnit) -> NSDate {
        var fromDate = fromDate
        fromDate = transformToCHNZoon(date: fromDate)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var interval = 0;
        switch unit {
        case .dateUnitDay:
            interval = Int(after * 24 * 60 * 60)
            break
        case .dateUnitHour:
            interval = Int(after * 60 * 60)
            break
        case .dateUnitMinute:
            interval = Int(after * 60)
            break
        case .dateUnitSecond:
            interval = Int(after)
            break
        default:
            break
        }
        return fromDate.addingTimeInterval(TimeInterval(interval))
    }
    
    static func transformToCHNZoon(date : NSDate) -> NSDate{
        let zone = NSTimeZone.system
        let interval = zone.secondsFromGMT(for: Date())
        let newDate = Date.init(timeInterval: TimeInterval(interval), since: date as Date)
        return newDate as NSDate
    }
    
}
