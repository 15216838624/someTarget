//
//  Settingitem.h
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Settingitem : NSObject
/** 图片 */
@property (nonatomic, strong) UIImage *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** 点击这一行要做的事情 */
@property (nonatomic, copy) void(^operation)(NSIndexPath *indexPath);
+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;
@end
