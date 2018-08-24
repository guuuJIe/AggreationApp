//
//  ThemeRecommandCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ThemeRecommandCollectionViewCell.h"

@interface ThemeRecommandCollectionViewCell()
@property (nonatomic , strong) UIImageView *goodsImage;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *priceLabel;
@property (nonatomic , strong) UILabel *subTitleLabel;
@end

@implementation ThemeRecommandCollectionViewCell

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
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(170*AdapterScal);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImage.mas_bottom).offset(12*AdapterScal);
        make.left.equalTo(self.contentView);
        make.width.mas_equalTo(220*AdapterScal);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8*AdapterScal);
        make.left.equalTo(self.titleLabel);
         make.width.mas_equalTo(200*AdapterScal);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.goodsImage.mas_right);
        make.top.equalTo(self.titleLabel);
    }];
}

- (UIImageView *)goodsImage
{
    if (!_goodsImage) {
        _goodsImage = [UIImageView new];
        _goodsImage.backgroundColor = ThemeColor;
        _goodsImage.layer.cornerRadius = 4;
        _goodsImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_goodsImage];
    }
    return _goodsImage;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶";
        _titleLabel.font = UIFont14;
        _titleLabel.textColor = UIColor333;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.text = @"800元/箱";
        _priceLabel.font = UIFont14;
        _priceLabel.textColor = UIColor495e;
        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel new];
        _subTitleLabel.text = @"格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶";
        _subTitleLabel.font = UIFont12;
        _subTitleLabel.textColor = UIColor999;
        [self.contentView addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}
@end
