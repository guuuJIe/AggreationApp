//
//  WithdrawPopView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "MMPopupView.h"

@interface WithdrawPopView : MMPopupView
@property (nonatomic,copy) void(^clickBlock)(NSString *text);
@end
