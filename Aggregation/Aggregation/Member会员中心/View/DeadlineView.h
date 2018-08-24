//
//  DeadlineView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeadlineView : UIView
@property (nonatomic,copy) void(^clickBlock)(void);
@end
