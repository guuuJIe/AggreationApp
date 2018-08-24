//
//  GoodsStautesOperationView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "GoodsStautesOperationView.h"

@implementation GoodsStautesOperationView



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColorfafa;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    self.userInteractionEnabled = YES;
}

- (NSDictionary *)createPurchasingButton
{
    NSDictionary *dic;
    
//    if (model.orderstatus == 3) {
        dic = @{
                @"title":@"申请退货",
                @"flag":@"notice"
                };
        [self.btnModelArray addObject:dic];
//    }
    
    return  dic;
    
}

-(void)setOrderOption
{
    
    _btnModelArray = [NSMutableArray new];
    NSDictionary *dic;
    dic = [self createPurchasingButton];
    UIView *lastView;
    for (UIView *view in self.subviews) {
        if ([view isMemberOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
    
    for (int i = 0; i < self.btnModelArray.count; i++) {
        NSDictionary *dic = self.btnModelArray[i];
        UIButton *button = [UIButton new];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:dic[@"title"] forState:UIControlStateNormal];
        [button setTitleColor:UIColor666 forState:UIControlStateNormal];
        button.titleLabel.font = UIFont14;
        button.layer.borderColor = UIColor666.CGColor;
        button.layer.borderWidth = 1;
        button.layer.cornerRadius = 2;
        [button setTitle:dic[@"flag"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(160/2, 60/2));
            make.centerY.equalTo(self);
            if(i == 0){
                make.right.equalTo(self).offset(-12);
            }else{
                make.right.equalTo(lastView.mas_left).offset(-30);
            }
        }];
        lastView = button;
    }
}

-(void)buttonClick:(UIButton *)button{
    self.orderHandleBlock([button titleForState:UIControlStateSelected]);
}

@end
