//
//  Messagecenter.m
//  朋友圈
//
//  Created by 冷武橘 on 2017/5/31.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "Messagecenter.h"
#import "YYText.h"
@implementation Messagecenter
- (CGFloat)cellheight{
    
    // 如果已经计算过，就直接返回
    if (_cellheight) return _cellheight;
    
    // 文字的最大尺寸
    CGSize maxSize = CGSizeMake(315, MAXFLOAT);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize  text:self.messagetext];
    CGFloat textH = layout.textBoundingSize.height;

    //cell的高度
    _cellheight=textH;
    return _cellheight;
    
    
}



@end
