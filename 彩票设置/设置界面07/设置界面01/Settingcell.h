//
//  Settingcell.h
//  设置界面01
//
//  Created by 冷武橘 on 2017/8/4.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Settingitem;
@interface Settingcell : UITableViewCell
@property(nonatomic,strong)Settingitem *settingitem;
+(instancetype)cellWithTableview:(UITableView *)tableview;
@end
