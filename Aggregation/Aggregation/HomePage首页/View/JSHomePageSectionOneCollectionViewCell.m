//
//  JSHomePageSectionOneCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/10.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

@interface customeView : UIView


@end

@implementation customeView

@end


#import "JSHomePageSectionOneCollectionViewCell.h"
#import "LimitedTimeCollectionViewCell.h"
#import "JSHomePageSectionZeroView.h"
@interface JSHomePageSectionOneCollectionViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSArray *datas;
@property (nonatomic , strong) JSHomePageSectionZeroView *limitView;
@end

@implementation JSHomePageSectionOneCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _datas = @[
  @{@"topText":@"限时抢购",@"bottomText":@"点击进入",@"image":@"icon_1"},
  @{@"topText":@"会员专区",@"bottomText":@"点击进入",@"image":@"icon_2"}];
        self.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    
    [self.limitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(12*AdapterScal);
        make.left.right.bottom.mas_equalTo(self.contentView);
    }];
    
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self);
//    }];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LimitedTimeCollectionViewCell *limitcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LimitedTimeCollectionViewCell" forIndexPath:indexPath];
//    [limitcell setupData:self.datas[indexPath.row]];
    return limitcell;
}



-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(ScreenWidth, 140/2);
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.contentView addSubview:_collectionView];
        [_collectionView registerClass:[LimitedTimeCollectionViewCell class] forCellWithReuseIdentifier:@"LimitedTimeCollectionViewCell"];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
       
    }
    return _collectionView;
}


- (JSHomePageSectionZeroView *)limitView
{
    if (!_limitView) {
        _limitView = [[JSHomePageSectionZeroView alloc] init];
        [self.contentView addSubview:_limitView];
    }
    return _limitView;
}


@end
