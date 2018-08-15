//
//  NSDate+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    // 获得某个时间的年月日时分秒
    NSDateComponents *dateCmps = [calendar components:NSCalendarUnitYear fromDate:self];
    NSDateComponents *nowCmps = [calendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateCmps.year == nowCmps.year;
}

/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday
{
    NSDate *now = [NSDate date];
    
    // date ==  2014-04-30 10:05:28 --> 2014-04-30 00:00:00
    // now == 2014-05-01 09:22:10 --> 2014-05-01 00:00:00
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    // 2014-04-30
    NSString *dateStr = [fmt stringFromDate:self];
    // 2014-10-18
    NSString *nowStr = [fmt stringFromDate:now];
    
    // 2014-10-30 00:00:00
    NSDate *date = [fmt dateFromString:dateStr];
    // 2014-10-18 00:00:00
    now = [fmt dateFromString:nowStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:date toDate:now options:0];
    
    return cmps.year == 0 && cmps.month == 0 && cmps.day == 1;
}

/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday
{
    NSDate *now = [NSDate date];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:self];
    NSString *nowStr = [fmt stringFromDate:now];
    
    return [dateStr isEqualToString:nowStr];
}


/**
 转换时间格式
 
 @param fromstring  需要转换的日期：@"20121105"
 @param fromFor 转换日期的字符串格式：@"yyyyMMdd" //必须和上面一一对应  201212 ：@"yyyyMM"
 @param toFor 需要转换成的日期格式
 
 @return 得到所需的日期字符串
 
 */
-(NSString *)fromdateString:(NSString *)fromstring fromFor :(NSString *)fromFor toFor:(NSString *)toFor{
    //日期格式转换
    NSDateFormatter *fromFormatter=[[NSDateFormatter alloc]init];
    fromFormatter.dateFormat=fromFor;
    NSDate *fromdate=[fromFormatter dateFromString:fromstring];
    if (!fromdate) {
        fromFormatter.timeZone =[NSTimeZone timeZoneForSecondsFromGMT:3600*8];
        fromdate=[fromFormatter dateFromString:fromstring];
    }
    
    
    NSDateFormatter *toDataFormatter=[[NSDateFormatter alloc]init];
    toDataFormatter.dateFormat=toFor;
    NSString *datestring = [toDataFormatter stringFromDate:fromdate];
    
    return  datestring;
}

//时间戳是指格林威治时间1970年01月01日00时00分00秒(北京时间1970年01月01日08时00分00秒)起至现在的总秒数。

//时间戳字符串转换成日期对象
- (NSDate *)datefromStringtime:(NSString *)stringtime{
    
    NSTimeInterval second = [stringtime longLongValue]/1000.0;
    // 时间戳 -> NSDate *
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:second];
    
    return date;
    
}








@end
