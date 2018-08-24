//
//  CommsearchBar.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/20.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "CommsearchBar.h"

@implementation CommsearchBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.placeholder = [NSString stringWithFormat:@"搜索商品名称"];
        UIImage* searchBarBg = [JSCUtil GetImageWithColor:UIColorf4f4 andHeight:30];
        //设置背景图片
        [self setBackgroundImage:searchBarBg];
        //设置背景色
        [self setBackgroundColor:[UIColor clearColor]];
        //设置文本框背景
        [self setSearchFieldBackgroundImage:searchBarBg forState:UIControlStateNormal];
        UITextField *searchField = [self valueForKey:@"_searchField"];
        searchField.textColor = [UIColor colorWithHexString:@"999"];
        [searchField setValue:[UIColor colorWithHexString:@"999"] forKeyPath:@"_placeholderLabel.textColor"];
        searchField.font = [UIFont systemFontOfSize:14];
        
        self.layer.cornerRadius = 4;
        self.layer.masksToBounds = YES;
        
    }
    return self;
}

@end
