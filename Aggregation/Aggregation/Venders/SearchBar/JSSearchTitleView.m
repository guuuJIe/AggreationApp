//
//  JSSearchTitleView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/20.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSSearchTitleView.h"

@implementation JSSearchTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupLayout];
    }
    return self;
}


-(void)setupLayout{
    
    self.intrinsicContentSize = CGSizeMake(ScreenWidth, 44);
    
    
    
    
}

@end
