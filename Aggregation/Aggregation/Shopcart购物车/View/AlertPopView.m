//
//  AlertPopView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "AlertPopView.h"

@implementation AlertPopView

- (instancetype)init
{
    self = [super init];
    if (self) {
       
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    self.type = MMPopupTypeCustom;
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, ScreenHeight));
    }];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = UIColorfff;
    bgView.layer.cornerRadius = 8;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(640/2*AdapterScal, 538/2*AdapterScal));
    }];
    
    UIImageView *iconimage = [UIImageView new];
    iconimage.image = [UIImage imageNamed:@"submitSucess_image"];
    iconimage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:iconimage];
    [iconimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(20*AdapterScal);
        make.centerX.equalTo(bgView);
    }];
    
    UILabel *messageone = [UILabel new];
    messageone.text = @"提交成功";
    messageone.textColor = UIColor000;
    messageone.font = UIFont18;
    [self addSubview:messageone];
    [messageone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconimage.mas_bottom).offset(15*AdapterScal);
        make.centerX.equalTo(bgView);
    }];
    
    UILabel *messagetwo = [UILabel new];
    messagetwo.text = @"请耐心等待发货~~";
    messagetwo.textColor = UIColor666;
    messagetwo.font = UIFont16;
    [self addSubview:messagetwo];
    [messagetwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(messageone.mas_bottom).offset(6*AdapterScal);
        make.centerX.equalTo(bgView);
    }];
    
    UILabel *xLabel = [UILabel new];
    xLabel.text = @"\U0000e724";
    xLabel.textColor = UIColor666;
    xLabel.font = iconFontSize(28);
    [self addSubview:xLabel];
    [xLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(15*AdapterScal);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideBg)]];
}

- (void)hideBg
{
   
    [self hide];
    
//    [UIView animateWithDuration:1 animations:^{
//        
//    }];
    
    
}
@end
