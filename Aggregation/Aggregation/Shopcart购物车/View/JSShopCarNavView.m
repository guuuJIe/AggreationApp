//
//  JSShopCarNavView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSShopCarNavView.h"

@interface JSShopCarNavView()
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UIImageView *emptyView;
@end

@implementation JSShopCarNavView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorfff;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(30*AdapterScal);
    }];
    
    UILabel *label =[UILabel new];
    label.text = @"去添加点什么吧~";
    label.font = UIFont14;
    label.textColor = UIColor999;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.emptyView.mas_bottom).offset(15*AdapterScal);
        make.bottom.equalTo(self).offset(-10);
    }];
}

- (UIImageView *)emptyView
{
    if (!_emptyView) {
        _emptyView = [UIImageView new];
        _emptyView.contentMode = UIViewContentModeScaleAspectFit;
        _emptyView.image = [UIImage imageNamed:@"car_null"];
        [self addSubview:_emptyView];
    }
    return _emptyView;
}



@end
