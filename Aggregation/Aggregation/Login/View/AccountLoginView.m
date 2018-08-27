//
//  AccountLoginView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "AccountLoginView.h"
#import "JTextField.h"
@interface AccountLoginView()<UITextFieldDelegate>
{
    BOOL show;
}
@property (nonatomic , strong) JTextField  *nameText;
@property (nonatomic , strong) JTextField  *passwordText;
@end

@implementation AccountLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorfff;
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
    
    [self.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telLbl);
        make.right.equalTo(self).offset(-25*AdapterScal);
        make.top.equalTo(telLbl.mas_bottom).offset(15*AdapterScal);
    }];
    
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColore5e5;
    [self addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nameText);
        make.top.equalTo(self.nameText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *pwdLbl = [UILabel new];
    pwdLbl.text = @"密码";
    pwdLbl.font = UIFont13;
    pwdLbl.textColor = UIColor333;
    [self addSubview:pwdLbl];
    [pwdLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview.mas_bottom).offset(15*AdapterScal);
        make.left.equalTo(self).offset(25*AdapterScal);
//        make.bottom.equalTo(self);
    }];
    
    UIButton *button = [UIButton new];
    [button setTitle:@"显示" forState:0];
    [button setTitleColor:UIColor333 forState:0];
    [button.titleLabel setFont:UIFont13];
    [button setTitle:@"隐藏" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(controlPwdShow:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.nameText);
        make.centerY.equalTo(pwdLbl);
    }];

    [self.passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdLbl.mas_bottom).offset(15*AdapterScal);
        make.right.equalTo(self).offset(-25*AdapterScal);
        make.left.equalTo(pwdLbl);
    }];


    UIView *lineview2 = [UIView new];
    lineview2.backgroundColor = UIColore5e5;
    [self addSubview:lineview2];
    [lineview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.passwordText);
        make.top.equalTo(self.passwordText.mas_bottom).offset(10*AdapterScal);
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
        make.left.right.equalTo(self.passwordText);
        make.height.mas_equalTo(44*AdapterScal);
    }];
    
    UIButton *createbutton = [UIButton new];
    [createbutton setTitle:@"创建新账号" forState:0];
    [createbutton setTitleColor:UIColor495e forState:0];
    [createbutton.titleLabel setFont:UIFont12];
    createbutton.tag = 102;
    [createbutton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:createbutton];
    [createbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(login.mas_bottom).offset(10*AdapterScal);
        make.left.equalTo(self.passwordText);
    }];
    
    UIButton *forgetbutton = [UIButton new];
    [forgetbutton setTitle:@"忘记密码" forState:0];
    [forgetbutton setTitleColor:UIColor495e forState:0];
    [forgetbutton.titleLabel setFont:UIFont12];
    forgetbutton.tag = 103;
    [forgetbutton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:forgetbutton];
    [forgetbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(login.mas_bottom).offset(10*AdapterScal);
        make.right.equalTo(self.passwordText);
        make.bottom.equalTo(self).offset(-10*AdapterScal);
    }];
}

- (void)controlPwdShow:(UIButton*)button
{
    button.selected = !button.selected;
    show = !show;
    if (show) {
        self.passwordText.secureTextEntry = NO;
    }else{
        self.passwordText.secureTextEntry = YES;
    }
}

- (void)clickAction:(UIButton *)button
{
    if (self.clickBlock) {
        self.clickBlock(button.tag,self.nameText.text,self.passwordText.text);
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (JTextField *)nameText
{
    if (!_nameText) {
        _nameText = [JTextField new];
        _nameText.placeholder = @"请输入账号";
        _nameText.textColor = UIColor999;
        _nameText.jing_placeholderFont = UIFont14;
        _nameText.font = UIFont14;
        _nameText.returnKeyType = UIReturnKeyDone;
        _nameText.delegate = self;
        [self addSubview:self.nameText];
    }
    return _nameText;
}

- (JTextField *)passwordText
{
    if (!_passwordText) {
        _passwordText = [JTextField new];
        _passwordText.placeholder = @"请输入密码";
        _passwordText.textColor = UIColor999;
        _passwordText.jing_placeholderFont = UIFont14;
        _passwordText.font = UIFont14;
        _passwordText.returnKeyType = UIReturnKeyDone;
        _passwordText.secureTextEntry = YES;
        _passwordText.delegate = self;
        [self addSubview:self.passwordText];
    }
    return _passwordText;
}


@end
