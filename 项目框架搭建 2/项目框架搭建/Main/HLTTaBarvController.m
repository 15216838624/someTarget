//
//  HLTTaBarvController.m
//  从零开始
//
//  Created by 冷武橘 on 16/12/8.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "HLTTaBarvController.h"
#import "HLTAreaController.h"
#import "HLTNagavationController.h"
#import "HLTDiscoverContoller.h"
#import "HLTHallController.h"
@interface HLTTaBarvController()<UITabBarControllerDelegate>

@end

@implementation HLTTaBarvController
- (void)viewDidLoad{
    [super viewDidLoad];
    // 1.添加子控制器
    [self setupAllChildViewController];//
    self.delegate=self;
    
}
+(void)initialize{
    
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}


// 添加所有的子控制器
- (void)setupAllChildViewController{
    
    // 1.购彩大厅
    HLTHallController *hall = [[HLTHallController alloc] init];

    [self setupOneChildViewController:hall image:[UIImage imageNamed:@"icon_main_home"] selImage:[UIImage imageNamed:@""]title:@"大厅"];
    
    
    // 2.竞技场
    HLTAreaController *arena = [[HLTAreaController alloc] init];

    
    [self setupOneChildViewController:arena image:[UIImage imageNamed:@""] selImage:[UIImage imageNamed:@""] title:@"购彩大厅"];
    
    // 3.发现
    HLTDiscoverContoller *discover = [[HLTDiscoverContoller alloc] init];
    discover.view.backgroundColor  = [UIColor orangeColor];
    
    [self setupOneChildViewController:discover image:[UIImage imageNamed:@""] selImage:[UIImage imageNamed:@""]title:@"发现"];
 

}


// 添加一个子控制器
- (void)setupOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title{
    
    //关闭图片的渲染模式
    UIImage * normalImage = [ image  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * selectImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
     vc.tabBarItem.title=title;
     vc.tabBarItem.image = normalImage;
     vc.tabBarItem.selectedImage =selectImage ;
    //父类指向子类，多态
    UINavigationController*na=[[HLTNagavationController alloc]initWithRootViewController:vc];
    
    //如果是竞技场控制器使用系统的导航控制器就行了，其他的都使用自定义的导航控制器
    if ([vc isKindOfClass:[HLTAreaController class]]){
        
        na=[[UINavigationController alloc]initWithRootViewController:vc];
        
    }
    
    [self addChildViewController:na];
    
//    vc.navigationItem.title=title;
    
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController.tabBarItem.title isEqualToString:@"大厅"]) {
 
        return YES;
    }
    
    return YES;
    
}



@end
