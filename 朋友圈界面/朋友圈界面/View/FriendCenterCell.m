//
//  FriendCenterCell.m
//  朋友圈
//
//  Created by 冷武橘 on 2017/5/27.
//  Copyright © 2017年 冷武橘. All rights reserved.
//

#import "FriendCenterCell.h"
#import "Masonry.h"
#import "Messagecenter.h"
#import "FriendsCenter.h"
#import "MessageCell.h"
#import "XLPhotoBrowser.h"
#import "ImageCollectionCell.h"
static NSInteger const cols = 3;
static CGFloat const margin = 5;
#define itemWH ([UIScreen mainScreen].bounds.size.width - 90-(cols - 1) * margin) / cols
static NSString * const ID = @"cell";
@interface FriendCenterCell()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,XLPhotoBrowserDelegate, XLPhotoBrowserDatasource>
@property(nonatomic,strong)UIImageView *iconview;
@property(nonatomic,strong)UILabel *nameview;
@property(nonatomic,strong)UILabel *timeview;
@property (nonatomic, strong)UILabel *descLabel;

@property (nonatomic, assign)CGFloat tableviewheight;
@property (nonatomic, weak) UICollectionView *collectionView;
    /**
     * 图片数组
     */
    @property (nonatomic , strong) NSMutableArray  *squareItems;
@end
@implementation FriendCenterCell


+(instancetype)cellwithtableview:(UITableView *)tableview{
    static NSString * chongzu =@"Cell";//重用机制标识
    FriendCenterCell * cell =[tableview dequeueReusableCellWithIdentifier:chongzu];//根据重用标r识，到重用池找对应的cell
    if (cell==nil) {
        cell=[[FriendCenterCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:chongzu];//创建一个
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
    }

    return cell;
    
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _iconview=[[UIImageView alloc]init];
        _iconview.backgroundColor=[UIColor grayColor];
        [self.contentView addSubview:_iconview];
        [_iconview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.top.equalTo(self.contentView).offset(10);
            make.width.equalTo(@40);
            make.height.equalTo(@40);
          
        }];
        _nameview=[[UILabel alloc]init];
//        _nameview.backgroundColor=[UIColor yellowColor];
        _nameview.text=@"张三";
        [self.contentView addSubview:_nameview];
        [_nameview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_iconview);
            make.left.equalTo(_iconview.mas_right).offset(10);
            make.width.equalTo(@120);
        }];
        UILabel *name=[[UILabel alloc]init];
//        name.backgroundColor=[UIColor yellowColor];
        name.text=@"岗位名称";
        [self.contentView addSubview:name];
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameview.mas_bottom).offset(5);
            make.left.equalTo(_nameview).offset(0);
            make.width.equalTo(@120);
        }];
        _descLabel=[[UILabel alloc]init];
        _descLabel.text=@"昨夜西风凋碧树。独上高楼，望尽天涯路";
        _descLabel.numberOfLines=0;
        [self.contentView addSubview:_descLabel];
        [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(name.mas_bottom).offset(5);
            make.left.equalTo(name).offset(0);
            make.right.equalTo(self.contentView).offset(-10);
           
        }];
        [self setimageview];
        _timeview=[[UILabel alloc]init];
//        _timeview.backgroundColor=[UIColor greenColor];
        _timeview.text=@"昨天";
        [self.contentView addSubview: _timeview];
        [_timeview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_collectionView.mas_bottom).offset(5);
            make.left.equalTo(self.contentView).offset(10);
            make.width.equalTo(@120);
          
        }];
        _commentBtn=[[UIButton alloc]init];
        [_commentBtn setImage:[UIImage imageNamed:@"评论"] forState:UIControlStateNormal];
//        _commentBtn.backgroundColor=[UIColor grayColor];
        [self.contentView addSubview:_commentBtn];
    
        [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView.mas_right).offset(-10);
            make.width.equalTo(@40);
            make.top.equalTo(self.timeview);
            make.height.equalTo(@30);
            
        }];
        _priaseBtn=[[UIButton alloc]init];
        [_priaseBtn setImage:[UIImage imageNamed:@"赞"] forState:UIControlStateNormal];
        [_priaseBtn setImage:[UIImage imageNamed:@"赞2"] forState:UIControlStateSelected];
//        _priaseBtn.backgroundColor=[UIColor grayColor];
        [self.contentView addSubview: _priaseBtn];
        [ _priaseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_commentBtn.mas_left).offset(-10);
            make.width.equalTo(@40);
            make.top.equalTo(self.timeview);
            make.height.equalTo(@30);
       
        }];
        _tableview=[[UITableView alloc]init];
        _tableview.delegate=self;
        _tableview.dataSource=self;
//         _tableview.separatorStyle= UITableViewCellSeparatorStyleNone;
        _tableview.scrollEnabled=NO;
        _tableview.estimatedRowHeight=25;
 
        _tableview.backgroundColor=[UIColor yellowColor];
        [self.contentView addSubview:_tableview];
      
    }
    
    
    return  self;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * chongzu =@"mycell";//重用机制标识
   MessageCell * cell =[tableView   dequeueReusableCellWithIdentifier:chongzu];//根据重用标r识，到重用池找对应的cell
    if (cell==nil) {
        cell=[[ MessageCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:chongzu];//创建一个
        cell.selectionStyle= UITableViewCellSelectionStyleGray;
        cell.backgroundColor=[UIColor clearColor];
    };
    Messagecenter *mesasge=self.array[indexPath.row];
    cell.messagecenter=mesasge;

    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (void)setFrienscenter:(FriendsCenter *)frienscenter{
    
    _frienscenter=frienscenter;
    _nameview.text=frienscenter.name;
    _descLabel.text=frienscenter.says;
    _timeview.text=frienscenter.time;
    _squareItems=frienscenter.imagearray;
    // 设置collectionView的高度
    NSInteger count = _squareItems.count;
    NSInteger rows = count>0 ?(count - 1) / cols + 1:0;
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.height.mas_equalTo(rows*itemWH);
     }];
    self.array=frienscenter.grouparray;
    self.tableviewheight=0;
    for (int i=0; i<frienscenter.grouparray.count; i++) {
    Messagecenter *mesage=frienscenter.grouparray[i];
    NSLog(@"%@ %f",mesage.messagetext,   mesage.cellheight);
    self.tableviewheight=self.tableviewheight+mesage.cellheight;
    }
    [_tableview mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeview);
        make.right.equalTo(self.contentView).offset(0);
        make.top.equalTo(self.timeview.mas_bottom).offset(10);
        make.height.mas_equalTo(_tableviewheight);
 
    }];
 
  [_tableview reloadData];
    [self layoutIfNeeded];
    frienscenter.cellheight=CGRectGetMaxY(_tableview.frame);

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate answer:self.tableview indexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    Messagecenter *message=self.array[indexPath.row];
    
    return message.cellheight;
    
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    
}
- (void)setimageview{


    // 创建布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置cell尺寸
    
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    // 创建UICollectionView
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    [self.contentView addSubview:collectionView];
    collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView = collectionView;
    collectionView.dataSource = self;
    collectionView.delegate=self;
    collectionView.scrollEnabled = NO;
    [collectionView registerClass:[ImageCollectionCell class] forCellWithReuseIdentifier:ID];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_descLabel.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-30);
       make.left.equalTo(_descLabel);
    }];
    
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.squareItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 从缓存池取
   ImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageconts.image=self.squareItems[indexPath.item];
    cell.backgroundColor=[UIColor redColor];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithCurrentImageIndex:indexPath.item imageCount:self.squareItems.count datasource:self];
    browser.pageControlStyle = XLPhotoBrowserPageControlStyleAnimated;

}
#pragma mark    -   XLPhotoBrowserDatasource
    
- (UIImage *)photoBrowser:(XLPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
    {
        return self.squareItems[index];
    }
    
- (UIImageView *)photoBrowser:(XLPhotoBrowser *)browser sourceImageViewForIndex:(NSInteger)index
    {  NSIndexPath *indext=[NSIndexPath indexPathForItem:index inSection:0];
        
        ImageCollectionCell *cell=(ImageCollectionCell *)[self.collectionView cellForItemAtIndexPath:indext];
        UIImageView *imagview=[[UIImageView alloc]initWithImage:cell.imageconts.image];
        
        return imagview;
        
        
    }
  
    
    
@end
