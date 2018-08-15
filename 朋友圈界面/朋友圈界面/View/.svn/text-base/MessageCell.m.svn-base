//
//  MessageCell.m
//  朋友圈
//
//  Created by 冷武橘 on 2017/6/1.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "MessageCell.h"
#import "Masonry.h"
#import "YYLabel.h"
@interface MessageCell()
@end
@implementation MessageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _message=[[YYLabel alloc]init];
        _message.numberOfLines=0;
        _message.preferredMaxLayoutWidth=315;
       
        _message.backgroundColor=[UIColor redColor];
        [self addSubview:_message];
        [_message mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.right.equalTo(self);
    
        }];
       
    }
    
    
    return  self;
}
- (void)setMessagecenter:(Messagecenter *)messagecenter{
   
    
    self.message.attributedText=messagecenter.messagetext;
}
@end
