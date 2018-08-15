//
//  Messagecenter.h
//  朋友圈
//
//  Created by 冷武橘 on 2017/5/31.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Messagecenter : NSObject
@property(nonatomic,strong)NSAttributedString *messagetext;
@property(nonatomic,strong)NSString *messagename;
@property(nonatomic,assign)CGFloat cellheight;

@end
