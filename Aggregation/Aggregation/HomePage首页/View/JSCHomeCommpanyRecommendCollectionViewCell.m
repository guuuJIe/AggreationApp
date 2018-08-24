//
//  JSCHomeCommpanyRecommendCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSCHomeCommpanyRecommendCollectionViewCell.h"
#import "HomePageCommpanyRecommendCollectionViewCell.h"
@interface JSCHomeCommpanyRecommendCollectionViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *moreLabel;
@property (nonatomic , strong) UICollectionView *collectionView;
@end
@implementation JSCHomeCommpanyRecommendCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10*AdapterScal);
        make.left.equalTo(self).offset(14*AdapterScal);
    }];
    
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14*AdapterScal);
        make.centerY.equalTo(self.titleLabel);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(14*AdapterScal);
        make.bottom.equalTo(self).offset(-10*AdapterScal);
    }];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    HomePageCommpanyRecommendCollectionViewCell *companyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePageCommpanyRecommendCollectionViewCell" forIndexPath:indexPath];
    return companyCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.clickBlock) {
        self.clickBlock(indexPath.row);
    }
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"推荐企业";
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)moreLabel
{
    if (!_moreLabel) {
        _moreLabel = [UILabel new];
        _moreLabel.text = @"查看更多";
        _moreLabel.font = UIFont14;
        _moreLabel.textColor = UIColor333;
        [self addSubview:_moreLabel];
    }
    return _moreLabel;
}

-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(140.0/2*AdapterScal, 170.0/2*AdapterScal);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 14, 0, 14);
        flowLayout.minimumInteritemSpacing = 2.0*AdapterScal;
        flowLayout.minimumLineSpacing = 10.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[HomePageCommpanyRecommendCollectionViewCell class] forCellWithReuseIdentifier:@"HomePageCommpanyRecommendCollectionViewCell"];
    }
    return _collectionView;
}
@end
