//
//  UsecodeController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/7.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "UsecodeController.h"
#import "ZhongjiangController.h"
@interface UsecodeController ()
@end

@implementation UsecodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"使用兑换码";

    [self setupGrup0];

}
// 第1组
- (void)setupGrup0{
    NSMutableArray *array1= [NSMutableArray array];
    Settingitem *item1 = [SettingArrowitem  itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"购彩定时提醒"];
    __weak typeof(self)weakself=self;
    item1.operation = ^(NSIndexPath *indexpath){
        ZhongjiangController *zhvc=[[ZhongjiangController alloc]init];
        [weakself.navigationController pushViewController:zhvc animated:YES];
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
