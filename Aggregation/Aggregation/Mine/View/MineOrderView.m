//
//  MineOrderView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "MineOrderView.h"

@interface MineOrderView()
@property (nonatomic , strong) UILabel *moreLabel;
@end

@implementation MineOrderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 4.0f;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(-5, 10);
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowRadius = 8;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UIView *bgview = [[UIView alloc] init];
    [self addSubview:bgview];
    bgview.layer.cornerRadius = 4;
    bgview.layer.masksToBounds = YES;
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UILabel *orderLbl = [UILabel new];
    orderLbl.textColor = UIColor000;
    orderLbl.font = [UIFont boldSystemFontOfSize:16];
    orderLbl.text = @"我的订单";
    [self addSubview:orderLbl];
    [orderLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(12*AdapterScal);
        make.left.equalTo(self).offset(18*AdapterScal);
    }];
    
    [self.moreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-14*AdapterScal);
        make.centerY.equalTo(orderLbl);
    }];
    
    NSArray *datas = @[@{@"image":@"icon_mine1",@"text":@"待接单"},@{@"image":@"icon_mine2",@"text":@"待发货"},@{@"image":@"icon_mine3",@"text":@"待收货"},
            @{@"image":@"icon_mine4",@"text":@"待退货"}];
    
    UIView *lastView;
    for (int i = 0; i<datas.count; i++) {
        NSDictionary *dic = datas[i];
        UIView *actionView = [UIView new];
        actionView.tag = i+100;
        actionView.userInteractionEnabled = YES;
        [actionView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)]];
        actionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:actionView];
        [actionView mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self.mas_left);
                make.top.equalTo(orderLbl.mas_bottom).offset(18*AdapterScal);
            }else if (i == datas.count - 1){
                make.right.equalTo(self);
                make.left.equalTo(lastView.mas_right).offset(0);
                make.top.equalTo(orderLbl.mas_bottom).offset(20*AdapterScal);
            }else {
                make.top.equalTo(orderLbl.mas_bottom).offset(18*AdapterScal);
                make.left.equalTo(lastView.mas_right).offset(0);
            }
           
            make.width.mas_equalTo((ScreenWidth - 26*AdapterScal)/4);
            make.bottom.equalTo(self).offset(-20*AdapterScal);
        }];
        
        UIImageView *topView = [UIImageView new];
        topView.image = [UIImage imageNamed:dic[@"image"]];
        topView.contentMode = UIViewContentModeScaleAspectFit;
        [actionView addSubview:topView];
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(actionView);
            make.top.equalTo(actionView).offset(0*AdapterScal);
//            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        UILabel *bottomLabel = [UILabel new];
        bottomLabel.textColor = UIColor666;
        bottomLabel.font = UIFont12;
        bottomLabel.text = dic[@"text"];
        [actionView addSubview:bottomLabel];
        [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(actionView);
            make.top.equalTo(topView.mas_bottom).offset(3*AdapterScal);
            make.bottom.equalTo(actionView.mas_bottom).offset(-10*AdapterScal);
        }];
        
         lastView = actionView;
        
    }
    [self layoutIfNeeded];
}

- (void)tapAction:(UITapGestureRecognizer *)Ges
{
    if (self.clickBlock) {
        self.clickBlock(Ges.view.tag);
    }
}
- (UILabel *)moreLabel
{
    if (!_moreLabel) {
        _moreLabel = [UILabel new];
        _moreLabel.text = @"查看更多";
        _moreLabel.font = UIFont14;
        _moreLabel.textColor = UIColor666;
        [self addSubview:_moreLabel];
    }
    return _moreLabel;
}
@end
