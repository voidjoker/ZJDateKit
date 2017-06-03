//
//  ZJDateManager.h
//  ZJDateKit
//
//  Created by NeroJ on 2017/5/26.
//  Copyright © 2017年 nero. All rights reserved.
//

typedef enum {
    dateUnitDay,
    dateUnitHour,
    dateUnitMinute,
    dateUnitSecond,
    
}dateUnit;

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

-(NSInteger)durationFrom:(NSDate *)fromDate to:(NSDate *)toDate withUnit:(dateUnit )dateUnit;

-(NSDate *)dateFromDate:(NSDate *)date after:(NSInteger)afternumber unit:(dateUnit)unit;

@end
