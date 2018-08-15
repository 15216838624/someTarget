//
//  XMGMessageCell.m
//  07-聊天布局
//
//  Created by xiaomage on 15/6/5.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "MessageCell.h"
#import "Message.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface MessageCell()
@property (nonatomic,strong)  UILabel *timeLabel;
@property (nonatomic,strong)  UIButton *textButton;
@property (nonatomic,strong)  UIImageView *iconView;
@end

@implementation MessageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
       
            
            _timeLabel=[[UILabel alloc]init];
            _timeLabel.backgroundColor=[UIColor redColor];
            [self.contentView addSubview:_timeLabel];
            [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@150);
                make.centerX.equalTo(self);
                make.top.equalTo(self).offset(5);
            }];
            _iconView=[[UIImageView alloc]init];
            _iconView.backgroundColor=[UIColor yellowColor];
            [self.contentView addSubview:_iconView];
        
        _textButton=[UIButton  buttonWithType: UIButtonTypeCustom];
        _textButton.titleLabel.backgroundColor=[UIColor grayColor];
        _textButton.titleLabel.numberOfLines=0;
        _textButton.contentMode=UIViewContentModeScaleToFill;
        _textButton.backgroundColor=[UIColor greenColor];
        [_textButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:_textButton];

        
        if ([reuseIdentifier isEqualToString:@"me"]) {
            [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(10);
                make.width.height.equalTo(@50);
                make.top.equalTo(self).offset(10);
            }];
            _iconView.image=[UIImage imageNamed:@"other"];
            
            [_textButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_iconView.mas_right).offset(10);
                make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
                make.width.lessThanOrEqualTo(@250);
                make.width.mas_greaterThanOrEqualTo(@60);
            }];
    
            
        }else{

            [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-10);
                make.width.height.equalTo(@50);
                make.top.equalTo(self).offset(10);
                
            }];
            _iconView.image=[UIImage imageNamed:@"other"];
            [_textButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(_iconView.mas_left).offset(-10);
                make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
                make.width.lessThanOrEqualTo(@250);
                make.width.mas_greaterThanOrEqualTo(@60);
            }];
            

        }
        
    }
        
        
        
        
     

    
    return  self;
}


- (void)setMessage:(Message *)message
{
    _message = message;
    
//     //时间处理
//    if (message.hideTime) { // 隐藏时间
//        self.timeLabel.hidden = YES;
//        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(0);
//        }];
//    } else { // 显示时间
        self.timeLabel.text = message.time;
//        self.timeLabel.hidden = NO;
//        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
//            make.height.equalTo(21);
//        }];
//    }
//    _timeLabel.text=@"11";
//    
//     //处理显示的消息文字
//     //设置按钮的文字
    [self.textButton setTitle:self.message.text forState:UIControlStateNormal];
    
    
//

//
//    // 设置按钮的高度就是titleLabel的高度

//
    // 强制更新
    [self.textButton layoutIfNeeded];
    CGFloat buttonH = self.textButton.titleLabel.frame.size.height + 30;
    NSLog(@"%f",buttonH);
    [self.textButton updateConstraints:^(MASConstraintMaker *make) {
   
        make.height.equalTo(buttonH);
    }]    ;
    
    [self layoutIfNeeded];

    NSLog(@"%f",self.textButton.frame.origin.y);
    
    // 计算当前cell的高度
    CGFloat buttonMaxY = CGRectGetMaxY(self.textButton.frame);
    CGFloat iconMaxY = CGRectGetMaxY(self.iconView.frame);
    self.message.cellHeight = MAX(buttonMaxY, iconMaxY) + 10;
     NSLog(@"按钮高度：%f cell高度:%f buttonMaxY=%f iconMaxY=%f",buttonH,self.message.cellHeight, buttonMaxY,iconMaxY);
}
@end
