//
//  MineOrderView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineOrderView : UIView
@property (nonatomic,copy) void(^clickBlock)(NSInteger tag);
@end
