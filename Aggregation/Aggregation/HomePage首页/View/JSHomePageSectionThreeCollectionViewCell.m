//
//  JSHomePageSectionThreeCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSHomePageSectionThreeCollectionViewCell.h"
#import "JSSectionTreeCollectionViewCell.h"

@interface JSHomePageSectionThreeCollectionViewCell()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *moreLabel;
@property (nonatomic , strong) UICollectionView *collectionView;
@end


@implementation JSHomePageSectionThreeCollectionViewCell

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
        make.top.equalTo(self.titleLabel.mas_bottom).offset(14*AdapterScal);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-10*AdapterScal);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"热门商品";
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
        flowLayout.itemSize = CGSizeMake(320.0/2*AdapterScal, 480.0/2*AdapterScal);
       
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);// 每一个 section 与周边的间距
        flowLayout.minimumInteritemSpacing = 15.0;
        flowLayout.minimumLineSpacing = 10.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[JSSectionTreeCollectionViewCell class] forCellWithReuseIdentifier:@"JSSectionTreeCollectionViewCell"];
    }
    return _collectionView;
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JSSectionTreeCollectionViewCell *thirdSectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSSectionTreeCollectionViewCell" forIndexPath:indexPath];
    return thirdSectionCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.clickBlock) {
        self.clickBlock(indexPath.row);
    }
}

@end
