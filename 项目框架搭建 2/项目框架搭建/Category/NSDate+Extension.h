//
//  NSDate+Extension.h
//  黑马微博2期
//
//  Created by apple on 14-10-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  判断某个时间是否为今年
 */
- (BOOL)isThisYear;
/**
 *  判断某个时间是否为昨天
 */
- (BOOL)isYesterday;
/**
 *  判断某个时间是否为今天
 */
- (BOOL)isToday;


/**
 转换时间格式
 
 @param fromstring  需要转换的日期：@"20121105"
 @param fromFor 转换日期的字符串格式：@"yyyyMMdd" //必须和上面一一对应  201212 ：@"yyyyMM"
 @param toFor 需要转换成的日期格式
 
 @return 得到所需的日期字符串
 
 */
-(NSString *)fromdateString:(NSString *)fromstring fromFor :(NSString *)fromFor toFor:(NSString *)toFor;
//eg:  NSString *str=[self fromdateString:@"20160504" fromFor:@"yyyyMMdd" toFor:@"MM-dd日yy年"];




@end
