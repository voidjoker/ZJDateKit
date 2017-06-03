//
//  ZJDateManager.m
//  ZJDateKit
//
//  Created by NeroJ on 2017/5/26.
//  Copyright © 2017年 nero. All rights reserved.
//

#import "ZJDateManager.h"
static ZJDateManager *_manager;

@implementation ZJDateManager

+(id)shareinstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if(_manager == nil){
            _manager = [[ZJDateManager alloc]init];
            _manager.calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierRepublicOfChina];
        }
    });
    return _manager;
}
-(NSDate *)today{
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    return [NSDate dateWithTimeIntervalSinceNow:interval];
}

-(NSDate *)yesterday{
    NSTimeInterval timeInterval = -24*60*60;
    return [[NSDate alloc]initWithTimeInterval:timeInterval sinceDate:[self today]];
}

-(NSDate *)tomorrow{
    NSTimeInterval timeInterval = 24*60*60;
    return [[NSDate alloc]initWithTimeInterval:timeInterval sinceDate:[self today]];
}

-(NSInteger )dayNumberOfCurrentMonth{
    NSDate *currentDate = [self today];
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:currentDate];
    return range.length;
}

-(NSInteger)dayNumberOfMonthWithDate:(NSDate *)date{
    date = [self transformToCHNZoon:date];
    NSRange range = [self.calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

-(NSDateComponents *)getDateInfoWithDate:(NSDate *)date{
    date = [self transformToCHNZoon:date];
    NSDateComponents *comps = [self.calendar components:NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday fromDate:date];
    return comps;
}

-(NSDate *)dateFromString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateStr];
    date = [self transformToCHNZoon:date];
    return date;
}

-(NSDate *)dateFromString:(NSString *)dateStr WithFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateStr];
    date = [self transformToCHNZoon:date];
    return date;
}

-(NSString *)stringFromDate:(NSDate *)date {
    date = [self transformToCHNZoon:date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

-(NSString *)stringFromDate:(NSDate *)date WithFormat:(NSString *)format{
    date = [self transformToCHNZoon:date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
-(NSInteger)weekWithDay:(NSDate *)date {
    date = [self transformToCHNZoon:date];
    NSDateComponents *comp = [self.calendar components:NSCalendarUnitWeekday fromDate:date];
    return comp.weekday;
}

-(NSInteger)durationFrom:(NSDate *)fromDate to:(NSDate *)toDate withUnit:(dateUnit )dateUnit{
    fromDate = [self transformToCHNZoon:fromDate];
    toDate = [self transformToCHNZoon:toDate];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval interval = [toDate timeIntervalSinceDate:fromDate];
    switch (dateUnit) {
        case dateUnitDay:
            return interval/(24*60*60);
            break;
        case dateUnitHour:
            return interval/(60*60);
            break;
        case dateUnitMinute:
            return interval/60;
            break;
        case dateUnitSecond:
            return interval;
            break;
        default:
            return 0;
            break;
    }
}

-(NSDate *)dateFromDate:(NSDate *)date after:(NSInteger)afternumber unit:(dateUnit)unit {
    date = [self transformToCHNZoon:date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval interval = 0;
    switch (unit) {
        case dateUnitDay:
            interval = afternumber*24*60*60;
            break;
        case dateUnitHour:
            interval = afternumber*60*60;
            break;
        case dateUnitMinute:
            interval = afternumber*60;
            break;
        case dateUnitSecond:
            interval = afternumber;
            break;
        default:
            break;
    }
    NSDate *resultDate = [date dateByAddingTimeInterval:interval];
    return resultDate;
}

-(NSDate *)transformToCHNZoon:(NSDate *)date{
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:[NSDate date]];
    date = [[NSDate alloc]initWithTimeInterval:interval sinceDate:date];
    return date;
}
@end
