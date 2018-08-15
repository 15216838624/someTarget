//
//  FriendsCircleController.m
//  111
//
//  Created by 冷武橘 on 2017/6/5.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "FriendsCircleController.h"
#import "FriendCirclecell.h"
#import "FriendsCenterController.h"
#import "PraiseController.h"
#import "CommentController.h"
@interface FriendsCircleController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *array1;
@property(nonatomic,strong)NSArray *array2;
@end

@implementation FriendsCircleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"圈子";
    _tableview=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _tableview.sectionHeaderHeight=5;
    _tableview.sectionFooterHeight=0;
    _tableview.contentInset=UIEdgeInsetsMake(-30, 0, 0, 0);
    [self.view addSubview:_tableview];
    self.array2=@[@"同事圈",@"收到的赞",@"评论我的"];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{//设置每组里有多少行
    if (section==0) {
        return 1;
    }
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FriendCirclecell *cell=[FriendCirclecell cellwithtableview:tableView];
    cell.rightnameview.text = indexPath.section==0?self.array2[0]:self.array2[indexPath.row+1];
    
    return cell;//将设置好的cell返回
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section==0){
        FriendsCenterController *centerController=[[FriendsCenterController alloc]init];
        centerController.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:centerController animated:YES];
    }else if (indexPath.section==1&&indexPath.row==0) {
        PraiseController *praiseController=[[PraiseController  alloc]init];
        praiseController.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:praiseController animated:YES];
    }else if (indexPath.section==1&&indexPath.row==1){
        CommentController *commentvc=[[CommentController alloc]init];
         commentvc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:commentvc animated:YES];
    }
    
}


@end
