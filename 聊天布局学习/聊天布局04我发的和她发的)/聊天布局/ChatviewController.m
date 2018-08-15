//
//  ChatviewController.m
//  聊天布局
//
//  Created by 冷武橘 on 2017/8/17.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "ChatviewController.h"
#import "Message.h"
#import "Masonry.h"
#import "MeCell.h"
#import "otherCell.h"
@interface ChatviewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *messages;
@property(nonatomic,strong)UITableView *tableview;
@end

@implementation ChatviewController
- (NSArray *)messages
{
    if (_messages == nil) {
        // 加载plist中的字典数组
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        // 字典数组 -> 模型数组
        _messages = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
         Message *message = [Message messageWithDict:dict];
            [_messages addObject:message];
            if (_messages.count==8) {
                return _messages;
            }
        }
        
        }
    return _messages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableview=[[UITableView alloc]init];
        tableview.frame=CGRectMake(0, 0, 375, self.view.frame.size.height-40);
    tableview.delegate=self;
    tableview.dataSource=self;
    //tableview.rowHeight=UITableViewRowAnimationAutomatic;
    //tableview.estimatedRowHeight=200;
    [self.view addSubview:tableview];
    self.tableview=tableview;

}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取出模型
    Message *msg = self.messages[indexPath.row];
    
    // 重用标识（决定了cell的类型）
  
        if (msg.type == MessageTypeMe) {
            static NSString *ID = @"me";
            // 加载cell
            MeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell=[[MeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];//创建一个cell，设置其样式以及其标识
                
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
            }
            cell.message = msg;
    
            return cell;
        } else {
            static NSString *ID = @"other";
            // 加载cell
            otherCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
            if (cell==nil) {
                cell=[[otherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];//创建一个cell，设置其样式以及其标识
                
                cell.selectionStyle=UITableViewCellSelectionStyleNone;
            }
            cell.message = msg;
            
            return cell;
        }

}

//设置预估高度，提升tableview返回高度性能
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取出模型
    Message *msg = self.messages[indexPath.row];
    
    return msg.cellHeight;
}



@end
