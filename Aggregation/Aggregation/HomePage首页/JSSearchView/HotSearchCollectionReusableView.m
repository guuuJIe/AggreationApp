//
//  HotSearchCollectionReusableView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "HotSearchCollectionReusableView.h"
#import "HotSearchKeyWordCollectionViewCell.h"
#import "NSString+width.h"
#import "CotentView.h"
@interface HotSearchCollectionReusableView()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic , strong) HotSearchKeyWordCollectionViewCell *cell;
@end

@implementation HotSearchCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
         _data = [NSMutableArray arrayWithArray:@[@"测试数据",@"云标签",@"历史记录",@"测试",@"妈妈说标题要长",@"机智的手哥"]];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UILabel *titlelable = [UILabel new];
    titlelable.text = @"热门搜索";
    titlelable.textColor = UIColor333;
    titlelable.font = [UIFont boldSystemFontOfSize:16];
    [self addSubview:titlelable];
    [titlelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.top.equalTo(self).offset(10*AdapterScal);
    }];
    
    CotentView *pwView = [[CotentView alloc]initWithFrame:CGRectMake(10, 10, ScreenWidth - 20,450) dataArr:self.data];
    pwView.backgroundColor = [UIColor whiteColor];
    [pwView btnClickBlock:^(NSInteger index) {
        
        NSLog(@"%ld",(long)index);
        
    }];
    [self addSubview:pwView];
    [pwView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titlelable.mas_bottom).offset(10);
        make.left.equalTo(titlelable);
        make.right.equalTo(self).offset(-14);
        make.height.mas_equalTo(80);
    }];
    
    UILabel *likelable = [UILabel new];
    likelable.text = @"猜你喜欢";
    likelable.textColor = UIColor333;
    likelable.font = [UIFont boldSystemFontOfSize:16];
    [self addSubview:likelable];
    [likelable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.top.equalTo(pwView.mas_bottom).offset(10*AdapterScal);
    }];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HotSearchKeyWordCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HotSearchKeyWordCollectionViewCell" forIndexPath:indexPath];
    cell.keyword = self.data[indexPath.row];
//    [cell sizeForCell];
    return cell;
}
//
//实现宽度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *label = self.data[indexPath.row];
    CGFloat width = [label stringWidthWithFont:UIFont14 height:30];
    return CGSizeMake(width + 15 * 2, 30);
}





-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(ScreenWidth/4, 30);
//        flowLayout.sectionInset = UIEdgeInsetsMake(10, 12, 0, 12);
//        flowLayout.minimumInteritemSpacing = 2.0;
//        flowLayout.minimumLineSpacing = 10.0;
        flowLayout.sectionInset = UIEdgeInsetsMake(10,10,10,10);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HotSearchKeyWordCollectionViewCell class] forCellWithReuseIdentifier:@"HotSearchKeyWordCollectionViewCell"];
    }
    return _collectionView;
}
@end
