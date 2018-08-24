//
//  JSGoodsDetailView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSGoodsDetailView.h"
#import "UnderLineButton.h"
@interface JSGoodsDetailView()
@property (nonatomic , strong) UILabel *goodsLabel;
@property (nonatomic , strong) UILabel *priceLabel;
@property (nonatomic , strong) UILabel *orgPriceLabel;
@property (nonatomic , strong) UILabel *salesLabel;
@property (nonatomic , strong) UILabel *numLabel;
@end

@implementation JSGoodsDetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(-3, -3);
        self.layer.shadowOpacity = 0.6;
        self.layer.shadowRadius = 5;
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews
{
    [self addSubview:self.goodsLabel];
    [self.goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.top.equalTo(self).offset(12*AdapterScal);
        make.right.equalTo(self).offset(-14);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.top.equalTo(self.goodsLabel.mas_bottom).offset(14*AdapterScal);
    }];
    
    [self.orgPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel.mas_right).offset(12);
        make.centerY.equalTo(self.priceLabel);
    }];
    
    [self.salesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.goodsLabel);
        make.centerY.equalTo(self.priceLabel);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColorf4f4;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(34);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(14*AdapterScal);
    }];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel);
        make.centerY.equalTo(lineView);
    }];
    UIView *lastView;
    NSArray *arr = @[@"图文详情",@"规格参数"];
    for (int i = 0; i<arr.count; i++) {
        UnderLineButton *button = [UnderLineButton new];
        button.lineView.backgroundColor = UIColor4a58;
        button.l_width = 50;
        [button setTitle:arr[i] forState:0];
        [button setTitleColor:UIColor666 forState:0];
        [button setBackgroundColor:UIColorfff];
        [button setTitleColor:UIColor4a58 forState:UIControlStateSelected];
        button.tag = i+200;
        [self addSubview:button];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self);
            }else{
                make.left.equalTo(lastView.mas_right);
            }
            make.top.equalTo(lineView.mas_bottom).offset(36*AdapterScal);
            make.width.mas_equalTo(ScreenWidth/2);
            make.height.mas_equalTo(45*AdapterScal);
            make.bottom.equalTo(self).offset(0*AdapterScal);
        }];
        lastView = button;
    }
    
    UnderLineButton *button = [self viewWithTag:200];
    [self click:button];
}

- (void)click:(UnderLineButton *)button
{
    if(!button.selected){
        button.selected = !button.selected;
        
        NSInteger tag = button.tag==200?201:200;
        
        UnderLineButton *otherButton = [self viewWithTag:tag];
        otherButton.selected = NO;
    }
    if (self.clickBlock) {
        self.clickBlock(button.tag);
    }
}

- (UILabel *)goodsLabel
{
    if (!_goodsLabel) {
        _goodsLabel = [UILabel new];
        _goodsLabel.font = UIFont14;
        _goodsLabel.textColor = UIColor333;
        _goodsLabel.text = @"123131";
        _goodsLabel.numberOfLines = 0;
        [self addSubview:_goodsLabel];
    }
    return _goodsLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = UIFont16;
        _priceLabel.textColor = UIColor4a58;
        _priceLabel.text = @"¥1000";
        _priceLabel.numberOfLines = 0;
        [self addSubview:_priceLabel];
    }
    return _priceLabel;
}

- (UILabel *)orgPriceLabel
{
    if (!_orgPriceLabel) {
        _orgPriceLabel = [UILabel new];
        _orgPriceLabel.font = UIFont12;
        _orgPriceLabel.text = @"¥1000";
        _orgPriceLabel.textColor = UIColor999;
        [self addSubview:_orgPriceLabel];
    }
    return _orgPriceLabel;
}

- (UILabel *)salesLabel
{
    if (!_salesLabel) {
        _salesLabel = [UILabel new];
        _salesLabel.font = UIFont12;
        _salesLabel.text = @"销量:1000";
        _salesLabel.textColor = UIColor666;
        [self addSubview:_salesLabel];
    }
    return _salesLabel;
}

- (UILabel *)numLabel
{
    if (!_numLabel) {
        _numLabel = [UILabel new];
        _numLabel.textColor = UIColor666;
        _numLabel.font = UIFont12;
        _numLabel.text = @"侵害山东黄金爱神的箭卡死就等哈就可视对讲卡萨丁";
        [self addSubview:_numLabel];
    }
    return _numLabel;
}
@end
