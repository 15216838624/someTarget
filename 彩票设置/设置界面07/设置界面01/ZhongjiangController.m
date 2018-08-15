//
//  ZhongjiangController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/7.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "ZhongjiangController.h"
#import "SettingSwitchitem.h"
#import "SettingGroup.h"
#import "SettingArrowitem.h"
#import "Settingcell.h"
@interface ZhongjiangController ()<UITableViewDelegate,UITableViewDataSource>

/** 数组总数 */
@property (nonatomic, strong) NSMutableArray *groups;


@end

@implementation ZhongjiangController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"中奖动画";
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds style: UITableViewStyleGrouped];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    _groups = [NSMutableArray array];
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

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 0.取出组模型
    SettingGroup *group = self.groups[section];
    
    // 1.取出组模型的行模型数组
    NSArray*arr = group.items;
    
    // 2.返回对应的行数
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    Settingcell *cell = [Settingcell cellWithTableview:tableView];
    
    
    // 0.取出组模型
    SettingGroup *group = self.groups[indexPath.section];
    
    // 1.取出行模型
    Settingitem *item = group.items[indexPath.row];
    cell.settingitem=item;
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 0.取出组模型
    SettingGroup *group = self.groups[indexPath.section];
    
    // 1.取出行模型
    Settingitem *item = group.items[indexPath.row];
    
    if (item.operation) {
        item.operation(indexPath);
    }
}
- (void)dealloc{
    NSLog(@"控制器销毁了");
}



@end
