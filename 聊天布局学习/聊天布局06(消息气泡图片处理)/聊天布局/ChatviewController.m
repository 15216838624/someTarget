//
//  ChatviewController.m
//  聊天布局
//
//  Created by 冷武橘 on 2017/8/17.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "ChatviewController.h"
#import "Message.h"
#import "MessageCell.h"
#import "Masonry.h"
@interface ChatviewController ()
<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray *messages;
@property(nonatomic,strong)UIView *toolview;
@property(nonatomic,strong)UITextField *textfiled;
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
        // 用来记录上一条消息模型
        Message *lastMessage = nil;
        for (NSDictionary *dict in dictArray) {
            Message *message = [Message messageWithDict:dict];
            message.hideTime = [message.time isEqualToString:lastMessage.time];
            
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
        tableview.frame=CGRectMake(0, 0, 375, self.view.frame.size.height);
    tableview.contentInset=UIEdgeInsetsMake(0, 0, 40, 0);
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
    NSString *ID = (msg.type == MessageTypeMe) ? @"me" : @"other";
    
    
    // 加载cell
   MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[ MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];//创建一个cell，设置其样式以及其标识
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    NSLog(@"%ld",indexPath.row);
    cell.message = msg;

    return cell;
    

}

//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Message *message = self.messages[indexPath.row];


    
    
    return message.cellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 200;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    for (int i=0; i<self.messages.count; i++) {
//       
//            XMGMessage *message=self.messages[i];
//            NSLog(@"%f",message.cellHeight);
//        
//        
//        
//    }
//    NSLog(@"%@",self.messages);
}





@end
