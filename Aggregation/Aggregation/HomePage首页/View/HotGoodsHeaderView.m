//
//  HotGoodsHeaderView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "HotGoodsHeaderView.h"

@implementation HotGoodsHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setsubViews];
    }
    return self;
}


- (void)setsubViews
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(14);

    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"热门商品";
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

@end
