//
//  JSJoinViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSJoinViewController.h"

@interface JSJoinViewController ()<UIScrollViewDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@end

@implementation JSJoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    [self setLayout];
}

- (void)setNav
{
    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
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
        make.top.equalTo(self.view).offset(0);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
    UIView *bgview = [[UIView alloc] init];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"join_icon_1"];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [bgview addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bgview);
    }];
    
    
    
    
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(imageView);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"join_icon_2"] forState:0];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [bgview addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgview.mas_bottom).offset(-40*AdapterScal);
        make.centerX.equalTo(bgview);
    }];
    
    AdjustsScrollViewInsetNever(self, self.scrollView);
}


- (void)click
{
    [self.navigationController pushViewController:[NSClassFromString(@"JSReviewStatuesViewController") new] animated:YES];
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
