//
//  NonMemberView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "NonMemberView.h"

@interface NonMemberView()
@property (nonatomic , strong) UILabel *companyLabel;
@property (nonatomic , strong) UILabel *permissionLabel;
@end

@implementation NonMemberView

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
        make.top.mas_equalTo(self).offset(14*AdapterScal);
        make.left.equalTo(self).offset(0);
        make.width.mas_equalTo(180*AdapterScal);
    }];
    
    [self.permissionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.companyLabel.mas_bottom).offset(12*AdapterScal);
        make.left.equalTo(self.companyLabel);
//        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(30);
        make.bottom.equalTo(self).offset(-14*AdapterScal);
    }];
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

- (UILabel *)permissionLabel
{
    if (!_permissionLabel) {
        _permissionLabel = [UILabel new];
        _permissionLabel.text = @"成为会员享受特权";
        _permissionLabel.backgroundColor = UIColorfff;
        _permissionLabel.font = UIFont14;
        _permissionLabel.textColor = UIColor495e;
        _permissionLabel.layer.cornerRadius = 15;
        _permissionLabel.layer.masksToBounds = YES;
        [self addSubview:_permissionLabel];
    }
    return _permissionLabel;
}
@end
