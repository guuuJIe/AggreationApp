//
//  SetPasswordViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "SetPasswordViewController.h"
#import "JTextField.h"
#import "LoginCodeBtn.h"
#import "SetPasswordViewController.h"
@interface SetPasswordViewController ()<UITextFieldDelegate,UIScrollViewDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) JTextField  *inviationText;
@property (nonatomic , strong) JTextField  *passwordText;
@property (nonatomic , strong) JTextField  *codeText;
@property (nonatomic , strong) LoginCodeBtn *codeButton;
@end

@implementation SetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置密码";
    [self setLayout];
}

- (void)setLayout
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
//    [self.scrollView addSubview:self.titleLabel];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.scrollView).offset(53*AdapterScal+StauesBarHeight);
//        make.left.equalTo(self.scrollView).offset(20*AdapterScal);
//    }];
    
    UILabel *telLbl = [UILabel new];
    telLbl.text = @"验证码";
    telLbl.font = UIFont13;
    telLbl.textColor = UIColor333;
    [self.scrollView addSubview:telLbl];
    [telLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationBar.mas_bottom).offset(51*AdapterScal);
        make.left.equalTo(self.scrollView).offset(24*AdapterScal);
    }];

    [self.codeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(telLbl.mas_bottom).offset(15*AdapterScal);
    }];
    
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.codeText);
        make.top.equalTo(self.codeText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    [self.codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineview);
        make.centerY.equalTo(self.codeText);
        make.size.mas_equalTo(CGSizeMake(71, 23));
    }];
    
    
    
    UILabel *pwdLbl = [UILabel new];
    pwdLbl.text = @"密码";
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

    UIView *lineview2 = [UIView new];
    lineview2.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview2];
    [lineview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.passwordText);
        make.top.equalTo(self.passwordText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
  
    UILabel *codeLbl = [UILabel new];
    codeLbl.text = @"邀请码";
    codeLbl.font = UIFont13;
    codeLbl.textColor = UIColor333;
    [self.scrollView addSubview:codeLbl];
    [codeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview2.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(20*AdapterScal);
    }];

    [self.inviationText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(codeLbl.mas_bottom).offset(15*AdapterScal);
    }];
    
    UIView *lineview3 = [UIView new];
    lineview3.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview3];
    [lineview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.inviationText);
        make.top.equalTo(self.inviationText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];

    UIButton *login = [UIButton new];
    [login setTitle:@"下一步" forState:0];
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

- (JTextField *)inviationText
{
    if (!_inviationText) {
        _inviationText = [JTextField new];
        _inviationText.placeholder = @"密码";
        _inviationText.textColor = UIColor999;
        _inviationText.jing_placeholderFont = UIFont14;
        _inviationText.font = UIFont14;
        _inviationText.returnKeyType = UIReturnKeyDone;
        _inviationText.delegate = self;
        [self.scrollView addSubview:_inviationText];
    }
    return _inviationText;
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
