//
//  XMGMessageCell.h
//  07-聊天布局
//
//  Created by xiaomage on 15/6/5.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Message;

@interface MessageCell : UITableViewCell
@property (nonatomic, strong) Message *message;
@end
