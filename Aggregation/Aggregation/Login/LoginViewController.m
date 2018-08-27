//
//  LoginViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/9.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "UnderLineButton.h"
#import "AccountLoginView.h"
#import "QuickLoginView.h"
#import "JSAccountManagers.h"

@interface LoginViewController ()<UIScrollViewDelegate>

@property (nonatomic , strong) UIImageView  *logoImageView;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) AccountLoginView *accountView;
@property (nonatomic , strong) QuickLoginView *quickView;
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) JSAccountManagers *managers;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupLayout
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
    
    
    UIView *lastView;
    NSArray *arr = @[@"账号登录",@"快捷登录"];
    for (int i = 0; i<arr.count; i++) {
        UnderLineButton *button = [UnderLineButton new];
        [button setTitle:arr[i] forState:0];
        [button setTitleColor:UIColor999 forState:0];
        [button setBackgroundColor:UIColorfff];
        [button setTitleColor:UIColor000 forState:UIControlStateSelected];
        button.tag = i+200;
        [self.scrollView addSubview:button];
        [button addTarget:self action:@selector(Login:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self.view);
                
            }else{
                make.left.equalTo(lastView.mas_right);
            }
            make.top.equalTo(self.titleLabel.mas_bottom).offset(51*AdapterScal);
            make.width.mas_equalTo(ScreenWidth/2);
            make.height.mas_equalTo(45*AdapterScal);
        }];
        lastView = button;
    }
    
    [self.scrollView addSubview:self.accountView];
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(lastView.mas_bottom).offset(10);
    }];
    
    [self.scrollView addSubview:self.quickView];
    [self.quickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(lastView.mas_bottom).offset(10);
    }];
    
//    [self.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view).offset(118*AdapterHeightScal);
//        make.centerX.equalTo(self.view);
//    }];
    
    UnderLineButton *button = [self.view viewWithTag:200];
    [self Login:button];
}

- (void)Login:(UnderLineButton *)button
{
    if(!button.selected){
        button.selected = !button.selected;
        
        NSInteger tag = button.tag==200?201:200;
        
        UnderLineButton *otherButton = [self.view viewWithTag:tag];
        otherButton.selected = NO;
    }
    if (button.tag == 200) {
        self.quickView.hidden = YES;
        self.accountView.hidden = NO;
    }else{
        self.quickView.hidden = NO;
        self.accountView.hidden = YES;
    }
}
#pragma mark - Lazy
//-(UIImageView *)logoImageView
//{
//    if (!_logoImageView) {
//        _logoImageView = [UIImageView new];
//        _logoImageView.image = [UIImage imageNamed:@"logo"];
//
//        _logoImageView.contentMode = UIViewContentModeCenter;
//        _logoImageView.userInteractionEnabled = YES;
//        [_logoImageView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)]];
//        [self.view addSubview:_logoImageView];
//    }
//    return _logoImageView;
//}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"登录";
        [self.view addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (AccountLoginView *)accountView
{
    if (!_accountView) {
        _accountView = [AccountLoginView new];
        WeakSelf(self);
        _accountView.clickBlock = ^(NSInteger tag, NSString *tel, NSString *pwd) {
            
            switch (tag) {
              
                case 101:
                {
                    weakself.managers.userName = tel;
                    weakself.managers.passWord = pwd;
                    [weakself.managers responderOfSignUpWhileFinished:^(NSError *error, MessageBody *result) {
                        AppDelegate *appdelegate = JAppDelegate;
                        [weakself presentViewController:appdelegate.tabBarConfig.tabBarController animated:true completion:nil];
                    }];
                   
                }
                    break;
                case 102:
                {
                    [weakself.navigationController pushViewController:[NSClassFromString(@"RegisterViewController") new] animated:YES];
                }
                    break;
                case 103:
                {
                    [weakself.navigationController pushViewController:[NSClassFromString(@"ForgetPasswordViewController") new] animated:YES];
                }
                    break;
                default:
                    
                    break;
            }
        };
    }
    return _accountView;
}

- (QuickLoginView *)quickView
{
    if (!_quickView) {
        _quickView = [QuickLoginView new];
        _quickView.hidden = YES;
//        [self.view addSubview:_quickView];
    }
    return _quickView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        [_scrollView setContentSize:CGSizeMake(ScreenWidth, ScreenHeight
                                               )];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (JSAccountManagers *)managers
{
    if (!_managers) {
        _managers = [[JSAccountManagers alloc] init];
    }
    return _managers;
}

@end
