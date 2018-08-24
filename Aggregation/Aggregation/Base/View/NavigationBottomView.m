//
//  NavigationBottomView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "NavigationBottomView.h"
#import "UIImage+Category.h"
@implementation NavigationBottomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:255/255.0 green:95/255.0 blue:97/255.0 alpha:0.8];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
//    UIImageView *view = [UIImageView new];
//    view.image = [UIImage imageNamed:@"bgview"];
//    [self addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.top.mas_equalTo(self);
//        make.height.mas_equalTo(44*AdapterScal);
//    }];
//
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(14*AdapterScal);
        make.left.equalTo(self).offset(14);
        make.bottom.equalTo(self).offset(-14);
    }];
}

- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [UILabel new];
        _titleLable.textColor = UIColorfff;
        _titleLable.font = [UIFont boldSystemFontOfSize:24];
        _titleLable.text = @"我的订单";
        [self addSubview:_titleLable];
    }
    return _titleLable;
}

@end
