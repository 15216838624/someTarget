//
//  UsecodeController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/7.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "UsecodeController.h"
#import "Settingitem.h"
#import "SettingGroup.h"
#import "SettingArrowitem.h"
#import "Settingcell.h"
#import "ZhongjiangController.h"
@interface UsecodeController ()<UITableViewDelegate,UITableViewDataSource>

/** 数组总数 */
@property (nonatomic, strong) NSMutableArray *groups;

@end

@implementation UsecodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"使用兑换码";
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds style: UITableViewStyleGrouped];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
    _groups = [NSMutableArray array];
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
