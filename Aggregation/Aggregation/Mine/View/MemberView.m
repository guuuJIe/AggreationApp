//
//  MemberView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "MemberView.h"
@interface MemberView()
@property (nonatomic , strong) UILabel *companyLabel;
@property (nonatomic , strong) UILabel *timelabel;

@end

@implementation MemberView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
       
        [self addView];
    }
    return self;
}

- (void)addView
{
    [self.companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(12*AdapterScal);
        make.left.equalTo(self).offset(0);
        make.width.mas_equalTo(180*AdapterScal);
    }];
    
    UIImageView *iconImage = [[UIImageView alloc] init];
    iconImage.image = [UIImage imageNamed:@"member_icon_1"];
    iconImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:iconImage];
    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.companyLabel.mas_right).offset(14*AdapterScal);
        make.centerY.equalTo(self.companyLabel);
    }];
    
    [self.timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.companyLabel.mas_bottom).offset(12*AdapterScal);
        make.left.equalTo(self.companyLabel);
        make.bottom.equalTo(self).offset(-5*AdapterScal);
    }];
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickAction)]];
}

- (void)clickAction
{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

- (UILabel *)companyLabel
{
    if (!_companyLabel) {
        _companyLabel = [UILabel new];
        _companyLabel.text = @"酒商酒汇网络科技哟徐爱你公司";
       
        _companyLabel.font = [UIFont boldSystemFontOfSize:16];
        _companyLabel.textColor = UIColorfff;
      
        [self addSubview:_companyLabel];
    }
    return _companyLabel;
}

- (UILabel *)timelabel
{
    if (!_timelabel) {
        _timelabel = [UILabel new];
        _timelabel.text = @"会员到期时间:2018-12-07";
        _timelabel.font = UIFont14;
        _timelabel.textColor = UIColorfff;
       
        [self addSubview:_timelabel];
    }
    return _timelabel;
}
@end
