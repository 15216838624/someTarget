//
//  YZEmotionKeyboard.h
//  YZEmotionKeyboardDemo
//
//  Created by yz on 16/8/6.
//  Copyright © 2016年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZTextAttachment.h"
@protocol GetemotionDelegate<NSObject>
- (void)getmotion:(YZTextAttachment *)attachment;
@end

@interface YZEmotionKeyboard : UIView

/**
 *  作为谁的textView的输入键盘
 */
@property (nonatomic, weak) UIView *textView;

/**
 *  点击发送，会自动把文本框的内容传递过来
 */
@property (nonatomic, strong) void(^sendContent)(NSString *content);
@property(nonatomic,strong)id<GetemotionDelegate>delegate;
/**
 *  快速加载键盘控件
 *
 */
+ (instancetype)emotionKeyboard;

@end
