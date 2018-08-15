//
//  NewFeaturesFController.m
//  从零开始
//
//  Created by 冷武橘 on 16/12/9.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "NewFeaturesFController.h"
#import "HLTCollectioncell.h"
@interface NewFeaturesFController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)NSArray *imagearray;
@end


@implementation NewFeaturesFController
- (void)viewDidLoad {
    [super viewDidLoad];
 _imagearray=@[@"1",@"guide2Background",@"guide3Background",@"guide4Background"];
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    layout.itemSize=CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    layout.minimumLineSpacing=0;
    layout.minimumInteritemSpacing=0;
    UICollectionView *collectionview=[[UICollectionView alloc]initWithFrame:self.view.bounds     collectionViewLayout:layout];
    collectionview.backgroundColor=[UIColor whiteColor];
    collectionview.delegate=self;
    collectionview.dataSource=self;
    // 隐藏滚动条
    collectionview.showsHorizontalScrollIndicator = NO;
    //分页效果
    collectionview.pagingEnabled=YES;
    collectionview.bounces=NO;//关闭collectionview弹簧效果
    [collectionview registerClass:[HLTCollectioncell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:collectionview];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //设置组数，不写默认为一组
    return 1;
}
//每个UICollectionView每组的列数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //如果一组有多列，宽度超过了屏幕的宽度，则多出来的ltem会自动换行
    return _imagearray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //注意，此处的identifier要与注册cell时使用的标识保持一致
    
    static NSString * identifier = @"cell";
    HLTCollectioncell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.image=[UIImage imageNamed:_imagearray[indexPath.item]];
    for(UIView *view in [cell.contentView subviews]){
        
        if ([view isKindOfClass:[UIButton class]]){
        
            [view removeFromSuperview];
        }
        
        
    }
    

    if (indexPath.item==3) {
        UIButton *button = [[UIButton alloc] init];
        [button setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        button.frame = CGRectMake(60, 400, 100, 40);
        [button addTarget:self action:@selector(enter) forControlEvents:UIControlEventTouchUpInside];
        [button sizeToFit];
        [cell.contentView addSubview:button];

    }
    
    
    
    return cell;
}
- (void)enter{
    // 切换主界面
    // 切换界面方式  1.push 2.tabBarVC  3.modale
    
    // 想让新特性界面销毁
    
    // 切换窗口的跟控制器
    
//   ViewController *hltvc=[[ViewController alloc
//                                 ]init];
//    UIWindow *window= [UIApplication sharedApplication].keyWindow;
//    window.rootViewController=hltvc;
    

}
- (void)dealloc{

    NSLog(@"新特性界面被销毁");
}


@end
