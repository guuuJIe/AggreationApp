//
//  JSAddInCarView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSAddInCarView.h"

@interface JSAddInCarView()
@property (nonatomic , strong) UIButton *shop;
@property (nonatomic , strong) UIButton *car;
@property (nonatomic , strong) UIButton *add;
@end

@implementation JSAddInCarView

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
    [self.shop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self);
        make.height.mas_equalTo(50*AdapterScal);
        make.width.mas_equalTo(ScreenWidth/4);
//        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = UIColore5e5;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shop).offset(5);
        make.bottom.equalTo(self.shop);
        make.left.mas_equalTo(self.shop.mas_right).offset(1);
        make.width.mas_equalTo(JLineHeight);
    }];
    
    [self.car mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line.mas_right).offset(1);
        make.top.equalTo(self);
        make.width.mas_equalTo(ScreenWidth/4);
         make.height.mas_equalTo(50*AdapterScal);
    }];
    
    
    
    [self.add mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.car.mas_right);
        make.top.right.equalTo(self);
        make.height.mas_equalTo(50*AdapterScal);
    }];
}

- (UIButton *)shop
{
    if (!_shop) {
        _shop = [UIButton new];
        [_shop setImage:[UIImage imageNamed:@"Home_unsel"] forState:0];
       
        [self addSubview:_shop];
    }
    return _shop;
}

- (UIButton *)car
{
    if (!_car) {
        _car = [UIButton new];
        [_car setImage:[UIImage imageNamed:@"ShopCar_unsel"] forState:0];
        [self addSubview:_car];
    }
    return _car;
}

- (UIButton *)add
{
    if (!_add) {
        _add = [UIButton new];
        [_add setTitle:@"加入购物车" forState:0];
        [_add setBackgroundColor:UIColor4a58];
        [_add.titleLabel setFont:UIFont15];
        [self addSubview:_add];
    }
    return _add;
}

@end
