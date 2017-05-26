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

-(NSInteger)durationDayFrom:(NSDate *)fromDate to:(NSDate *)toDate{
    fromDate = [self transformToCHNZoon:fromDate];
    toDate = [self transformToCHNZoon:toDate];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval interval = [toDate timeIntervalSinceDate:fromDate];
    return interval/(24*60*60);
}

-(NSInteger)durationHourFrom:(NSDate *)fromTime to:(NSDate *)toTime{
    fromTime = [self transformToCHNZoon:fromTime];
    toTime = [self transformToCHNZoon:toTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval interval = [toTime timeIntervalSinceDate:fromTime];
    return interval/(60*60);
}

-(NSInteger)durationMinuteFrom:(NSDate *)fromTime to:(NSDate *)toTime{
    fromTime = [self transformToCHNZoon:fromTime];
    toTime = [self transformToCHNZoon:toTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval interval = [toTime timeIntervalSinceDate:fromTime];
    return interval/60;
}

-(NSDate *)dateFromDate:(NSDate *)date afterDay:(NSInteger)afterDaynumber {
    date = [self transformToCHNZoon:date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeInterval interval = afterDaynumber*24*60*60;
    NSDate *resultDate = [date dateByAddingTimeInterval:interval];
    return resultDate;
}

-(NSDate *)dateFromDate:(NSDate *)date withInterval:(NSTimeInterval)interval {
        date = [self transformToCHNZoon:date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
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
