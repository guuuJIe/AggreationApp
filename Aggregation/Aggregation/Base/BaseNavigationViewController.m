//
//  BaseNavigationViewController.m
//  GlassCat
//
//  Created by chenqiang on 2017/10/8.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.interactivePopGestureRecognizer.delegate = self;
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

 
}



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    //    viewController.navigationItem.hidesBackButton=YES;
    if (self.childViewControllers.count>=1) {
        viewController.tabBarController.tabBar.hidden = NO;
        viewController.hidesBottomBarWhenPushed = YES;
    }else{
        
    }
    
    [super pushViewController:viewController animated:animated];
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
    //判断是否为rootViewController
    if (self.childViewControllers.count == 1) {
        //        [self dismissViewControllerAnimat ed:NO completion:nil];
        return NO;
    }
    return YES;
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    //    self.tabBarController.tabBar.hidden = NO;
    JLog(@"%@-----%@",self.viewControllers.firstObject,self.viewControllers.lastObject);

    return  [super popViewControllerAnimated:animated];
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return self.childViewControllers[0];
}

@end
