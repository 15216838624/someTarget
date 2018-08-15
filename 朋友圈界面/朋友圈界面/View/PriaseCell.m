//
//  PriaseCell.m
//  EHR
//
//  Created by 冷武橘 on 2017/6/6.
//  Copyright © 2017年 v2. All rights reserved.
//

#import "PriaseCell.h"
#import "Priasemodle.h"
#import "Commentmodle.h"
#import "Masonry.h"
@interface PriaseCell()
@property(nonatomic,strong)UIImageView *iconview;
@property(nonatomic,strong)UILabel *nameview;
@property(nonatomic,strong)UILabel *sayview;
@property(nonatomic,strong)UILabel *timeview;
@property(nonatomic,strong)UILabel * commentpriase;
@end
@implementation PriaseCell

+(instancetype)cellwithtableview:(UITableView *)tableview{
    static NSString * chongzu =@"Cell";//重用机制标识
   PriaseCell * cell =[tableview dequeueReusableCellWithIdentifier:chongzu];//根据重用标r识，到重用池找对应的cell
    if (cell==nil) {
        cell=[[PriaseCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:chongzu];//创建一个cell，设置其样式以及其标识
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
    
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _iconview=[[UIImageView alloc]init];
        [self addSubview:_iconview];
        _iconview.backgroundColor=[UIColor grayColor];
        [_iconview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.width.height.equalTo(@40);
            make.centerY.equalTo(self.mas_centerY);
        }];
        _nameview=[[UILabel alloc]init];
        [self addSubview:_nameview];
        [self.nameview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(80);
            make.top.equalTo(self);
            make.width.equalTo(@150);
        }];
        UILabel*lable=[[UILabel alloc]init];
         lable.text=@"赞了这条状态";
        [self addSubview:lable];
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameview).offset(0);
            make.top.equalTo(self.nameview.mas_bottom).offset(0);
            make.width.equalTo(@150);
        }];
        self.commentpriase=lable;
        _sayview=[[UILabel alloc]init];
        _sayview.font=[UIFont systemFontOfSize:14];

        [self addSubview:_sayview];
        [_sayview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(80);
            make.top.equalTo(lable.mas_bottom).offset(5);
            make.right.equalTo(self).offset(40);
        }];
        _timeview=[[UILabel alloc]init];
         _timeview.font=[UIFont systemFontOfSize:14];
        //        _sayview.numberOfLines=0;
//       _timeview.backgroundColor=[UIColor redColor];
        [self addSubview: _timeview];
        [_timeview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(80);
            make.top.equalTo(_sayview.mas_bottom).offset(5);
            make.right.equalTo(self).offset(40);
        }];
        
    }
    
    
    return  self;
}
- (void)setPraise:(Priasemodle *)praise{
    _nameview.text=praise.name;
    _sayview.text=praise.saycont;
    _timeview.text=praise.saytime;
}
- (void)setComment:(Commentmodle *)comment{
    _nameview.text=comment.name;
    _sayview.text=comment.sayconts;
    _commentpriase.text=comment.commentconts;
    _timeview.text=comment.saytime;
}

@end
