//
//  HLTHallController.m
//  从零开始
//
//  Created by 冷武橘 on 16/12/8.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "HLTHallController.h"
#import "UIImage+Extension.h"
#import "NSDate+Extension.h"
@implementation HLTHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    // 在iOS7 之后导航条上图片,默认被渲染
    
    // 1.设置导航条左侧按钮
    //    UIImage *image =  [UIImage imageNamed:@"CS50_activity_image"];
    //   image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    UIImage imageWithRenderOriginalName:<#(NSString *)#>
    
    //    [UIImage imageWithRenderOriginalName:<#(NSString *)#>]
    
    //    [UIImage imageWithRenderOriginalName:]
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(leftButtonOnClick)];
    


    
    
    
    
}
- (void)leftButtonOnClick{
    NSLog(@"%s, line = %d", __FUNCTION__, __LINE__);
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    
}
@end
