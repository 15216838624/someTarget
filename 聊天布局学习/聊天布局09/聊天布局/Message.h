//
//  XMGMessage.h
//  07-聊天布局
//
//  Created by xiaomage on 15/6/5.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
     MessageTypeMe = 0,
     MessageTypeOther = 1
}    MessageType;

@interface Message : NSObject
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign) MessageType type;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;
/** 是否隐藏时间 */
@property (nonatomic, assign, getter=isHideTime) BOOL hideTime;

+ (instancetype)messageWithDict:(NSDictionary *)dict;
@end
