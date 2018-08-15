//
//  FriendsCenterController.h
//  朋友圈
//
//  Created by 冷武橘 on 2017/5/27.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+XLExtension.h"
#import "XLPhotoBrowser.h"
@interface FriendsCenterController : UIViewController <XLPhotoBrowserDelegate, XLPhotoBrowserDatasource>

    @property (nonatomic , strong) UIScrollView  *scrollView;
    /**
     * 图片数组
     */
    @property (nonatomic , strong) NSMutableArray  *images;
    /**
     *  url strings
     */
    @property (nonatomic , strong) NSArray  *urlStrings;
    
    /**
     *  浏览图片
     */
- (void)clickImage:(UITapGestureRecognizer *)tap;
- (void)resetScrollView;
@end
