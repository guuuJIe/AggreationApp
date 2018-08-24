//
//  CommSearchView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/15.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "CommSearchView.h"

@implementation CommSearchView


- (instancetype)initWithClickType:(BOOL) needTap andFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = true;
        self.placeholder = @"搜索商品";
        self.frame = frame;
        UIImageView *searchIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search"]];
        searchIcon.width = 30;
        searchIcon.height = 30;
        self.leftView = searchIcon;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftViewMode = UITextFieldViewModeAlways;
        [self setValue:UIColorccc forKeyPath:@"_placeholderLabel.textColor"];
        [self setValue:UIFont15 forKeyPath:@"_placeholderLabel.font"];
        if (needTap) {
            self.userInteractionEnabled = NO;
            UIButton *button = [UIButton new];
            button.layer.cornerRadius = 4;
            button.layer.masksToBounds = true;
            [self addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(self);
            }];
           
           
        }
    }
    return self;
    
}

@end
