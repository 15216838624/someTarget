//
//  UITextView+YZEmotion.h
//  Emoji
//
//  Created by yz on 16/8/6.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZEmotionKeyboard.h"
#import "YYTextView.h"
@interface YYTextView(YZEmotion)
@property (nonatomic, weak) YZEmotionKeyboard *yz_emotionKeyboard;

@end
