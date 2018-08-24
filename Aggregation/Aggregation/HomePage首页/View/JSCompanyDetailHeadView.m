//
//  JSCompanyDetailHeadView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSCompanyDetailHeadView.h"

@interface JSCompanyDetailHeadView()
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *subTitleLabel;
@property (nonatomic , strong) UIImageView *goodsImage;
@end

@implementation JSCompanyDetailHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setHeadview];
    }
    return self;
}

- (void)setHeadview
{
    
    
    [self.goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.contentView).offset(14*AdapterScal);
        make.size.mas_equalTo(CGSizeMake(200.0/2*AdapterScal, 190.0/2*AdapterScal));
        make.right.equalTo(self.contentView).offset(-12*AdapterScal);
    }];
     
     [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.contentView).offset(12);
         make.top.equalTo(self.contentView).offset(14*AdapterScal);
         make.right.equalTo(self.goodsImage.mas_left).offset(-14*AdapterScal);
     }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.goodsImage.mas_left).offset(36*AdapterScal);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"旗下产品";
    titleLabel.textColor = UIColor000;
    titleLabel.font = UIFont16;
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.subTitleLabel.mas_bottom).offset(36*AdapterScal);
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
        _titleLabel.text = @"浙江玖商玖汇网络科技有限公司";
        _titleLabel.font = UIFont18;
        _titleLabel.textColor = UIColor000;
       
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel new];
        _subTitleLabel.text = @"浙江玖商玖汇网络科技有限公司";
        _subTitleLabel.font = UIFont14;
        _subTitleLabel.textColor = UIColor666;
        _subTitleLabel.numberOfLines = 0;
        [self.contentView addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}

@end
