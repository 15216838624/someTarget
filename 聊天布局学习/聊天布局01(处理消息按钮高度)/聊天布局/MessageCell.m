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
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self).offset(10);
    make.width.height.equalTo(@50);
    make.top.equalTo(self).offset(10);
    }];
        
    _textButton=[[UIButton  alloc]init];
    //按钮文字换行
    _textButton.titleLabel.numberOfLines=0;
    _textButton.backgroundColor=[UIColor greenColor];
    _textButton.titleLabel.backgroundColor=[UIColor grayColor];
    [_textButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    //苹果官方建议添加到self.contiview，而不是直接添加到self上
    [self.contentView addSubview:_textButton];
        
        
    //设置按钮的约束，高度不设置
    [_textButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(_iconView.mas_right).offset(10);
    make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
    make.width.lessThanOrEqualTo(@250);
    make.width.mas_greaterThanOrEqualTo(@60);
    }];
 
    }
        


    return  self;
}


- (void)setMessage:(Message *)message
{
    _message = message;
    

    self.timeLabel.text = message.time;

    [self.textButton setTitle:self.message.text forState:UIControlStateNormal];
    //设置文字后，立即强制更新下,拿到文字的高度
    [self.textButton layoutIfNeeded];
 
    CGFloat buttonH = self.textButton.titleLabel.frame.size.height + 30;
    //更新按钮的高度，使按钮的高度由文字决定
    [self.textButton updateConstraints:^(MASConstraintMaker *make) {
   
        make.height.equalTo(buttonH);
    }]    ;
    




}
@end
