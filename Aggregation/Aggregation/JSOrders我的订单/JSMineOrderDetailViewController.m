//
//  JSMineOrderDetailViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSMineOrderDetailViewController.h"
#import "JSGoodsDetaiView.h"
#import "UIView+Category.h"
#import "JSGoodsStatuesOtherInfoView.h"
#import "UIImage+Category.h"
@interface JSMineOrderDetailViewController ()<UIScrollViewDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) UIImageView  *bgImage;
@property (nonatomic , strong) JSGoodsDetaiView *detailView;
@property (nonatomic , strong) JSGoodsStatuesOtherInfoView *infoView;
@property (nonatomic , strong) UIButton *opeationBtn;
@property (nonatomic , strong) UIImageView *barImage;

@end

@implementation JSMineOrderDetailViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNav];
    
    [self setLayout];
    
     self.barImage = self.navigationController.navigationBar.subviews.firstObject;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // Do any additional setup after loading the view.
    [self setNav];
    
}


- (void)setNav
{
    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
//    self.title = @"待发货";
    
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgview"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTranslucent:NO];
}


- (void)setLayout
{
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(-SafeNavAreaTopHeight);
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
    
    
    [bgview addSubview:self.bgImage];
    [self.bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(bgview);
        make.height.mas_equalTo(343/2*AdapterScal);
        
    }];
    
    [bgview addSubview:self.detailView];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImage.mas_bottom).offset(-40*AdapterScal);
        make.left.equalTo(bgview).offset(14);
        make.right.equalTo(bgview).offset(-14);
        make.height.mas_equalTo(ScreenHeight);
//        make.bottom.equalTo(bgview);
    }];
    [self.detailView layoutIfNeeded];
    [self.detailView setCornerRadius:8 withShadow:YES withOpacity:0.6];
    
    [bgview addSubview:self.infoView];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailView.mas_bottom).offset(20*AdapterScal);
        make.left.equalTo(bgview).offset(14);
        make.right.equalTo(bgview).offset(-14);
        make.height.mas_equalTo(200);
        make.bottom.equalTo(bgview).offset(-52*AdapterScal);
    }];
    [self.infoView layoutIfNeeded];
    [self.infoView setCornerRadius:8 withShadow:YES withOpacity:0.6];
    
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColorfff;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.height.mas_equalTo(52*AdapterScal+BottomAreaHeight);
    }];
    
    [view addSubview:self.opeationBtn];
    [self.opeationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(view);
        make.height.mas_equalTo(52*AdapterScal);
    }];
    
//    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(self.opeationBtn.mas_top);
//    }];
//
//    [self.opeationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.bottom.equalTo(self.view).offset(-BottomAreaHeight);
//        make.height.mas_equalTo(52*AdapterScal);
//    }];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  
//    CGFloat  alpha = scrollView.contentOffset.y/600*AdapterScal;
//    if (alpha > 1) {
//        alpha = 1;
//    }else if (alpha <= 0){
//        alpha = 0;
//    }
//
//    JLog(@"%f",alpha);
//    self.barImage.backgroundColor =  [UIColor colorWithRed:3 green:3 blue:3 alpha:alpha];
//
    CGFloat  offset = scrollView.contentOffset.y;
    if (offset>SafeNavAreaTopHeight) {
        self.barImage.backgroundColor = UIColor495e;
    }else{
        self.barImage.backgroundColor = [UIColor clearColor];
    }
    

}

- (UIImageView *)bgImage
{
    if (!_bgImage) {
        _bgImage = [UIImageView new];
        _bgImage.image = [UIImage imageNamed:@"detailStatus_image_1"];
//        _bgImage.contentMode = UIViewContentModeScaleToFill;
    }
    return _bgImage;
}



- (JSGoodsDetaiView *)detailView
{
    if (!_detailView) {
        _detailView = [JSGoodsDetaiView new];
        
    }
    return _detailView;
}

- (JSGoodsStatuesOtherInfoView *)infoView
{
    if (!_infoView) {
        _infoView = [JSGoodsStatuesOtherInfoView new];
    }
    return _infoView;
}

- (UIButton *)opeationBtn
{
    if (!_opeationBtn) {
        _opeationBtn = [UIButton new];
        [_opeationBtn setTitle:@"订单操作" forState:0];
        [_opeationBtn setBackgroundColor:UIColor495e];
        [_opeationBtn.titleLabel setFont:UIFont16];
        [_opeationBtn.titleLabel setTextColor:UIColorfff];
        [self.view addSubview:_opeationBtn];
    }
    return _opeationBtn;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

@end
