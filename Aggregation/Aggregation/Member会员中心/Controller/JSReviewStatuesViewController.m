//
//  JSReviewStatuesViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSReviewStatuesViewController.h"

@interface JSReviewStatuesViewController ()<UIScrollViewDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@end

@implementation JSReviewStatuesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
//    [self setLayout];
    [self reviewFailLayout];
}

- (void)setNav
{
    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)setLayout
{
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *bgview = [[UIView alloc] init];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"reviewing"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [bgview addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgview);
        make.top.equalTo(bgview);
    }];
    
    
    UILabel *statuselabel = [UILabel new];
    statuselabel.text = @"审核中";
    statuselabel.textColor = UIColorfff;
    statuselabel.font = UIFont20;
    [bgview addSubview:statuselabel];
    [statuselabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgview);
        make.top.mas_equalTo(bgview).offset(154);
    }];
    
    
    UILabel *submitlabel = [[UILabel alloc] init];
    submitlabel.text = @"提交成功,请等待管理员审核!";
    submitlabel.textColor = UIColor333;
    submitlabel.font = UIFont15;
    [bgview addSubview:submitlabel];
    [submitlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgview);
        make.top.equalTo(imageView.mas_bottom).offset(20*AdapterScal);
        
    }];
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.text = @"预计1-2个工作日内审核完毕，审核结果会短信通知到您的注册手机上。";
    timelabel.textColor = UIColor999;
    timelabel.font = UIFont14;
    timelabel.numberOfLines = 0;
    [bgview addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(bgview);
        make.top.equalTo(submitlabel.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(bgview).offset(30*AdapterScal);
        make.right.equalTo(bgview).offset(-30*AdapterScal);
    }];
    
    
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(timelabel.mas_bottom).offset(10);
    }];
    
    
    
//    AdjustsScrollViewInsetNever(self, self.scrollView);
}

- (void)reviewFailLayout
{
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UIView *bgview = [[UIView alloc] init];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"reviewFail"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [bgview addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgview);
        make.top.equalTo(bgview);
    }];
    
    
    UILabel *statuselabel = [UILabel new];
    statuselabel.text = @"审核失败";
    statuselabel.textColor = UIColorfff;
    statuselabel.font = UIFont20;
    [bgview addSubview:statuselabel];
    [statuselabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgview);
        make.top.mas_equalTo(bgview).offset(154);
    }];
    
    
    UILabel *submitlabel = [[UILabel alloc] init];
    submitlabel.text = @"抱歉，您的申请由于xxx原因未通过";
    submitlabel.textColor = UIColor333;
    submitlabel.font = UIFont15;
    [bgview addSubview:submitlabel];
    [submitlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgview);
        make.top.equalTo(imageView.mas_bottom).offset(15*AdapterScal);
        
    }];
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.text = @"如有疑问请咨询:400-877-9199";
    timelabel.textColor = UIColor999;
    timelabel.font = UIFont14;
 
    [bgview addSubview:timelabel];
    [timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgview);
        make.top.equalTo(submitlabel.mas_bottom).offset(16*AdapterScal);
       
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:@"重新申请" forState:0];
    button.layer.cornerRadius = 2;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = JLineHeight;
    button.layer.borderColor = UIColor999.CGColor;
    [button.titleLabel setFont:UIFont15];
    [button setTitleColor:UIColor999 forState:0];
    [button addTarget:self action:@selector(clickAgain) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(timelabel);
        make.size.mas_equalTo(CGSizeMake(160*AdapterScal, 44*AdapterScal));
        make.top.equalTo(timelabel.mas_bottom).offset(30*AdapterScal);
    }];
    
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(button.mas_bottom).offset(10);
    }];
    
    
    
    //    AdjustsScrollViewInsetNever(self, self.scrollView);
}

- (void)clickAgain
{
    
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
