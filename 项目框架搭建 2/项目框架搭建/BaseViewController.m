//
//  BaseViewController.m
//  SFMVC
//
//  Created by zsf on 16/9/30.
//  Copyright © 2016年 zsf. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
}

//初始化
- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.extendedLayoutIncludesOpaqueBars=YES; //translucent=NO 时才有效
}


//找查到Nav底部的黑线
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}
@end
