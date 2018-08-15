//
//  AddController.m
//  广告倒计时
//
//  Created by 冷武橘 on 17/1/9.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "AddController.h"
#import "AFNetworking.h"
#import "ViewController.h"
#import "UIImageView+WebCache.h"
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

/***********屏幕适配*************/
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define iphone6P (ScreenH == 736)
#define iphone6 (ScreenH == 667)
#define iphone5 (ScreenH == 568)
#define iphone4 (ScreenH == 480)
/***********屏幕适配*************/

@interface AddController ()
@property (nonatomic, weak) UIImageView *adView;//广告视图
@property (nonatomic, weak) NSTimer *timer;
@property ( nonatomic,strong)  UIView *containView;//占位视图
@property(nonatomic,strong)UIButton *jumpBtn;
@property(nonatomic,strong)NSString *ori_curl;
@end

@implementation AddController
/*实现思路：将广告控制器的背景图片和启动图片设置的一模一样，给人造成视觉的假象让人以为app启动了好久并加载显示了广告图片，然后再切换跟根控制器到主界面
 占位思想：view的层级结构比较明确，控件的尺寸也不确定，我们可以用一个view进行占位，然后再将控件添加到占位视图里，但设计时需要注意view层级关系，避免控件被遮挡。
 */

#pragma mark- 懒加载广告视图并添加到广告占位视图上
- (UIImageView *)adView
{
    if (_adView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        [_containView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        _adView = imageView;
    }
    
    return _adView;
}



#pragma mark- 点击广告跳到广告链接页
// 点击广告界面调用
- (void)tap
{
     //跳转到界面 => safari
    NSURL *url = [NSURL URLWithString:_ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
    
        [app openURL:url];  
    }
}




#pragma mark- 设置控制器view和启动图片一样，并进行屏幕适配

// 当第一次加载view的时候调用
// 如果自定义view,重写这个方法
- (void)loadView{
    // 在这个方法里面不能调用self.view.bounds,如果调用会造成死循环
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //    [self.view addSubview:imageView];
    self.view = imageView;
    
    if (iphone6P) { // 6p
        imageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iphone6) { // 6
        imageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iphone5) { // 5
          imageView.image= [UIImage imageNamed:@"LaunchImage-568h"];
        
    } else if (iphone4) { // 4
      imageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    
    // 设置允许与用户交互
    imageView.userInteractionEnabled = YES;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setui];
    
    // 创建定时器
    _timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];

    [self loadData];

}

#pragma mark- 搭建UI界面
- (void)setui{
    _containView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    [self.view addSubview: _containView];
    _jumpBtn=[[UIButton alloc]initWithFrame:CGRectMake(ScreenW-100, 20, 80, 40)];
    [_jumpBtn setTitle:@"跳过(3)" forState:UIControlStateNormal];
    [_jumpBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_jumpBtn addTarget:self action:@selector(clickjump:) forControlEvents:UIControlEventTouchUpInside];
    _jumpBtn.backgroundColor=[UIColor grayColor];
    [self.view addSubview: _jumpBtn];
    /*注意btn和view为同一个层级，都作为self.view的子视图这样才能避免广告后来加载出来去遮挡住按钮。
     */
}


#pragma mark- 倒计时
- (void)timeChange
{
    // 倒计时
    static int i = 3;
    
    if (i == 0) {
        [self clickjump:nil];
        
    }
    
    i--;
    
    // 设置跳转按钮文字
    [_jumpBtn setTitle:[NSString stringWithFormat:@"跳转 (%d)",i] forState:UIControlStateNormal];
}

#pragma mark- 点击跳过按钮切换根控制器到主界面
- (void)clickjump:(id)sender{
    ViewController *vc=[[ViewController alloc]init];
        [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    
    // 干掉定时器
    [_timer invalidate];
}


#pragma mark- 请求广告数据
-(void)loadData{
    // unacceptable content-type: text/html"  响应头
    
    // 1.创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html", nil];


    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    
    // 3.发送请求
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable responseObject) {
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        NSString *w_picurl=adDict[@"w_picurl"];
        self.ori_curl=adDict[@"ori_curl"];
        CGFloat width=[adDict[@"w"] floatValue];
        CGFloat height=ScreenW/width*[adDict[@"h"] floatValue];
        NSLog(@"%@",responseObject);
    
        //加载显示图片
        [self.adView  sd_setImageWithURL: [NSURL URLWithString:w_picurl]  placeholderImage:[UIImage imageNamed:@"avatar-placeholder.png"]
                              options:SDWebImageRefreshCached];
        self.adView.frame= CGRectMake(0, 0,ScreenW, height);

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
    }];
    
}
@end
