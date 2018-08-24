//
//  GradientLbl.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientLbl : UIView

@property (nonatomic, strong) NSArray * colors;//字体渐变颜色数组（必须将颜色转换为CGColor并强制转换为id类型）


@property (nonatomic, strong) UIFont *font;//字体


@property (nonatomic, copy) NSString *text;//设置渐变颜色的文字


@property (nonatomic, assign) NSTextAlignment textAlignment;//对齐方式


@property (nonatomic, assign) CGPoint startPoint;//起始点（0.0~1.0）


@property (nonatomic, assign) CGPoint endPoint;//结束点（0.0~1.0）


//应用设置

- (void) setGradientLabel;

@end

