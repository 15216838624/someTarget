//
//  HLTNagavationController.m
//  从零开始
//
//  Created by 冷武橘 on 16/12/8.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "HLTNagavationController.h"
#import "UIImage+Extension.h"
@implementation HLTNagavationController
// 什么时候调用 当程序一启动的时候就会调用,比main函数还提早调用
// 作用: 将当前类加载进内存, 放在代码区
+ (void)load{
   NSLog(@"%s",__func__);
}

// 什么时候调用 当第一次初始这个类的时候调用  如果当这个类有子类会调用多次
// 作用 初始化这个类

// 作用 初始化这个类
+ (void)initialize{
     NSLog(@"%s",__func__);
   
    // 1.获取导航条标识
    // 获取APP的导航条标识
    // appearance 是一个协议, 只要遵守了这协议都有这方法
    // 如果这样写有重大bug
    //    UINavigationBar *bar =  [UINavigationBar appearance];
    // Class 获取某几个类的导航条标识
    
    if(self==[HLTNagavationController class]){
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self,nil];
    
    // button
    //    [UIButton appearance];
    //    [UILabel appearance];
    
    //
    
    /*UIBarMetricsDefault 设置背景图片值能用UIBarMetricsDefault 控制器viewController的尺寸 {{0, 64}, {375, 603}}
      UIBarMetricsCompact 控制器view的尺寸{{0, 0}, {375, 667}}
     只要给导航设置背景图片只能用默认模式,但是控制器的view的尺寸是从64 开始,高度= 屏幕的高度 - 64
     */
    
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    
    // 设置字体颜色大小
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    
    //字体大小
    dictM[NSFontAttributeName] = [UIFont boldSystemFontOfSize:22];
    // 字体颜色
    dictM[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [bar setTitleTextAttributes:dictM];
    
    
    
    }
    
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
   //如果是非根控制器，在push之前对它进行设置
    if (self.viewControllers.count > 0) {
        // 跟控制器
        // 设置导航条左侧返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"NavBack"] style:0 target:self action:@selector(back)];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    //还原父类的初始化方法
    [super pushViewController:viewController animated:YES];
    
}

- (void)back{
    [self popViewControllerAnimated:YES];
}



- (void)viewDidLoad{
    [super viewDidLoad];
  
}
@end
