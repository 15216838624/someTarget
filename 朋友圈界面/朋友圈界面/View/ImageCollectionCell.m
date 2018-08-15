//
//  ImageCollectionCell.m
//  EHR
//
//  Created by 冷武橘 on 2017/6/7.
//  Copyright © 2017年 v2. All rights reserved.
//

#import "ImageCollectionCell.h"
#import "Masonry.h"
@implementation ImageCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]){
        self.imageconts=[[UIImageView alloc]init];
        [self addSubview:_imageconts];
        [self.imageconts mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.bottom.equalTo(self);
        }];
        
    }
    return  self;
}

@end
