//
//  BaseViewController.m
//  GlassCat
//
//  Created by chenqiang on 2017/10/8.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "BaseViewController.h"
#import "UIColor+HexString.h"
#import "UIImage+Category.h"


//#import <UMAnalytics/MobClick.h>
@interface BaseViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseViewController
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
   [self.navigationItem setHidesBackButton:YES];
    self.navigationController.navigationBar.translucent = YES;//透明
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor clearColor],
      NSFontAttributeName:[UIFont systemFontOfSize:16]};
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
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;//状态栏黑色
    [self.navigationController.navigationBar  setTranslucent:true];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:UIColorfff] forBarMetrics:UIBarMetricsDefault];
     [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];

     self.navigationController.navigationBar.tintColor = [UIColor blackColor];
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





@end
