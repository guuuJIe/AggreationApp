//
//  JSShopCarHeadView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSShopCarHeadView : UITableViewHeaderFooterView
/**
 选中
 */
@property (nonatomic, copy) void (^ClickBlock)(BOOL isClick);
@end
