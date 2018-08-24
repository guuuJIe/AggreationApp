//
//  ShareView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

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
        make.size.mas_equalTo(CGSizeMake(536/2*AdapterScal, 420/2*AdapterScal));
    }];
    
    
    NSArray *contentArr = @[@{@"image":@"member_icon_10",@"label":@"微信"},@{@"image":@"member_icon_9",@"label":@"朋友圈"}];
    
    UIView *lastView;
    for (int i = 0; i<contentArr.count; i++) {
        NSDictionary *dic = contentArr[i];
        UIView *actionView = [UIView new];
        actionView.tag = i+100;
        actionView.userInteractionEnabled = YES;
        [actionView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
       
        [bgView addSubview:actionView];
//        actionView.backgroundColor = UIColorf4f4;
        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(bgView).offset(0);
            }else {
                make.left.equalTo(lastView.mas_right).offset(0);
            }
            make.top.equalTo(bgView).offset(5);
            make.width.mas_equalTo(536/2*AdapterScal/2);
            make.bottom.equalTo(bgView);
        }];
        
      
        
        UIImageView *topImage = [[UIImageView alloc] init];
        topImage.image = [UIImage imageNamed:dic[@"image"]];
        topImage.contentMode = UIViewContentModeScaleAspectFit;
        [actionView addSubview:topImage];
        if (i==0) {
            [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(actionView).offset(-10*AdapterScal);
                make.right.equalTo(actionView).offset(-30*AdapterScal);
            }];
        }else{
            [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(actionView).offset(-10*AdapterScal);
                make.left.equalTo(actionView).offset(30*AdapterScal);
            }];
        }
        
        
        UILabel *label = [UILabel new];
        label.textColor = UIColor333;
        label.font = UIFont16;
        label.text = dic[@"label"];
        [actionView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(topImage.mas_bottom).offset(6);
            make.centerX.equalTo(topImage);
//            make.bottom.equalTo(actionView.mas_bottom);
        }];
//        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.equalTo(self.mas_bottom).offset(-10*AdapterScal);
//        }];
        
        lastView = actionView;
    }
    
    UILabel *xLabel = [UILabel new];
    xLabel.text = @"\U0000e724";
    xLabel.textColor = UIColor666;
    xLabel.font = iconFontSize(35);
    [self addSubview:xLabel];
    [xLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(15*AdapterScal);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidebg)]];
}

- (void)hidebg
{
    [self hide];
}

- (void)tapAction:(UITapGestureRecognizer *)Ges
{
    
    if (self.clickBlock) {
        self.clickBlock(Ges.view.tag);
    }
    
}

@end
