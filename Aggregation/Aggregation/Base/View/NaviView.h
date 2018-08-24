//
//  NaviView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NaviView : UIView
@property (nonatomic , strong) UILabel *title;
@property (nonatomic , strong) UIImageView *backImage;
@property (nonatomic,copy) void(^clickBlock)(void);
@end
