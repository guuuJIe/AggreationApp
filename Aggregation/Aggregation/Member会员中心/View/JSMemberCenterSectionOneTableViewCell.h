//
//  JSMemberCenterSectionOneTableViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSMemberCenterSectionOneTableViewCell : UITableViewCell
@property (nonatomic,copy) void(^clickBlock)(void);
@property (nonatomic,copy) void(^withdrawClickBlock)(NSInteger tag);
@end
