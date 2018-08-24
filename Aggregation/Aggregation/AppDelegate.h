//
//  AppDelegate.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/9.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYTabbarControllerConfig.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic , strong) CYTabbarControllerConfig *tabBarConfig;
@end

