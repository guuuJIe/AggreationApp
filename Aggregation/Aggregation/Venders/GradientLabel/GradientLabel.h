//
//  GradientLabel.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GradientLabel : UILabel

@property (nonatomic, strong) UILabel *label;
- (void) setGradientLabelColors: (NSArray *)colors;
@end
