//
//  JSHomePageSectionZeroView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSHomePageSectionZeroView.h"
#import "GradientHelp.h"
@implementation JSHomePageSectionZeroView

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.backgroundColor = UIColorfff;
        [self setLayout];
    }
    return self;
}

- (void)setLayout
{
    NSArray *contentArr = @[@{@"image":@"icon_1",@"title":@"限时抢购",@"bottom":@"点击进入"},
                            @{@"image":@"icon_2",@"title":@"会员专区",@"bottom":@"点击进入"}];
    UIView *lastView;
    for (int i = 0; i<contentArr.count; i++) {
        NSDictionary *dic = contentArr[i];
        UIView *actionView = [UIView new];
        actionView.tag = i+100;
        actionView.userInteractionEnabled = YES;
        [actionView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
        actionView.backgroundColor = UIColorfff;
        [self addSubview:actionView];
        
        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self).offset(0);
            }else {
                make.left.equalTo(lastView.mas_right).offset(0);
            }
            make.top.equalTo(self).offset(5);
            make.width.mas_equalTo(ScreenWidth/2);
        }];
        
       
        
        UIImageView *topImage = [[UIImageView alloc] init];
        topImage.image = [UIImage imageNamed:dic[@"image"]];
        topImage.contentMode = UIViewContentModeScaleAspectFit;
        [actionView addSubview:topImage];
        [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(actionView).offset(12);
            make.right.equalTo(actionView).offset(-15);
        }];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(14, 6, 80, 25)];
//        label.textColor = UIColorfff;
        label.font = UIFont17;
        label.text = dic[@"title"];
        [actionView addSubview:label];
        if (i == 0) {


            [GradientHelp TextGradientview:label bgVIew:actionView gradientColors:@[(id)RGB(104, 193, 248).CGColor,(id)RGB(210, 143, 220).CGColor] gradientStartPoint:CGPointMake(0, 0)  endPoint:CGPointMake(0, 1) ];
        }else{
            [GradientHelp TextGradientview:label bgVIew:actionView gradientColors:@[(id)RGB(243, 136, 45).CGColor,(id)RGB(255, 171, 36).CGColor] gradientStartPoint:CGPointMake(0, 0)  endPoint:CGPointMake(0, 1) ];
        }
        

        
        UILabel *blabel = [UILabel new];
        blabel.textColor = UIColor999;
        blabel.font = UIFont12;
        blabel.text = dic[@"bottom"];
        [actionView addSubview:blabel];
        [blabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(actionView).offset(30*AdapterScal);
            make.left.equalTo(actionView).offset(14);
            make.bottom.equalTo(actionView.mas_bottom).offset(-10*AdapterScal);
        }];
        
        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-10);
        }];
        
        lastView = actionView;
    }
}

- (void)tapAction:(UITapGestureRecognizer *)Ges
{
    
    if (self.clickBlock) {
        self.clickBlock(Ges.view.tag);
    }
    
}
@end
