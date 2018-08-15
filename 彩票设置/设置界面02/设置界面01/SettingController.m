//
//  SettingController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "SettingController.h"
#import "Settingitem.h"
@interface SettingController ()<UITableViewDelegate,UITableViewDataSource>

/** 数组总数 */
@property (nonatomic, strong) NSMutableArray *groups;
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
    _groups = [NSMutableArray array];
    [self setupGrup0];
    [self setupGrup1];
    [self setupGrup2];
}
// 第0组
- (void)setupGrup0{
  NSMutableArray *array0 = [NSMutableArray array];
   Settingitem *item0 = [Settingitem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    [array0 addObject:item0];
    
    // 第0个模型数组添加到数组总数
    [self.groups addObject:array0];
}

// 第1组
- (void)setupGrup1{
     NSMutableArray *array1= [NSMutableArray array];
    Settingitem *item1 = [Settingitem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"使用税换码"];
    [array1 addObject:item1];
    
    Settingitem *item2 = [Settingitem itemWithIcon:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    [array1 addObject:item2];
    
    
    Settingitem *item3 = [Settingitem itemWithIcon:[UIImage imageNamed:@"handShake"] title:@"使用摇一摇机选"];
    [array1 addObject:item3];
    
    
    Settingitem *item4 = [Settingitem itemWithIcon:[UIImage imageNamed:@"sound_Effec"] title:@"声音效果"];
    [array1 addObject:item4];
    
    
    // 第1个模型数组添加到数组总数
    [self.groups addObject:array1];
    
    
}

// 第1组
- (void)setupGrup2{
    NSMutableArray *array2= [NSMutableArray array];
    
    Settingitem *item5 = [Settingitem itemWithIcon:[UIImage imageNamed:@"RedeemCode"] title:@"检查新版本"];
    [array2 addObject:item5];
    
    Settingitem *item6 = [Settingitem itemWithIcon:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    [array2 addObject:item6];
    
    
    Settingitem *item7 = [Settingitem itemWithIcon:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    [array2 addObject:item7];
    
    Settingitem *item8 = [Settingitem itemWithIcon:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    [array2 addObject:item8];
    
    
    // 第2个模型数组添加到数组总数
    [self.groups addObject:array2];
    
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.groups[section];
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 0.取出行模型数组
    NSArray *arr = self.groups[indexPath.section];
    // 1.取出行模型
    Settingitem *item =  arr[indexPath.row];
    // 2.设置数据
    cell.imageView.image = item.icon;
    cell.textLabel.text = item.title;
    
    
    
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
