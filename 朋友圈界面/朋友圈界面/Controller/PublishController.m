//
//  PublishController.m
//  EHR
//
//  Created by 冷武橘 on 2017/6/6.
//  Copyright © 2017年 v2. All rights reserved.
//

#import "PublishController.h"
//#import "Saytextview.h"
@interface PublishController ()
//@property(nonatomic,strong)Saytextview *saytextview;
@end

@implementation PublishController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn=[[UIButton alloc]init];
    btn.frame=CGRectMake(0, 0, 80, 40);
    [btn setTitle:@"发布" forState:UIControlStateNormal];
    [btn sizeToFit];
    UIBarButtonItem *btnbuttonitem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem= btnbuttonitem;
//    _saytextview=[[Saytextview alloc]init];
//    _saytextview.myPlaceholder=@"分享点什么....";
//    _saytextview.backgroundColor=[UIColor grayColor];
//    [self.view addSubview:_saytextview];
//    [_saytextview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(0);
//        make.left.right.equalTo(self.view);
//        make.height.equalTo(@100);
//    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
