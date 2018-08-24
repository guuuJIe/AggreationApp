//
//  JTextFieldWithLogin.m
//  GlassCat
//
//  Created by chenqiang on 2017/10/14.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "JTextFieldWithLogin.h"

@implementation JTextFieldWithLogin

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
        [self setupLayout];
    }
    return self;
}

-(void)setupLayout{
    
//    self.backgroundColor = UIColorf7f7f7;
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = jTextFieldHeight/2;    
    self.jing_placeholderFont = UIFont14;
    self.font = UIFont14;
//    self.jing_placeholderColor = UIColor999;
    
}

@end
