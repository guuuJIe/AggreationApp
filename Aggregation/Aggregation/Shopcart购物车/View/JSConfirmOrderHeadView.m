//
//  JSConfirmOrderHeadView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSConfirmOrderHeadView.h"

@interface JSConfirmOrderHeadView()
@property (nonatomic , strong) UIImageView *bgView;
@property (nonatomic , strong) UIImageView *adressView;
@property (nonatomic , strong) UILabel *nameLabel;
@end

@implementation JSConfirmOrderHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
    }
    return self;
}


- (void)setupLayout
{
    
    
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.contentView);
        make.height.mas_equalTo(145*AdapterScal);
    }];
    
    [self.adressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.equalTo(self.bgView.mas_bottom).offset(-40);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"确认订单";
    titleLabel.textColor = UIColorfff;
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgView);
        make.left.equalTo(self.bgView).offset(14);
    }];
    
    UILabel *iconLabel = [UILabel new];
    iconLabel.text = @"\U0000e769";
    iconLabel.font = iconFontSize(25);
    [self.contentView addSubview:iconLabel];
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.adressView);
        make.left.equalTo(self.contentView).offset(14);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.adressView.mas_top).offset(18*AdapterScal);
        make.left.equalTo(iconLabel.mas_right).offset(12*AdapterScal);
    }];
}

- (UIImageView *)bgView
{
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.image = [UIImage imageNamed:@"confirmOrderView"];
//        _bgView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_bgView];
    }
    return _bgView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textColor = UIColor333;
        _nameLabel.font = UIFont14;
        _nameLabel.textColor = UIColor333;
        _nameLabel.text = @"收货人  z张三";
        [self.contentView addSubview:_nameLabel];
    }
    
    return _nameLabel;
}

- (UIImageView *)adressView
{
    if (!_adressView) {
        _adressView = [UIImageView new];
        _adressView.image = [UIImage imageNamed:@"adressView"];
//        _adressView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_adressView];
    }
    return _adressView;
}

@end
