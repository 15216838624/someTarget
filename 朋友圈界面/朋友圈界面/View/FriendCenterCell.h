//
//  FriendCenterCell.h
//  朋友圈
//
//  Created by 冷武橘 on 2017/5/27.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FriendsCenter;
@protocol AngswerDelegate <NSObject>

- (void)answer:(UITableView *)tableview  indexPath:(NSIndexPath *)indexPath;

@end

@interface FriendCenterCell : UITableViewCell
@property (nonatomic, copy)  void(^textBlock) (NSString*text); // 字符串回调
@property (nonatomic, strong)UIButton *commentBtn;
@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)FriendsCenter *frienscenter;
+(instancetype)cellwithtableview:(UITableView *)tableview;
@property(nonatomic,strong)UITableView *tableview;
@property (nonatomic, strong)UIButton *priaseBtn;
@property(nonatomic,strong)id<AngswerDelegate>delegate;
@property (nonatomic, copy)  void(^imageBlock) (); // 字符串回调
@end
