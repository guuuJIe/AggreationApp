//
//  SubmitOrderView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "SubmitOrderView.h"

@interface SubmitOrderView()
@property (nonatomic , strong) UILabel *moneyLabel;
@property (nonatomic , strong) UIButton *payButton;
@end

@implementation SubmitOrderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColorfff;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(13);
        make.centerY.equalTo(self);
    }];
    
    [self.payButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.width.mas_equalTo(ScreenWidth/4);
        make.height.mas_equalTo(50);
    }];
}

- (UILabel *)moneyLabel
{
    if (!_moneyLabel) {
        _moneyLabel = [UILabel new];
        _moneyLabel.text = @"实付款: ¥777.00";
        _moneyLabel.font = UIFont15;
        _moneyLabel.attributedText = [JSCUtil getSumString:_moneyLabel.text withRange:[_moneyLabel.text rangeOfString:@"实付款"] withRangeFont:UIFont15 withOtherFont:UIFont15 WithOtherFontColor:UIColor495e withRangeColor:UIColor333];
        [self addSubview:_moneyLabel];
    }
    return _moneyLabel;
}

- (void)submit
{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

- (UIButton *)payButton
{
    if (!_payButton) {
        _payButton = [UIButton new];
        _payButton.backgroundColor = UIColor495e;
        [_payButton setTitle:@"提交订单" forState:0];
        [_payButton setTitleColor:UIColorfff forState:0];
        [_payButton addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
        [_payButton.titleLabel setFont:UIFont16];
        [self addSubview:_payButton];
    }
    return _payButton;
}


@end
