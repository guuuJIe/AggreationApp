//
//  JSWithdrawTableViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSWithdrawTableViewCell : UITableViewCell
@property (nonatomic,copy) void(^clickBlock)(NSInteger tag);
@property (nonatomic,copy) void(^withdrawBlock)(void);
@end
