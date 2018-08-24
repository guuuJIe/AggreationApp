//
//  MineConsumptionView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "MineConsumptionView.h"
#import "GradientHelp.h"
@interface MineConsumptionView()
@property (nonatomic , strong) UILabel *consumpelabel;
@property (nonatomic , strong) UILabel *saveLabel;

@end

@implementation MineConsumptionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 4.0f;
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 0.6;
        self.layer.shadowRadius = 7;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UIView *bgview = [[UIView alloc] init];
    [self addSubview:bgview];
    bgview.backgroundColor = [UIColor whiteColor];
    bgview.layer.cornerRadius = 4;
    bgview.layer.masksToBounds = YES;
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UILabel *orderLbl = [UILabel new];
    orderLbl.textColor = UIColor000;
    orderLbl.font = [UIFont boldSystemFontOfSize:16];
    orderLbl.text = @"我的消费";
    [self addSubview:orderLbl];
    [orderLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(12*AdapterScal);
        make.left.equalTo(self).offset(18*AdapterScal);
    }];
//    [orderLbl layoutIfNeeded];
    
    self.consumpelabel = [[UILabel alloc] initWithFrame:CGRectMake(50*AdapterScal, 45*AdapterScal, 60, 25)];
    self.consumpelabel.text = @"¥1111";
    self.consumpelabel.font = UIFont24;
    [self addSubview:self.consumpelabel];
    [GradientHelp TextGradientview:self.consumpelabel bgVIew:bgview gradientColors:@[(id)RGB(255, 175, 114).CGColor,(id)RGB(255, 69, 89).CGColor] gradientStartPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
    

    UILabel *label = [UILabel new];
    label.textColor = UIColor666;
    label.font = UIFont12;
    label.text = @"消费金额";
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(80*AdapterScal);
        make.left.equalTo(self).offset(50*AdapterScal);
        make.bottom.equalTo(self).offset(-20*AdapterScal);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = UIColore5e5;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(bgview);
        make.width.mas_equalTo(JLineHeight);
        make.top.equalTo(bgview).offset(30*AdapterScal);
        make.bottom.equalTo(bgview).offset(-20*AdapterScal);
    }];
    
    [self.saveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(45*AdapterScal);
        make.right.equalTo(self).offset(-50*AdapterScal);
    }];
    
    UILabel *label2 = [UILabel new];
    label2.text = @"酒商酒汇已为您节省";
    label2.font = UIFont12;
    label2.textColor = UIColor666;
    [self addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.saveLabel);
        make.centerY.equalTo(label);
        make.bottom.equalTo(self).offset(-20*AdapterScal);
    }];
    
}

- (UILabel *)consumpelabel
{
    if (!_consumpelabel) {
        _consumpelabel = [UILabel new];
        _consumpelabel.font = UIFont14;
        _consumpelabel.textColor = UIColor666;
        _consumpelabel.text = @"¥1111";
//        _consumpelabel.attributedText = [JSCUtil getSumString:<#(NSString *)#> withRange:<#(NSRange)#> withRangeFont:<#(UIFont *)#> withOtherFont:<#(UIFont *)#> WithOtherFontColor:<#(UIColor *)#> withRangeColor:<#(UIColor *)#>]
        [self addSubview:_consumpelabel];
    }
    return _consumpelabel;
}

- (UILabel *)saveLabel
{
    if (!_saveLabel) {
        _saveLabel = [UILabel new];
        _saveLabel.font = UIFont14;
        _saveLabel.textColor = UIColor666;
        _saveLabel.text = @"¥999";
        _saveLabel.attributedText = [JSCUtil getSumString:_saveLabel.text withRange:[_saveLabel.text rangeOfString:@"¥"] withRangeFont:UIFont14 withOtherFont:UIFont24 WithOtherFontColor:UIColor4a58 withRangeColor:UIColor4a58];
        [self addSubview:_saveLabel];
    }
    return _saveLabel;
}
@end
