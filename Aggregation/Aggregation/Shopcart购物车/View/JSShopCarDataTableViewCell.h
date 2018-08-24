//
//  JSShopCarDataTableViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSShopCarDataTableViewCell : UITableViewCell
/**
 选中
 */
@property (nonatomic, copy) void (^ClickRowBlock)(BOOL isClick);
/**
 加
 */
@property (nonatomic, copy) void (^AddBlock)(UILabel *countLabel);

/**
 减
 */
@property (nonatomic, copy) void (^CutBlock)(UILabel *countLabel);

@property (nonatomic , strong) UIView *bgview;
@end
