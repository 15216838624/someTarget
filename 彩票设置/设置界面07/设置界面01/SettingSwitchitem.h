//
//  SettingSwitchArrowitem.h
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "Settingitem.h"

@interface SettingSwitchitem : Settingitem
/** 开关状态 */
@property (nonatomic, assign, getter=isOn) BOOL on;
@end
