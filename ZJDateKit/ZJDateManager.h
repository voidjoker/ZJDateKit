//
//  ZJDateManager.h
//  ZJDateKit
//
//  Created by NeroJ on 2017/5/26.
//  Copyright © 2017年 nero. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJDateManager : NSObject
@property(nonatomic,strong) NSCalendar *calendar;

+(id)shareinstance;

-(NSDate *)today;

-(NSDate *)yesterday;

-(NSDate *)tomorrow;

-(NSInteger )dayNumberOfCurrentMonth;

-(NSInteger)dayNumberOfMonthWithDate:(NSDate *)date;

-(NSDateComponents *)getDateInfoWithDate:(NSDate *)date;

-(NSDate *)dateFromString:(NSString *)dateStr;

-(NSDate *)dateFromString:(NSString *)dateStr WithFormat:(NSString *)format;

-(NSString *)stringFromDate:(NSDate *)date;

-(NSString *)stringFromDate:(NSDate *)date WithFormat:(NSString *)format;

-(NSInteger)weekWithDay:(NSDate *)date;

-(NSInteger)durationDayFrom:(NSDate *)fromDate to:(NSDate *)toDate;

-(NSInteger)durationHourFrom:(NSDate *)fromTime to:(NSDate *)toTime;

-(NSInteger)durationMinuteFrom:(NSDate *)fromTime to:(NSDate *)toTime;

-(NSDate *)dateFromDate:(NSDate *)date afterDay:(NSInteger)afterDaynumber;

-(NSDate *)dateFromDate:(NSDate *)date withInterval:(NSTimeInterval)interval;

@end
