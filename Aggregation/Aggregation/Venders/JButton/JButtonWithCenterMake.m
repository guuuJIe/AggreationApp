//
//  JButtonWithCenterMake.m
//  boligou
//
//  Created by chenqiang on 2017/10/14.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "JButtonWithCenterMake.h"
#import "UIImage+Category.h"
@implementation JButtonWithCenterMake

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
    
    
    
    [self setBackgroundImage:[UIImage createImageWithColor:UIColor49b8ff] forState:UIControlStateNormal];
    [self setBackgroundImage:[UIImage createImageWithColor:UIColorccc] forState:UIControlStateDisabled];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.layer.masksToBounds = true;
    self.layer.cornerRadius = JButtonHeight/2;
    
    self.titleLabel.font = UIFont15;
    
}

// 需要在 self 已经布局后才能调用，否则获取不到 frame
/*
 设置 BackImage 的时候,需要设置 maskToBouds
 但是设置了 maskToBouds 后不能设置阴影
 下面的方法是 重新添加一个 Layer 在 superView 中
 注意 zPosition 让 Layer 放在了最底层
 */
-(void)setProperty:(id)property{
    BOOL isLogin = property;
    if(isLogin == 1){
        
//        self.backgroundColor = [UIColor colorWithHexString:@"26b8fb"];
//        self.layer.shadowColor = [UIColor blackColor].CGColor;
//        self.layer.shadowOpacity = 0.2f;
//        self.layer.shadowRadius = 1.f;
//        self.layer.shadowOffset = CGSizeMake(2, 2);


        
        
        [self.superview layoutIfNeeded];
        CALayer *layer = [CALayer layer];
        layer.zPosition = -1;
        layer.frame = CGRectMake(self.frame.origin.x+ 1, self.frame.origin.y+1, self.frame.size.width - 2, self.frame.size.height-2);
        layer.backgroundColor = [UIColor blackColor].CGColor;
        layer.shadowOffset = CGSizeMake(3, 3);
        layer.shadowOpacity = 0.2;
        layer.shadowRadius = 1.f;
        layer.cornerRadius = self.layer.cornerRadius;
        //这里self表示当前自定义的view
        [self.superview.layer addSublayer:layer];
        
    }
}



@end
