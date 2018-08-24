//
//  JButton.h
//  boligou
//
//  Created by chenqiang on 2017/10/14.
//  Copyright © 2017年 chenqiang. All rights reserved.
//


#import <UIKit/UIKit.h>

static  CGFloat JButtonHeight = 44;


typedef enum : NSUInteger {
    JButtonTypeWithCenterMake,
    JButtonTypeWithBottomMake,
    JButtonTypeWithText,
    JButtonTypeWithRegisterCode,
} JButtonType;

@interface JButton : UIButton

@property (nonatomic , strong) id property;

+(instancetype)buttonWithJButtonType:(JButtonType)jButtonType;
@end
