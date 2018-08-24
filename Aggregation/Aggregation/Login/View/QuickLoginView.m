//
//  QuickLoginView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "QuickLoginView.h"
#import "JTextField.h"
#import "LoginCodeBtn.h"

@interface QuickLoginView()<UITextFieldDelegate>

@property (nonatomic , strong) JTextField *accountText;
@property (nonatomic , strong) JTextField *codeText;
@property (nonatomic , strong) LoginCodeBtn *codeButton;


@end

@implementation QuickLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UILabel *telLbl = [UILabel new];
    telLbl.text = @"手机号";
    telLbl.font = UIFont13;
    telLbl.textColor = UIColor333;
    [self addSubview:telLbl];
    [telLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5*AdapterScal);
        make.left.equalTo(self).offset(25*AdapterScal);
    }];
    
    UILabel *Label = [UILabel new];
    Label.text = @"+86";
    Label.font = UIFont14;
    Label.backgroundColor = UIColor495e;
    Label.textColor = UIColorfff;
    Label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:Label];
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(telLbl.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(telLbl);
        make.size.mas_equalTo(CGSizeMake(32, 20));
    }];
    
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Label.mas_right).offset(5*AdapterScal);
        make.right.equalTo(self).offset(-25*AdapterScal);
        make.centerY.equalTo(Label);
    }];
    
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColore5e5;
    [self addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.accountText);
        make.left.equalTo(Label); make.top.equalTo(self.accountText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *pwdLbl = [UILabel new];
    pwdLbl.text = @"验证码";
    pwdLbl.font = UIFont13;
    pwdLbl.textColor = UIColor333;
    [self addSubview:pwdLbl];
    [pwdLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview.mas_bottom).offset(15*AdapterScal);
        make.left.equalTo(self).offset(25*AdapterScal);
     
    }];
    
    [self.codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdLbl);
        make.width.mas_equalTo(120);
        make.top.equalTo(pwdLbl.mas_bottom).offset(15*AdapterScal);
    }];
    
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineview);
        make.centerY.equalTo(self.codeText);
        make.size.mas_equalTo(CGSizeMake(71, 23));
    }];
    
    UIView *lineview2 = [UIView new];
    lineview2.backgroundColor = UIColore5e5;
    [self addSubview:lineview2];
    [lineview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.accountText);
        make.left.equalTo(Label);
        make.top.equalTo(self.codeText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
        
    }];
    
    UIButton *login = [UIButton new];
    [login setTitle:@"登录" forState:0];
    [login setTitleColor:UIColorfff forState:0];
    [login setBackgroundColor:UIColor495e];
    login.layer.cornerRadius =2;
    login.layer.masksToBounds = YES;
    login.tag = 101;
    [login addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:login];
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview2.mas_bottom).offset(40*AdapterScal);
        make.left.right.equalTo(lineview2);
        make.height.mas_equalTo(44*AdapterScal);
        make.bottom.equalTo(self).offset(-5*AdapterScal);
    }];
}


- (void)clickAction:(UIButton *)button
{
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (JTextField *)accountText
{
    if (!_accountText) {
        _accountText = [JTextField new];
        _accountText.placeholder = @"请输入账号";
        _accountText.textColor = UIColor999;
        _accountText.jing_placeholderFont = UIFont14;
        _accountText.font = UIFont14;
        _accountText.returnKeyType = UIReturnKeyDone;
        _accountText.delegate = self;
        [self addSubview:self.accountText];
    }
    return _accountText;
}

- (JTextField *)codeText
{
    if (!_codeText) {
        _codeText = [JTextField new];
        _codeText.placeholder = @"请输入验证码";
        _codeText.textColor = UIColor999;
        _codeText.jing_placeholderFont = UIFont14;
        _codeText.font = UIFont14;
        _codeText.returnKeyType = UIReturnKeyDone;
        _codeText.delegate = self;
        [self addSubview:self.codeText];
    }
    return _codeText;
}

-(LoginCodeBtn *)codeButton
{
    if (!_codeButton)
    {
        _codeButton = [LoginCodeBtn new];
        [_codeButton setBackgroundColor:UIColor495e];
        [self addSubview:_codeButton];
    }
    return _codeButton;
}
@end
