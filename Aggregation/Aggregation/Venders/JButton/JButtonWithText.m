//
//  JButtonWithText.m
//  boligou
//
//  Created by chenqiang on 2017/10/14.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "JButtonWithText.h"

@implementation JButtonWithText

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleLabel.font = UIFont13;
        [self setTitleColor:UIColor49b8ff forState:UIControlStateNormal];
    }
    return self;
}


@end
