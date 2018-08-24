//
//  JSGoodsDetailView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSGoodsDetailView : UIView
@property (nonatomic,copy) void(^clickBlock)(NSInteger tag);
@end
