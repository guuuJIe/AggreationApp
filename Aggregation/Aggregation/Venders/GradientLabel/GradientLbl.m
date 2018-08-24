//
//  GradientLbl.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "GradientLbl.h"
@interface GradientLbl ()

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end
@implementation GradientLbl

- (instancetype)init
{
    if (self = [super init]) {
        [self setGradientLabel];
    }
    return self;
}

-(CAGradientLayer *)gradientLayer {
    
    if (!_gradientLayer) {
        
        _gradientLayer = [CAGradientLayer layer];
        
        _gradientLayer.startPoint = CGPointMake(0.0,1.0);
        
        _gradientLayer.endPoint = CGPointMake(1.0, 1.0);
        
        _gradientLayer.frame = self.label.frame;
        
        _gradientLayer.colors = self.colors?:@[[UIColor whiteColor], [UIColor blackColor]];
        
    }
    
    return _gradientLayer;
    
}





- (void) setGradientLabel {
    
    
    
    self.label = [[UILabel alloc] init];
    
    self.label.text = self.text?:@"渐变字体";
    
    [self.label setFont:self.font?:[UIFont systemFontOfSize:13]];
    
    [self.label setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:self.label];
    
    
    
}



-(void)layoutSubviews {
    
    [super layoutSubviews];
    
    
    
    [self.label setFrame:self.bounds];
    
    // 添加渐变层到控制器的view图层上
    
    
    
    [self.layer addSublayer:self.gradientLayer];
    
    // mask层工作原理:按照透明度裁剪，只保留非透明部分，文字就是非透明的，因此除了文字，其他都被裁剪掉，这样就只会显示文字下面渐变层的内容，相当于留了文字的区域，让渐变层去填充文字的颜色。
    
    // 设置渐变层的裁剪层
    
    self.gradientLayer.mask = self.label.layer;
    
}
@end
