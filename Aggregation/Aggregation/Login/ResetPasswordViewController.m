//
//  ResetPasswordViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ResetPasswordViewController.h"
#import "JTextField.h"
#import "LoginCodeBtn.h"
@interface ResetPasswordViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) JTextField  *nameText;
@property (nonatomic , strong) JTextField  *passwordText;
@property (nonatomic , strong) JTextField  *codeText;
@property (nonatomic , strong) LoginCodeBtn *codeButton;
@end

@implementation ResetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLayout];
}

- (void)setLayout
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
    [self.scrollView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView).offset(53*AdapterScal+StauesBarHeight);
        make.left.equalTo(self.scrollView).offset(20*AdapterScal);
    }];
    
    UILabel *telLbl = [UILabel new];
    telLbl.text = @"密码";
    telLbl.font = UIFont13;
    telLbl.textColor = UIColor333;
    [self.scrollView addSubview:telLbl];
    [telLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(51*AdapterScal);
        make.left.equalTo(self.scrollView).offset(20*AdapterScal);
    }];
//
    [self.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(telLbl.mas_bottom).offset(15*AdapterScal);
    }];
    
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nameText);
        make.top.equalTo(self.nameText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];

    UILabel *pwdLbl = [UILabel new];
    pwdLbl.text = @"确认密码";
    pwdLbl.font = UIFont13;
    pwdLbl.textColor = UIColor333;
    [self.scrollView addSubview:pwdLbl];
    [pwdLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(20*AdapterScal);
    }];

    [self.passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(pwdLbl.mas_bottom).offset(15*AdapterScal);
    }];
//
    UIView *lineview2 = [UIView new];
    lineview2.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview2];
    [lineview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.passwordText);
        make.top.equalTo(self.passwordText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
//
//
    UILabel *codeLbl = [UILabel new];
    codeLbl.text = @"验证码";
    codeLbl.font = UIFont13;
    codeLbl.textColor = UIColor333;
    [self.scrollView addSubview:codeLbl];
    [codeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview2.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(20*AdapterScal);
    }];
//
    [self.codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(codeLbl.mas_bottom).offset(15*AdapterScal);
    }];
//
    UIView *lineview3 = [UIView new];
    lineview3.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview3];
    [lineview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.codeText);
        make.top.equalTo(self.codeText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
//
//
    UIButton *login = [UIButton new];
    [login setTitle:@"确定" forState:0];
    [login setTitleColor:UIColorfff forState:0];
    [login setBackgroundColor:UIColor495e];
    login.layer.cornerRadius =2;
    login.layer.masksToBounds = YES;
    [login addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:login];
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview3.mas_bottom).offset(40*AdapterScal);
        make.left.right.equalTo(self.passwordText);
        make.height.mas_equalTo(44*AdapterScal);
    }];
    
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineview3);
        make.centerY.equalTo(self.codeText);
        make.size.mas_equalTo(CGSizeMake(71, 23));
    }];
}

- (void)clickAction:(UIButton *)button
{
    
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"设置密码";
    
    }
    return _titleLabel;
}


- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        [_scrollView setContentSize:CGSizeMake(ScreenWidth, ScreenHeight)];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (JTextField *)nameText
{
    if (!_nameText) {
        _nameText = [JTextField new];
        _nameText.placeholder = @"密码";
        _nameText.textColor = UIColor999;
        _nameText.jing_placeholderFont = UIFont14;
        _nameText.font = UIFont14;
        _nameText.returnKeyType = UIReturnKeyDone;
        _nameText.delegate = self;
        [self.scrollView addSubview:_nameText];
    }
    return _nameText;
}

- (JTextField *)passwordText
{
    if (!_passwordText) {
        _passwordText = [JTextField new];
        _passwordText.placeholder = @"确认密码";
        _passwordText.textColor = UIColor999;
        _passwordText.jing_placeholderFont = UIFont14;
        _passwordText.font = UIFont14;
        _passwordText.returnKeyType = UIReturnKeyDone;
        _passwordText.delegate = self;
        [self.scrollView addSubview:_passwordText];
    }
    return _passwordText;
}

- (JTextField *)codeText
{
    if (!_codeText) {
        _codeText = [JTextField new];
        _codeText.placeholder = @"验证码";
        _codeText.textColor = UIColor999;
        _codeText.jing_placeholderFont = UIFont14;
        _codeText.font = UIFont14;
        _codeText.returnKeyType = UIReturnKeyDone;
        _codeText.delegate = self;
        [self.scrollView addSubview:_codeText];
    }
    return _codeText;
}

-(LoginCodeBtn *)codeButton
{
    if (!_codeButton)
    {
        _codeButton = [LoginCodeBtn new];
        [_codeButton setBackgroundColor:UIColor495e];
        [self.scrollView addSubview:_codeButton];
    }
    return _codeButton;
}

@end
