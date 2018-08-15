//
//  Settingitem.h
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    SettingsItemRightViewStateNone,  // 没有辅助视图
    SettingsItemRightViewStateArrow,  // 辅助视图为一个小箭头
    SettingsItemRightViewStateSwitch,  // 辅助视图为一个switch开关
} SettingsItemRightViewState;  // 用于标识accessoryView中不同的辅助视图

@interface Settingitem : NSObject
/** 图片 */
@property (nonatomic, strong) UIImage *icon;

/** 标题 */
@property (nonatomic, copy) NSString *title;

/** cell右边的赋值视图控件 */
@property (assign, nonatomic) SettingsItemRightViewState type;

@property(assign,nonatomic,getter=Ison)BOOL on;
+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title;
@end
