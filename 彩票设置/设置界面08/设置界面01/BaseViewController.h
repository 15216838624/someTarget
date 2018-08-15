//
//  BaseViewController.h
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/7.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingGroup.h"
#import "Settingitem.h"
#import "SettingArrowitem.h"
#import "SettingSwitchitem.h"
#import "Settingcell.h"
@interface BaseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>


/** 数组总数 */
@property (nonatomic, strong) NSMutableArray *groups;
@end
