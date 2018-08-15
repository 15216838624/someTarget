//
//  MessageCell.h
//  朋友圈
//
//  Created by 冷武橘 on 2017/6/1.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Messagecenter.h"
#import "YYText.h"
@interface MessageCell : UITableViewCell
@property(nonatomic,strong)YYLabel *message;
@property(nonatomic,strong)Messagecenter *messagecenter;
@end
