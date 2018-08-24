//
//  JTextFieldWithUserName.m
//  GlassCat
//
//  Created by chenqiang on 2017/10/11.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "JTextFieldWithUserName.h"

/**
 
 1. 限制长度
 2. 限制文字类型
 3. 设置左图
 4. 设置Placeholder颜色
 
 */

@interface JTextFieldWithUserName ()<UITextFieldDelegate>

@end

@implementation JTextFieldWithUserName

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupLayout];
    }
    return self;
}

-(void)setupLayout{
    
}




@end
