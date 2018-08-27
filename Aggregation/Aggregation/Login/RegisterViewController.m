//
//  RegisterViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "RegisterViewController.h"
#import "JTextField.h"
#import "SetPasswordViewController.h"
#import "PerfectInformationViewController.h"

@interface RegisterViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) JTextField *accountText;
@property (nonatomic , strong) UILabel *titleLabel;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    [self setNav];
    [self setLayout];
}

- (void)setNav
{
    self.title = @"注册";
//    self.navigationItem.leftBarButtonItem = nil;
//    [self.navigationController.navigationBar setTranslucent:NO];
}
- (void)setLayout
{
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
//    [self.scrollView addSubview:self.titleLabel];
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.scrollView).offset(0+StauesBarHeight);
//        make.left.equalTo(self.scrollView).offset(20*AdapterScal);
//    }];
//
    
    
    UILabel *telLbl = [UILabel new];
    telLbl.text = @"手机号";
    telLbl.font = UIFont13;
    telLbl.textColor = UIColor333;
    [self.scrollView addSubview:telLbl];
    [telLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navigationBar.mas_bottom).offset(51*AdapterScal);
        make.left.equalTo(self.scrollView).offset(24*AdapterScal);
    }];
    
    UILabel *Label = [UILabel new];
    Label.text = @"+86";
    Label.font = UIFont14;
    Label.backgroundColor = UIColor495e;
    Label.textColor = UIColorfff;
    Label.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:Label];
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(telLbl.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(telLbl);
        make.size.mas_equalTo(CGSizeMake(32, 20));
    }];
    
    [self.scrollView addSubview:self.accountText];
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Label.mas_right).offset(5*AdapterScal);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.centerY.equalTo(Label);
    }];
    
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.accountText);
        make.left.equalTo(Label); make.top.equalTo(self.accountText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UIButton *login = [UIButton new];
    [login setTitle:@"下一步" forState:0];
    [login setTitleColor:UIColorfff forState:0];
    [login setBackgroundColor:UIColor495e];
    login.layer.cornerRadius =2;
    login.layer.masksToBounds = YES;
    login.tag = 101;
    [login addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:login];
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview.mas_bottom).offset(40*AdapterScal);
        make.left.right.equalTo(lineview);
        make.height.mas_equalTo(44*AdapterScal);
    }];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.scrollView setContentSize:CGSizeMake(ScreenWidth, ScreenWidth+100)];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.scrollView setContentSize:CGSizeMake(ScreenWidth, 0)];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)clickAction:(UIButton *)button
{
    PerfectInformationViewController *VC = [PerfectInformationViewController new];
    [self.navigationController pushViewController:VC animated:YES];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"注册";
        
    }
    return _titleLabel;
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
        
    }
    return _accountText;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

@end
