//
//  HLTTableview.m
//  EHR
//
//  Created by 冷武橘 on 2017/6/8.
//  Copyright © 2017年 v2. All rights reserved.
//

#import "HLTTableview.h"
#pragma mark- 点击收回键盘
@implementation HLTTableview
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    id view = [super hitTest:point withEvent:event];
    if (![view isKindOfClass:[UITextView class]]) {
        [self.superview endEditing:YES];
        [self endEditing:YES];
    }
    return view;
}

@end
