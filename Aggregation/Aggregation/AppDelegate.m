//
//  AppDelegate.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/9.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "LoginViewController.h"
#import "BaseNavigationViewController.h"
#import "JSHomePageViewController.h"
#import "TBCityIconFont.h"
@interface AppDelegate ()
@property (nonatomic , strong) LoginViewController *loginControl;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self initWindow];
    
    [self setIQKeyBoardManager];
    
    [self setFont];
    return YES;
}




-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[BaseNavigationViewController alloc] initWithRootViewController:[LoginViewController new]];

    [self.window makeKeyAndVisible];
}


/**
 键盘设置
 */
-(void)setIQKeyBoardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
//    manager.shouldToolbarUsesTextFieldTintColor = YES;
//    manager.enableAutoToolbar = YES;
    manager.toolbarManageBehaviour = IQAutoToolbarBySubviews;
}

-(CYTabbarControllerConfig *)tabBarConfig
{
    if (!_tabBarConfig)
    {
        
        _tabBarConfig = [[CYTabbarControllerConfig alloc] init];
        
    }
    return _tabBarConfig;
}

-(void)setFont
{
    [TBCityIconFont setFontName:@"iconfont"];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
