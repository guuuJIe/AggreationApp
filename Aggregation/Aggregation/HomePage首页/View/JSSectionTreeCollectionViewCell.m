//
//  JSSectionTreeCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSSectionTreeCollectionViewCell.h"

@interface JSSectionTreeCollectionViewCell()
@property (nonatomic , strong) UIImageView *goodsImage;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *priceLabel;
@property (nonatomic , strong) UILabel *hotLabel;
@property (nonatomic , strong) UILabel *orginpriceLabel;
@end

@implementation JSSectionTreeCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layer.masksToBounds = NO;
        self.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(170*AdapterScal);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.goodsImage);
        make.top.equalTo(self.goodsImage.mas_bottom).offset(10*AdapterScal);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImage);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(6*AdapterScal);
    }];
    
    [self.orginpriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.goodsImage).offset(-5*AdapterScal);
        make.centerY.equalTo(self.priceLabel);
    }];
    
    [self.hotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImage).offset(14*AdapterScal);
        make.left.equalTo(self.goodsImage).offset(-4);
        make.size.mas_equalTo(CGSizeMake(34, 16));
    }];
}

- (UIImageView *)goodsImage
{
    if (!_goodsImage) {
        _goodsImage = [UIImageView new];
        _goodsImage.backgroundColor = UIColorf4f4;
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
        _titleLabel.text = @"格兰威特翻过橡木桶格兰威特翻过橡木桶";
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

- (UILabel *)orginpriceLabel
{
    if (!_orginpriceLabel) {
        _orginpriceLabel = [UILabel new];
        _orginpriceLabel.text = @"1000元/箱";
        _orginpriceLabel.font = UIFont11;
        _orginpriceLabel.textColor = UIColor999;
         NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString: _orginpriceLabel.text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)}];
        _orginpriceLabel.attributedText = attribtStr;
        [self.contentView addSubview:_orginpriceLabel];
    }
    return _orginpriceLabel;
}

- (UILabel *)hotLabel
{
    if (!_hotLabel) {
        _hotLabel = [UILabel new];
        _hotLabel.backgroundColor = UIColor495e;
        _hotLabel.text = @"HOT";
        _hotLabel.font = UIFont15;
        _hotLabel.textAlignment = NSTextAlignmentCenter;
        _hotLabel.textColor = UIColorfff;
        [self.contentView addSubview:_hotLabel];
    }
    return _hotLabel;
}
@end
