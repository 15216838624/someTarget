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
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@627);
        make.left.right.equalTo(self.view);
        
    }];
    tableview.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
    tableview.delegate=self;
    tableview.dataSource=self;
    self.tableview=tableview;
    UIView *toolview=[[UIView alloc]init];
    [self.view addSubview:toolview];
    toolview.backgroundColor=[UIColor yellowColor];
    [toolview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.equalTo(@40);
        make.top.equalTo(tableview.mas_bottom);
    }];
    
    self.toolview=toolview;
    UITextField *texfiled=[[UITextField alloc]init];
    texfiled.backgroundColor=[UIColor whiteColor];
    [toolview addSubview:texfiled];
    [texfiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(toolview);
        make.bottom.top.equalTo(toolview);
        make.width.equalTo(@150);
    }];
    self.textfiled=texfiled;
    UIButton *btn=[[UIButton alloc]init];
    btn.backgroundColor=[UIColor redColor];
    [toolview addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(texfiled.mas_right);
        make.bottom.top.equalTo(toolview);
        make.width.equalTo(@40);
    }];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    

}


#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}
//#pragma mark - 键盘处理
//- (void)keyboardWillShow:(NSNotification *)note {
//    // 取出键盘最终的frame
//    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    // 取出键盘弹出需要花费的时间
//    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    // 修改约束
//    CGFloat bottomspace=rect.size.height;
//    [self.toolview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view).offset(-bottomspace);
//    }];
//    [UIView animateWithDuration:duration animations:^{
//        [self.view layoutIfNeeded];
//    }];
//}
//
//- (void)keyboardWillHide:(NSNotification *)note {
//    // 取出键盘弹出需要花费的时间
//    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    // 修改约束
//    [self.toolview mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.view).offset(0);
//    }];
//    [UIView animateWithDuration:duration animations:^{
//        [self.view layoutIfNeeded];
//    }];
//}

- (void)keyboardWillChangeFrame:(NSNotification *)note {
    // 取出键盘最终的frame
    CGRect rect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 取出键盘弹出需要花费的时间
    double duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGFloat bottomspace= [UIScreen mainScreen].bounds.size.height - rect.origin.y;
    [self.toolview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-bottomspace);
    }];
    // 修改transform
    [UIView animateWithDuration:duration animations:^{
        [self.view layoutIfNeeded];
        
    }];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
        cell.backgroundColor=[UIColor redColor];
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
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 退出键盘
    //    [self.messageField resignFirstResponder];
    //    [self.messageField endEditing:YES];
    [self.view endEditing:YES];
}




@end
