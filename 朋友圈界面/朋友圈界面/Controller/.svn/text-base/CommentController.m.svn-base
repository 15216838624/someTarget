//
//  CommentController.m
//  EHR
//
//  Created by 冷武橘 on 2017/6/6.
//  Copyright © 2017年 v2. All rights reserved.
//

#import "CommentController.h"
#import "Commentmodle.h"
#import "PriaseCell.h"
@interface CommentController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *DataArray;
@end

@implementation CommentController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.DataArray=[NSMutableArray array];
    self.navigationItem.title=@"评论我的";
    _tableview=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _tableview.rowHeight=100;
    [self.view addSubview:_tableview];
    _tableview.sectionHeaderHeight=10;
    _tableview.sectionFooterHeight=0;
    _tableview.contentInset=UIEdgeInsetsMake(-25, 0, 0, 0);
    Commentmodle *modle=[[Commentmodle alloc]init];
    modle.name=@"张三";
    modle.commentconts=@"这是你发的吗";
    modle.saytime=@"2017-02-10 9:00";
    modle.sayconts=@"浔阳江头夜送客，枫叶荻花秋瑟瑟。主人下马客在船，举酒欲饮无管弦。";
    [self.DataArray addObject:modle];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.DataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{//设置每组里有多少行
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    PriaseCell * cell =[PriaseCell cellwithtableview:tableView];
    cell.comment=self.DataArray[indexPath.section];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //    if(indexPath.section==0){
    //        FriendsCenterController *centerController=[[FriendsCenterController alloc]init];
    //        centerController.hidesBottomBarWhenPushed=YES;
    //        [self.navigationController pushViewController:centerController animated:YES];
    //    }
    
}



@end



