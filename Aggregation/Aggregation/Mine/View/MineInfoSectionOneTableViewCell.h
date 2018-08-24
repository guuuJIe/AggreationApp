//
//  MineInfoSectionOneTableViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineInfoSectionOneTableViewCell : UITableViewCell
@property (nonatomic,copy) void(^clickBlock)(NSInteger tag);
@property (nonatomic,copy) void(^setClickBlock)(void);
@end
