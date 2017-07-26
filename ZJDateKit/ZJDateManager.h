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
//2017-07-19 03:48:47 +0000
-(NSDate *)today;

//2017-07-18 03:48:47 +0000
-(NSDate *)yesterday;

//2017-07-20 03:48:47 +0000
-(NSDate *)tomorrow;

//31
-(NSInteger )dayNumberOfCurrentMonth;

//31
-(NSInteger)dayNumberOfMonthWithDate:(NSDate *)date;

/*Month: 7
Leap month: no
Day: 19
Hour: 3
Minute: 48
Second: 47
Weekday: 4*/
-(NSDateComponents *)getDateInfoWithDate:(NSDate *)date;

//2017-06-12 20:21:10 +0000
-(NSDate *)dateFromString:(NSString *)dateStr;

//2017-07-20 00:00:00 +0000
-(NSDate *)dateFromString:(NSString *)dateStr WithFormat:(NSString *)format;

//2017-07-18 03:48:47
-(NSString *)stringFromDate:(NSDate *)date;

//2017年07月20日
-(NSString *)stringFromDate:(NSDate *)date WithFormat:(NSString *)format;

//4
-(NSInteger)weekWithDay:(NSDate *)date;

//-36
-(NSInteger)durationFrom:(NSDate *)fromDate to:(NSDate *)toDate withUnit:(dateUnit )dateUnit;

-(NSDate *)dateFromDate:(NSDate *)date after:(NSInteger)afternumber unit:(dateUnit)unit;

@end
