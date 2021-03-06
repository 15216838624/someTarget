//
//  FriendCirclecell.m
//  111
//
//  Created by 冷武橘 on 2017/6/5.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "FriendCirclecell.h"
#import "Masonry.h"
@interface FriendCirclecell ()

@end

@implementation FriendCirclecell

+(instancetype)cellwithtableview:(UITableView *)tableview{
    static NSString * chongzu =@"Cell";//重用机制标识
  FriendCirclecell * cell =[tableview dequeueReusableCellWithIdentifier:chongzu];//根据重用标r识，到重用池找对应的cell
    if (cell==nil) {
        cell=[[FriendCirclecell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:chongzu];//创建一个cell，设置其样式以及其标识
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return cell;
    
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _lefticonview=[[UIImageView alloc]init];
        [self addSubview:_lefticonview];
        _lefticonview.backgroundColor=[UIColor grayColor];
        [_lefticonview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.width.height.equalTo(@40);
            make.centerY.equalTo(self.mas_centerY);
        }];
        _rightnameview=[[UILabel alloc]init];
        [self addSubview:_rightnameview];
        [self.rightnameview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(80);
            make.top.bottom.equalTo(self);
            make.width.equalTo(@150);
        }];
        
        
        
        
    }
    
    
    return  self;
}

@end
