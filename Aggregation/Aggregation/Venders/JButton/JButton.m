//
//  JButton.m
//  boligou
//
//  Created by chenqiang on 2017/10/14.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "JButton.h"
#import "JButtonWithCenterMake.h"
#import "JButtonWithText.h"
#import "UIImage+Category.h"

@implementation JButton

+(instancetype)buttonWithJButtonType:(JButtonType)jButtonType{
    switch (jButtonType) {
        case JButtonTypeWithCenterMake:
            return [JButtonWithCenterMake new];
            break;
        case JButtonTypeWithText:
            return [JButtonWithText new];
            break;
        case JButtonTypeWithRegisterCode:
            return [JButtonWithText new];
            break;
        case JButtonTypeWithBottomMake:
        {
            JButton *button = [JButton new];
            [button setBackgroundImage:[UIImage createImageWithColor:UIColor49b8ff] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage createImageWithColor:UIColorccc] forState:UIControlStateDisabled];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            button.titleLabel.font = UIFont16;
            return button;
        }
            break;
            
        default:
            return [JButton new];
            break;
    }
}


-(void)setupLayout{
    
}

@end
