//
//  Settingitem.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "Settingitem.h"

@implementation Settingitem

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title{
    Settingitem *item = [[self alloc] init];
    
    item.icon = icon;
    
    item.title = title;
    
    return item;
}
@end
