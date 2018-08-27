//
//  BaseHidenBarViewController.m
//  GlassCat
//
//  Created by chenqiang on 2017/10/11.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "BaseHidenBarViewController.h"
#import "UIImage+Category.h"

//#import <UMAnalytics/MobClick.h>
@interface BaseHidenBarViewController ()<UINavigationControllerDelegate>

@end

@implementation BaseHidenBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColorfff;

    self.navigationController.delegate = self;
 
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    // 设置navbar
    self.view.backgroundColor = UIColorfff;
    self.navigationItem.backBarButtonItem = nil;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:UIColorfff] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:UIColor1919,
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    if (self.navigationController.childViewControllers.count == 1 ){
        
        self.tabBarController.tabBar.hidden = NO;
    }
    else{
        
        self.tabBarController.tabBar.hidden = YES;
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 设置navbar
    self.navigationItem.backBarButtonItem = nil;
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:UIColorfff] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:UIColor1919,
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}






@end
