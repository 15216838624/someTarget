//
//  ViewController.m
//  朋友圈界面
//
//  Created by 冷武橘 on 2017/6/8.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "ViewController.h"
#import "FriendsCircleController.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FriendsCircleController *friendsvc=[[FriendsCircleController alloc]init];
    [self.navigationController pushViewController:friendsvc animated:YES];
}


@end
