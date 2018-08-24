//
//  JSOrderFooterView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSOrderFooterView : UITableViewHeaderFooterView
@property (nonatomic,copy) void(^clickBlock)(NSString *flag);
-(CGFloat)cellHeight;
@end
