//
//  FriendCirclecell.h
//  111
//
//  Created by 冷武橘 on 2017/6/5.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendCirclecell : UITableViewCell
@property(nonatomic,strong)UIImageView *lefticonview;
@property(nonatomic,strong)UILabel *rightnameview;;
+(instancetype)cellwithtableview:(UITableView *)tableview;
@end
