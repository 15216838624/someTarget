//
//  XMGMessage.m
//  07-聊天布局
//
//  Created by xiaomage on 15/6/5.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "Message.h"

@implementation Message

+ (instancetype)messageWithDict:(NSDictionary *)dict
{
    Message *message = [[self alloc] init];
    [message setValuesForKeysWithDictionary:dict];
    return message;
}
@end
