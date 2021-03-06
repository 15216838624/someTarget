//
//  YZEmotionPageCell.m
//  YZEmotionKeyboardDemo
//
//  Created by yz on 16/8/6.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZEmotionPageCell.h"
#import "YZEmotionCell.h"
#import "YZEmotionManager.h"
#import "YZTextAttachment.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width

static NSString * const ID = @"emojicell";

@interface YZEmotionPageCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) UICollectionView *collectionView;
@end


@implementation YZEmotionPageCell

- (UICollectionView *)collectionView{
    
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        // 计算间距
        CGFloat margin = (ScreenW - colsOfPage * emotionWH) / (colsOfPage + 1);
        layout.itemSize = CGSizeMake(emotionWH, emotionWH);
        layout.minimumInteritemSpacing = margin;
        layout.minimumLineSpacing = margin;
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, 0, margin);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        collectionView.scrollEnabled  = NO;
        [collectionView registerNib:[UINib nibWithNibName:@"YZEmotionCell" bundle:nil] forCellWithReuseIdentifier:ID];
        _collectionView = collectionView;
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:collectionView];
    }
    
    return _collectionView;
}

- (void)setEmotions:(NSArray *)emotions
{
    _emotions = emotions;
    
    [self.collectionView reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _emotions.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YZEmotionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    NSString *imageName = @"Emotion.bundle/delete";
    
    if (indexPath.row < _emotions.count) {
        imageName = [NSString stringWithFormat:@"Emotion.bundle/%@",_emotions[indexPath.row]];
    }
    
    UIImage *image = [UIImage imageNamed:imageName];
    [cell.emotionButton setBackgroundImage:image forState:UIControlStateNormal];
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _emotions.count) {
        // 点击最后一个 删除
        [[NSNotificationCenter defaultCenter] postNotificationName:@"didClickDelete" object:nil];
        return;
    }

    YZEmotionCell *cell =   (YZEmotionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    UIImage *image=[cell.emotionButton backgroundImageForState:UIControlStateNormal];
    
    UIImageView *imageview=[[UIImageView alloc]initWithImage:
                            image];
    imageview.bounds= CGRectMake(0, -3, image.size.width, image.size.height);
    
    
    // 点击表情
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectEmotion" object:imageview];
}

@end
