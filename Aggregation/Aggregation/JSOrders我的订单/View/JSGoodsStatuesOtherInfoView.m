//
//  JSGoodsStatuesOtherInfoView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSGoodsStatuesOtherInfoView.h"

@implementation JSGoodsStatuesOtherInfoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UILabel *iconLabel = [UILabel new];
    iconLabel.text = @"\U0000e737";
    iconLabel.font = iconFontSize(23);
    [self addSubview:iconLabel];
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(12);
        make.left.equalTo(self).offset(12);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    
    UILabel *Label1 = [UILabel new];
    Label1.text = @"其他信息";
    Label1.textColor = UIColor333;
    Label1.font = UIFont14;
    [self addSubview:Label1];
    [Label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconLabel);
        make.left.equalTo(iconLabel.mas_right).offset(6);
    }];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth - 100, 1)];
    [JSCUtil drawLineByUIImageView:image];
    [self addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(Label1.mas_bottom).offset(16);
        make.left.equalTo(Label1);
        make.right.equalTo(self).offset(-14);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *adresslabel = [UILabel new];
    adresslabel.text = @"配送地址";
    adresslabel.textColor = UIColor999;
    adresslabel.font = UIFont13;
    [self addSubview:adresslabel];
    [adresslabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconLabel);
        make.top.equalTo(image.mas_bottom).offset(12);
    }];
    
    UILabel *adressValue = [UILabel new];
    adressValue.text = @"收货信息  秒抢 4556435646收货信息  秒抢 4556435646";
    adressValue.textColor = UIColor333;
    adressValue.font = UIFont14;
    adressValue.numberOfLines = 0;
    
    [self addSubview:adressValue];
    [adressValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(adresslabel.mas_right).offset(8);
        make.right.equalTo(self).offset(-16);
//        make.centerY.equalTo(adresslabel);
        make.top.equalTo(image.mas_bottom).offset(12*AdapterScal);
    }];
    
    UILabel *infolabel = [UILabel new];
    infolabel.text = @"收货信息  秒抢 4556435646";
    infolabel.textColor = UIColor999;
    infolabel.attributedText = [JSCUtil getSumString:infolabel.text withRange:[infolabel.text rangeOfString:@"收货信息"] withRangeFont:UIFont12 withOtherFont:UIFont14 WithOtherFontColor:UIColor333 withRangeColor:UIColor999];
    infolabel.font = UIFont13;
    [self addSubview:infolabel];
    [infolabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconLabel);
        make.top.equalTo(adressValue.mas_bottom).offset(12);
    }];
    
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth - 100, 1)];
    [JSCUtil drawLineByUIImageView:image2];
    [self addSubview:image2];
    [image2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(infolabel.mas_bottom).offset(16);
        make.left.equalTo(Label1);
        make.right.equalTo(self).offset(-14);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *orderlabel = [UILabel new];
    orderlabel.text = @"收货信息  秒抢 4556435646";
    orderlabel.textColor = UIColor999;
    orderlabel.attributedText = [JSCUtil getSumString:infolabel.text withRange:[infolabel.text rangeOfString:@"收货信息"] withRangeFont:UIFont12 withOtherFont:UIFont14 WithOtherFontColor:UIColor333 withRangeColor:UIColor999];
    orderlabel.font = UIFont13;
    [self addSubview:orderlabel];
    [orderlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconLabel);
        make.top.equalTo(image2.mas_bottom).offset(12);
    }];
    
    UILabel *timelabel = [UILabel new];
    timelabel.text = @"收货信息  秒抢 4556435646";
    timelabel.textColor = UIColor999;
    timelabel.attributedText = [JSCUtil getSumString:infolabel.text withRange:[infolabel.text rangeOfString:@"收货信息"] withRangeFont:UIFont12 withOtherFont:UIFont14 WithOtherFontColor:UIColor333 withRangeColor:UIColor999];
    timelabel.font = UIFont13;
    [self addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconLabel);
        make.top.equalTo(orderlabel.mas_bottom).offset(12);
        make.bottom.equalTo(self).offset(-12*AdapterScal);
    }];
    
}


@end
