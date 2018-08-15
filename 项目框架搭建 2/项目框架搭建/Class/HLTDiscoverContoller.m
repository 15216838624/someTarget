//
//  HLTDiscoverContoller.m
//  从零开始
//
//  Created by 冷武橘 on 16/12/8.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "HLTDiscoverContoller.h"

@interface HLTDiscoverContoller()<UITableViewDelegate,UITableViewDataSource>{
    UITableView * tableview;
}
@end
@implementation HLTDiscoverContoller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableview =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];//创建列表的方法
//分割线全屏处理1.1
    //设置separatorInset(iOS7之后)
    if ([tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableview setSeparatorInset:UIEdgeInsetsZero];
    }
    //设置layoutMargins(iOS8之后)
    if ([tableview respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableview setLayoutMargins:UIEdgeInsetsZero];
    }
    

    tableview.dataSource=self;
    tableview.delegate=self;
    ////
    [self.view addSubview:tableview];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;//设置列表组数，即区域：返回为3组
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{//设置每组里有多少行

    return 4;//设置每组的行数
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{//indexPath包含了第几组：indexPath.section 和第几行:indexPath.row
    static NSString * chongzu =@"Cell";//重用机制标识
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:chongzu];//根据重用标识，到重用池找对应的cell
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:chongzu];//创建一个cell，设置其样式以及其标识
    }
    cell.textLabel.text=[NSString stringWithFormat:@"第%zi行,第%zi组",indexPath.row,indexPath.section];//设置cell的文本信息"
    return cell;//将设置好的cell返回
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [ tableview reloadData];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    
    
}

////分割线全屏处理1.2
- (void)tableView:(UITableView *)tableView willDisplayCell:(nonnull UITableViewCell *)cell forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    //设置separatorInset(iOS7之后)
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    //设置layoutMargins(iOS8之后)
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}








// 当cell将要显示的时候调用
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 当cell将要显示的时候做动画从右向左的动画
//    
//    // 1.将cell平移到屏幕外
//    cell.transform = CGAffineTransformMakeTranslation(375, 0);
//    
//    
//    // 2.让cell复位
//    [UIView animateWithDuration:0.5 animations:^{
//        cell.transform = CGAffineTransformIdentity;
//    }];
//}




@end
