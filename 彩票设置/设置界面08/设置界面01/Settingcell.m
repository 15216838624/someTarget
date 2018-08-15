//
//  Settingcell.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "Settingcell.h"
#import "Settingitem.h"
#import "SettingSwitchitem.h"
#import "SettingArrowitem.h"
@implementation Settingcell

+(instancetype)cellWithTableview:(UITableView *)tableview{
    static NSString *ID = @"cell";
    
    Settingcell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[Settingcell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
    
}

- (void)setSettingitem:(Settingitem *)settingitem{
    _settingitem=settingitem;
    // 2.设置数据
    self.imageView.image = settingitem.icon;
    self.textLabel.text = settingitem.title;
    
    if ([settingitem isKindOfClass:[SettingArrowitem class]]) {
        self.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    } else if ([settingitem isKindOfClass:[SettingSwitchitem class]]) {
        SettingSwitchitem *swItem = (SettingSwitchitem *)settingitem;        UISwitch *sw = [[UISwitch alloc] init];
        self.accessoryView = sw;
        
        // 让开关处于开启状态
        sw.on =swItem.isOn;
        
    } else {
        
        // 因为cell有循环利用机制，所以这里要做一个清空操作
        self.accessoryView = nil;
    }
    
    

    
}

@end
