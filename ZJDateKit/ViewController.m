//
//  ViewController.m
//  ZJDateKit
//
//  Created by NeroJ on 2017/5/26.
//  Copyright © 2017年 nero. All rights reserved.
//

#import "ViewController.h"
#import "ZJDateManager.h"
#define log(str) NSLog(@"%@",str)
#define logInteger(str) NSLog(@"%li",str)

@interface ViewController (){
    ZJDateManager *manager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    manager = [ZJDateManager shareinstance];
    NSDate *today = [manager today];
    log(today);
    NSDate *yesterday = [manager yesterday];
    log(yesterday);
    NSDate *tomorrow = [manager tomorrow];
    log(tomorrow);
    NSInteger dayNumber = [manager dayNumberOfCurrentMonth];
    logInteger(dayNumber);
    NSDate *futureDay = [NSDate dateWithTimeIntervalSinceNow:24*60*60*4];
    NSLog(@"%@",futureDay);
    NSDateComponents *comp = [manager getDateInfoWithDate:today];
    NSLog(@"%@",comp);
    NSDate *date1 = [manager dateFromString:@"2017-06-12 20:21:10"];
    log(date1);
    NSDate *date2 = [manager dateFromString:@"2017年07月20日" WithFormat:@"yyyy年MM月dd日"];
    log(date2);
    NSString *yesStr = [manager stringFromDate:yesterday];
    log(yesStr);
    NSString *dayStr = [manager stringFromDate:date2 WithFormat:@"yyyy年MM月dd日"];
    log(dayStr);
    NSInteger week = [manager weekWithDay:today];
    logInteger(week);
    NSInteger duration = [manager durationDayFrom:today to:date1];
    logInteger(duration);
    NSInteger duration2 = [manager durationHourFrom:today to:date1];
    logInteger(duration2);
    NSInteger duration3 = [manager durationMinuteFrom:today to:date1];
    logInteger(duration3);
    NSDate *afterDay = [manager dateFromDate:today afterDay:2];
    log(afterDay);
    NSDate *afterDay2 = [manager dateFromDate:today withInterval:24*60*60];
    log(afterDay2);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
