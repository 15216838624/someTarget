//
//  SettingGroup.h
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingGroup : NSObject
/** 行模型数组 */
@property (nonatomic, strong) NSArray *items;
+ (instancetype)gruopWithItems:(NSArray *)items;
@end
