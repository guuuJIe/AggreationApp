//
//  WithdrawPopView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "WithdrawPopView.h"
#import "WithdrawDetailTableViewCell.h"

@interface WithdrawPopView()<UITextFieldDelegate>
@property (nonatomic , strong) UITextField *wechatText;
@property (nonatomic , strong) UIView *bgview;
@end

@implementation WithdrawPopView

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
        make.size.mas_equalTo(CGSizeMake(538/2*AdapterScal, 420/2*AdapterScal));
    }];
    self.bgview = bgView;
    UILabel *xLabel = [UILabel new];
    xLabel.text = @"\U0000e724";
    xLabel.textColor = UIColor666;
    xLabel.font = iconFontSize(28);
    xLabel.userInteractionEnabled = YES;
    [xLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cha)]];
    [bgView addSubview:xLabel];
    [xLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(10*AdapterScal);
        make.right.equalTo(bgView).offset(-10*AdapterScal);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    
    UILabel *wechatlbl = [[UILabel alloc] init];
    wechatlbl.text = @"微信号:";
    wechatlbl.font = UIFont16;
    wechatlbl.textColor = UIColor333;
    [bgView addSubview:wechatlbl];
    [wechatlbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(136/2*AdapterScal);
        make.left.equalTo(bgView).offset(25*AdapterScal);
//        make.width.mas_equalTo(30);
    }];
    
    UITextField *wechattext = [[UITextField alloc] init];
    wechattext.font = UIFont16;
    wechattext.textColor = UIColor333;
//    wechattext.backgroundColor = UIColor4a58;
    [bgView addSubview:wechattext];
    wechattext.delegate = self;
    self.wechatText = wechattext;
    [wechattext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(wechatlbl);
        make.left.equalTo(wechatlbl.mas_right).offset(5*AdapterScal);
//        make.right.equalTo(bgView).offset(-10*AdapterScal);
//        make.height.mas_equalTo(30);
        make.size.mas_equalTo(CGSizeMake(150*AdapterScal, 30));
    }];
    
    UIView *lineview = [[UIView alloc] init];
    lineview.backgroundColor = UIColore5e5;
    [bgView addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wechattext.mas_bottom);
        make.left.right.equalTo(wechattext);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"(客服会加你微信,通过转账的形式给您)";
    label.textColor = UIColor666;
    label.font = UIFont12;
    [bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wechatlbl).offset(5*AdapterScal);
        make.top.equalTo(lineview.mas_bottom).offset(16*AdapterScal);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"提交" forState:0];
    [button.titleLabel setFont:UIFont16];
    [button setTitleColor:UIColorfff forState:0];
    [button setBackgroundColor:[UIColor colorWithHexString:@"#ff6779"]];
    [button addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(bgView);
        make.height.mas_equalTo(44);
    }];
    [button layoutIfNeeded];
    
    //这里设置的是左上和左下角
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:button.bounds   byRoundingCorners:UIRectCornerBottomLeft |    UIRectCornerBottomRight    cornerRadii:CGSizeMake(7, 7)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = button.bounds;
    maskLayer.path = maskPath.CGPath;
    button.layer.mask = maskLayer;
    
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    __block CGRect curFrame = self.bgview.frame;
    [UIView animateWithDuration:0.3 animations:^{
        curFrame.origin.y -= 80;
        self.bgview.frame = curFrame;
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    __block CGRect curFrame = self.bgview.frame;
    [UIView animateWithDuration:0.3 animations:^{
        curFrame.origin.y += 80;
        self.bgview.frame = curFrame;
    }];
}


- (void)cha
{
    [self hide];
}

- (void)submit
{
    if (self.wechatText.text.length <= 0) {
        
    }
    if (self.clickBlock) {
        self.clickBlock(self.wechatText.text);
    }
    [self hide];
}
@end
