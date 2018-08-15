//
//  BaseViewController.m
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/7.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
#pragma mark - 懒加载
- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds style: UITableViewStyleGrouped];
    tableview.delegate=self;
    tableview.dataSource=self;
    [self.view addSubview:tableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


@end
