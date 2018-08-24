//
//  HomePageCommpanyRecommendCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "HomePageCommpanyRecommendCollectionViewCell.h"
@interface HomePageCommpanyRecommendCollectionViewCell()
@property (nonatomic , strong) UIImageView *goodsImage;
@property (nonatomic , strong) UILabel *titleLabel;
@end
@implementation HomePageCommpanyRecommendCollectionViewCell
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
    [self.goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(70*AdapterScal, 70*AdapterScal));
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.goodsImage);
        make.top.equalTo(self.goodsImage.mas_bottom).offset(10*AdapterScal);
        make.left.right.equalTo(self);
    }];
}


- (UIImageView *)goodsImage
{
    if (!_goodsImage) {
        _goodsImage = [UIImageView new];
        _goodsImage.backgroundColor = UIColorf4f4;
        _goodsImage.layer.cornerRadius = 4*AdapterScal;
        _goodsImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_goodsImage];
    }
    return _goodsImage;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"好比来超市";
        _titleLabel.font = UIFont14;
        _titleLabel.textColor = UIColor666;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
@end
