//
//  SettingController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "SettingController.h"

@interface SettingController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.title=@"设置";
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds style: UITableViewStyleGrouped];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        // 第一组
        return 1;
    }else{
        return 4;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 搭建界面
    if (indexPath.section == 0) {
        // 第0组
        if (indexPath.row == 0) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"使用兑换码";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;        }
    }else if (indexPath.section == 1){
        // 第1组
        if (indexPath.row == 0) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"MorePush"];
            cell.textLabel.text = @"推送和提醒";
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }else if (indexPath.row == 1) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"handShake"];
            cell.textLabel.text = @"使用摇一摇机选";
            UISwitch *myswitch=[[UISwitch alloc]init];
            myswitch.on=YES;
            [cell addSubview:myswitch];
            cell.accessoryView=myswitch;
            
        }else if (indexPath.row == 2) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"sound_Effec"];
            cell.textLabel.text = @"声音效果";
            UISwitch *myswitch=[[UISwitch alloc]init];
            [cell addSubview:myswitch];
            cell.accessoryView=myswitch;
        }else if (indexPath.row == 3) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"More_LotteryRecommend"];
            cell.textLabel.text = @"购票小助手";
            UISwitch *myswitch=[[UISwitch alloc]init];
            [cell addSubview:myswitch];
            cell.accessoryView=myswitch;
        }
    }else if (indexPath.section == 2){
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        // 第二组
        if (indexPath.row == 0) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"RedeemCode"];
            cell.textLabel.text = @"检查新版本";
        }else if (indexPath.row == 1) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"MoreShare"];
            cell.textLabel.text = @"分享";
        }else if (indexPath.row == 2) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"MoreNetease"];
            cell.textLabel.text = @"产品推荐";
        }else if (indexPath.row == 3) {
            // 第一行
            cell.imageView.image = [UIImage imageNamed:@"MoreAbout"];
            cell.textLabel.text = @"关于";
        }
    }
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
