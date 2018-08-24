//
//  ColorfulNavViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ColorfulNavViewController.h"
#import "UIImage+Category.h"
@interface ColorfulNavViewController ()<UINavigationControllerDelegate>

@end

@implementation ColorfulNavViewController

- (void)loadView
{
    [super loadView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.view.backgroundColor = UIColorfff;
    // 设置navbar
    self.navigationItem.backBarButtonItem = nil;
    self.navigationController.navigationBar.translucent = YES;//透明
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor clearColor],
      NSFontAttributeName:[UIFont systemFontOfSize:16]};
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgview"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    if (self.navigationController.childViewControllers.count == 1 ){
        self.tabBarController.tabBar.hidden = NO;
    }
    else{
        self.tabBarController.tabBar.hidden = YES;
    }
    
    //    ios 7 之后，setTranslucent=yes 默认的   则状态栏及导航栏底部为透明的，界面上的组件应该从屏幕顶部开始显示，因为是半透明的，可以看到，所以为了不和状态栏及导航栏重叠，第一个组件的y应该从44+20的位置算起
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColorfff;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;//状态栏黑色
    [self.navigationController.navigationBar  setTranslucent:YES];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
   [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor clearColor],
      NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
    
    UIImage *leftButtonIcon = [UIImage imageNamed:@"Back"];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonIcon
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(goToBack)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self.navigationItem.leftBarButtonItem setTintColor:UIColor1919];

}

-(void)goToBack
{
    if (self.navigationController.childViewControllers.count>1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}

- (void)addView
{
//    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view).offset(SafeNavAreaTopHeight);
//    }];
}


- (NavigationBottomView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [NavigationBottomView new];
        [self.view addSubview:_bottomView];
    }
    return _bottomView;
}

@end
