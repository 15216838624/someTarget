//
//  ZhongjiangController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/7.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "ZhongjiangController.h"

@interface ZhongjiangController ()


@end

@implementation ZhongjiangController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"中奖动画";

    [self setupGrup0];
    [self setupGrup1];

}
// 第1组
- (void)setupGrup0{
    NSMutableArray *array1= [NSMutableArray array];
   SettingSwitchitem  *item1 = [SettingSwitchitem  itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"购彩定时提醒"];
    item1.on=YES;

    item1.operation = ^(NSIndexPath *indexpath){

    };
    
    [array1 addObject:item1];
    
   SettingSwitchitem  *item2 = [SettingSwitchitem  itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"开奖号码推送"];
    item2.on=YES;
    [array1 addObject:item2];

    //创建组模型
    SettingGroup *group1=[SettingGroup gruopWithItems:array1];
    
    // 将组模型添加到数组总数
    [self.groups addObject:group1];

    
}
// 第1组
- (void)setupGrup1{
    NSMutableArray *array1= [NSMutableArray array];
    Settingitem *item1 = [SettingArrowitem  itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"购彩定时提醒"];
    item1.operation = ^(NSIndexPath *indexpath){
        NSLog(@"使用税换码");
    };
    
    [array1 addObject:item1];
    
    Settingitem *item2 = [SettingArrowitem  itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"开奖号码推送"];
    [array1 addObject:item2];
    
    Settingitem *item3 = [SettingArrowitem  itemWithIcon:[UIImage imageNamed:@"handShake"] title:@"中奖动画"];
    
    [array1 addObject:item3];
    
    
    //创建组模型
    SettingGroup *group1=[SettingGroup gruopWithItems:array1];
    
    
    // 将组模型添加到数组总数
    [self.groups addObject:group1];
    
    
}

@end
