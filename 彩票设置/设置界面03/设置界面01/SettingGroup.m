//
//  SettingGroup.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "SettingGroup.h"

@implementation SettingGroup

+ (instancetype)gruopWithItems:(NSArray *)items{
   SettingGroup *gruop = [[self alloc] init];
    gruop.items = items;
    return gruop;
}
@end
