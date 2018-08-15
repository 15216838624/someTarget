//
//  AppDelegate.m
//  项目框架搭建
//
//  Created by 冷武橘 on 17/1/10.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "AppDelegate.h"
#import "HLTTaBarvController.h"
#import "NewFeaturesFController.h"
@interface AppDelegate (){
    UIViewController *rootVc;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    #define lastVersion @"version"
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 当有版本更新,或者第一次安装的时候显示新特性界面;
    // 1.获取当前版本号
    NSDictionary *infoDictory=[NSBundle mainBundle].infoDictionary;
    NSString*currVersion=infoDictory[@"CFBundleShortVersionString"];
    
    //1.2取出上次版本号
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *getVersion=[defaults objectForKey:lastVersion];
    //如果当前版本和上次版本号不一样进入新特性页面
    if(![currVersion isEqualToString:getVersion]){
        // 存储当前版本号
        [[NSUserDefaults standardUserDefaults] setObject:currVersion forKey:lastVersion];
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        UIViewController *vc=[[NewFeaturesFController alloc]init];
        rootVc=vc;
        
        
    }else{//否则进入主框架
        
        rootVc= [[HLTTaBarvController alloc] init];
        
    }
    // 2.设置窗口的跟控制器
    // 2.1创建窗口跟控制器
    
    self.window.rootViewController = rootVc;
    
    
    // 3,让窗口显示
    [self.window makeKeyAndVisible];

    


    return YES;
}




@end
