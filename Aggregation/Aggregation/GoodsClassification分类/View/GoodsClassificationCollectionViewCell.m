//
//  GoodsClassificationCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "GoodsClassificationCollectionViewCell.h"
#import "ClassificationCollectionViewCell.h"
@interface GoodsClassificationCollectionViewCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray *datas;
@end

@implementation GoodsClassificationCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupLayout];
        
    }
    return self;
}

- (void)setupLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20*AdapterScal+StauesBarHeight);
        make.left.equalTo(self).offset(10*AdapterScal);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(74*AdapterScal);
        make.left.right.mas_equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).offset(-10*AdapterScal);
    }];
}



- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"全部商品";
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(ScreenWidth/3, ScreenWidth/3);
     
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.contentView addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ClassificationCollectionViewCell class] forCellWithReuseIdentifier:@"ClassificationCollectionViewCell"];
    }
    return _collectionView;
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ClassificationCollectionViewCell *classifyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ClassificationCollectionViewCell" forIndexPath:indexPath];
    [classifyCell setupData:self.datas[indexPath.row]];
    return classifyCell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.datas.count;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.clickBlock) {
        self.clickBlock(indexPath.row);
    }
}

- (NSMutableArray *)datas
{
    if (!_datas) {
        _datas = [NSMutableArray new];
        NSArray *array = @[@"白酒",@"洋酒",@"红酒",@"饮料",@"啤酒",@"保健酒",@"",@"其他"];
        for (int i =0; i<array.count;i++) {
            NSString *title = array[i];
            NSMutableDictionary *dic = [NSMutableDictionary new];
            [dic setObject:title forKey:@"title"];
            NSString *imageName = [NSString stringWithFormat:@"icon_wine%d",i];
            [dic setObject:imageName forKey:@"imageName"];
            [_datas addObject:dic];
        }
    }
    return _datas;
}

@end
