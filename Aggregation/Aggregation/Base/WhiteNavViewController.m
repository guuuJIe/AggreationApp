//
//  WhiteNavViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "WhiteNavViewController.h"
#import "UIImage+Category.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface WhiteNavViewController ()<UINavigationControllerDelegate>

@end

@implementation WhiteNavViewController


- (void)loadView
{
    [super loadView];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.delegate = self;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self setupLayout];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
   
    self.navigationItem.backBarButtonItem = nil;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    if (self.navigationController.childViewControllers.count == 1 ){
        self.tabBarController.tabBar.hidden = NO;
    }
    else{
        self.tabBarController.tabBar.hidden = YES;
    }
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(CGFLOAT_MIN * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        UIViewController *vc = [self.navigationController.viewControllers lastObject];
//        if (vc.fd_prefersNavigationBarHidden) {
//            [self.navigationController setNavigationBarHidden:YES animated:NO];
//        } else {
//            [self.navigationController setNavigationBarHidden:NO animated:NO];
//        }
//    });
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:UIColorfff] forBarMetrics:UIBarMetricsDefault];
//    [self setupLayout];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(CGFLOAT_MIN * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        UIViewController *vc = [self.navigationController.viewControllers lastObject];
//        if (vc.fd_prefersNavigationBarHidden) {
//            [self.navigationController setNavigationBarHidden:YES animated:NO];
//        } else {
//            [self.navigationController setNavigationBarHidden:NO animated:NO];
//        }
//    });
}




-(void)goToBack
{
    if (self.navigationController.childViewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

- (void)setupLayout
{
    [self.naviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
    }];
}

- (NaviView *)naviView
{
    if (!_naviView) {
        _naviView = [[NaviView alloc] init];
        WeakSelf(self);
        _naviView.clickBlock = ^{
            [weakself goToBack];
        };
        [self.view addSubview:_naviView];
    }
    return _naviView;
}



@end
