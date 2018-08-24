//
//  RebateView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "RebateView.h"
#import "UIView+Category.h"


@implementation RebateView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setLayout];
    }
    return self;
}

- (void)setLayout
{
    NSArray *contentArr = @[@{@"image":@"member_icon_3",@"money":@"¥1111",@"bottom":@"可提现返利"},@{@"image":@"member_icon_2",@"money":@"¥1111",@"bottom":@"今日返利"},@{@"image":@"member_icon_7",@"money":@"¥1111",@"bottom":@"总返利"}];
    UIView *lastView;
    for (int i = 0; i<contentArr.count; i++) {
        NSDictionary *dic = contentArr[i];
        UIView *actionView = [UIView new];
        actionView.tag = i+100;
        actionView.userInteractionEnabled = YES;
        [actionView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
        if (i == 0) {
            [actionView setBackgroundColor:RGB(255, 102, 123)];
        }else if (i== 1){
            [actionView setBackgroundColor:RGB(255, 191, 128)];
        }else{
            [actionView setBackgroundColor:RGB(132, 200, 252)];
        }
        [self addSubview:actionView];
        
        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self).offset(14);
            }else if (i == contentArr.count - 1){
                make.right.equalTo(self).offset(-14);
                make.left.equalTo(lastView.mas_right).offset(16);
            }else {
                make.left.equalTo(lastView.mas_right).offset(16);
            }
            make.top.equalTo(self).offset(5);
            make.width.mas_equalTo((ScreenWidth-60)/3);
        }];
        
        [actionView layoutIfNeeded];
        [actionView setCornerRadius:3 withShadow:YES withOpacity:0.6];
        
        UIImageView *topImage = [[UIImageView alloc] init];
        topImage.image = [UIImage imageNamed:dic[@"image"]];
        topImage.contentMode = UIViewContentModeScaleAspectFit;
        [actionView addSubview:topImage];
        [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(actionView).offset(6);
            make.left.equalTo(actionView).offset(3);
        }];
        
        UILabel *label = [UILabel new];
        label.textColor = UIColorfff;
        label.font = UIFont15;
        label.text = dic[@"money"];
        [actionView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(actionView);
        }];
        
        UILabel *blabel = [UILabel new];
        blabel.textColor = UIColorfff;
        blabel.font = UIFont15;
        blabel.text = dic[@"bottom"];
        [actionView addSubview:blabel];
        [blabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.mas_bottom).offset(2);
            make.centerX.equalTo(label);
            make.bottom.equalTo(actionView.mas_bottom).offset(-10*AdapterScal);
        }];

        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom).offset(-10*AdapterScal);
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
