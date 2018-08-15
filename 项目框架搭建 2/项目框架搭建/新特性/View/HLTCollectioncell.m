//
//  HLTCollectioncell.m
//  Collectionview
//
//  Created by 冷武橘 on 16/12/9.
//  Copyright © 2016年 冷武橘. All rights reserved.
//

#import "HLTCollectioncell.h"
@interface HLTCollectioncell()
@property(nonatomic,weak)UIImageView *imageview;
@end
@implementation HLTCollectioncell
- (UIImageView *)imageview{
    if (!_imageview) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageView];
        _imageview=imageView;
    }
    return _imageview;
}
- (void)setImage:(UIImage *)image{
    _image=image;
    self.imageview.image=image;
    
    
}

@end
