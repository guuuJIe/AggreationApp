//
//  DeadlineView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "DeadlineView.h"

@implementation DeadlineView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColorfff;
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)]];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UIImageView *icon = [UIImageView new];
    icon.image = [UIImage imageNamed:@"member_icon_1"];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.top.equalTo(self).offset(15*AdapterScal);
        make.bottom.equalTo(self).offset(-20*AdapterScal);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = UIColor999;
    titleLabel.font = UIFont12;
    titleLabel.text = @"会员到期时间";
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(12);
        make.left.equalTo(icon.mas_right).offset(10);
    }];
    
    UILabel *timeLabel = [UILabel new];
    timeLabel.textColor = UIColor333;
    timeLabel.font = UIFont14;
    timeLabel.text = @"2018.12.07";
    [self addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(6);
        make.left.equalTo(titleLabel).offset(0);
    }];
    
    UILabel *moneyLabel = [UILabel new];
    moneyLabel.textColor = UIColor333;
    moneyLabel.font = UIFont14;
    moneyLabel.text = @"已为您节省: ¥999";
    moneyLabel.attributedText = [JSCUtil getSumString:moneyLabel.text withRange:[moneyLabel.text rangeOfString:@" ¥999"] withRangeFont:UIFont14 withOtherFont:UIFont12 WithOtherFontColor:UIColor666 withRangeColor:UIColor4a58];
    [self addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-20);
    }];
    
    UIImageView *arrowImage = [[UIImageView alloc] init];
    arrowImage.image = [UIImage imageNamed:@"member_icon_5"];
    [self addSubview:arrowImage];
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(self);
    }];
}

- (void)click
{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

@end
