//
//  SettingController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "SettingController.h"

#import "UsecodeController.h"
@interface SettingController ()
@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title=@"设置";
    [self setupGrup0];
    [self setupGrup1];
    [self setupGrup2];
}
// 第0组
- (void)setupGrup0{
  NSMutableArray *array0 = [NSMutableArray array];
   Settingitem *item0 = [SettingArrowitem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    [array0 addObject:item0];
    __weak SettingController *weakself=self;
    item0.operation = ^(NSIndexPath *indexpath){
        
        UsecodeController *codevc=[[UsecodeController alloc]init];
        [weakself.navigationController pushViewController:codevc animated:YES];
        NSLog(@"使用税换码");
    };
    //创建组模型
    SettingGroup *group0=[SettingGroup gruopWithItems:array0];
    
     //将组模型添加到数组总数
    [self.groups addObject:group0];
}

// 第1组
- (void)setupGrup1{
     NSMutableArray *array1= [NSMutableArray array];
    Settingitem *item1 = [SettingArrowitem  itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    item1.operation = ^(NSIndexPath *indexpath){
        NSLog(@"使用税换码");
    };

    [array1 addObject:item1];
    
    Settingitem *item2 = [SettingSwitchitem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    [array1 addObject:item2];
    
    SettingSwitchitem *item3 = [SettingSwitchitem itemWithIcon:[UIImage imageNamed:@"handShake"] title:@"使用摇一摇机选"];
    item3.on=YES;
    [array1 addObject:item3];
    
    Settingitem *item4 = [SettingSwitchitem itemWithIcon:[UIImage imageNamed:@"sound_Effec"] title:@"声音效果"];
 
    [array1 addObject:item4];
    

     //创建组模型
    SettingGroup *group1=[SettingGroup gruopWithItems:array1];
    
    
    // 将组模型添加到数组总数
    [self.groups addObject:group1];
    
    
}

// 第2组
- (void)setupGrup2{
    
    NSMutableArray *array2= [NSMutableArray array];
    
    Settingitem *item5 = [SettingArrowitem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"检查新版本"];
   
    item5.operation = ^(NSIndexPath *indexpath){

    };

    [array2 addObject:item5];
    
    Settingitem *item6 = [Settingitem itemWithIcon:[UIImage imageNamed:@"MoreShare"] title:@"分享"];

    [array2 addObject:item6];
    
    
    Settingitem *item7 = [SettingArrowitem itemWithIcon:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    item7.operation = ^(NSIndexPath *indexpath){
        NSLog(@"产品推荐");
    };

    [array2 addObject:item7];
    Settingitem *item8 = [SettingArrowitem itemWithIcon:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    item8.operation = ^(NSIndexPath *indexpath){
       
    };
    [array2 addObject:item8];
    
     //创建组模型
    SettingGroup *group2=[SettingGroup gruopWithItems:array2];
    
    // 将组模型添加到数组总数
    [self.groups addObject:group2];

}
- (void)dealloc{
    NSLog(@"控制器销毁了");
}

@end
