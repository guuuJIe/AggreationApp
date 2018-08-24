//
//  NewHomeTRView.m
//  GoodsDetail
//
//  Created by chenqiang on 2018/8/8.
//  Copyright © 2018年 chenqiang. All rights reserved.
//

#import "NewHomeTRView.h"

@implementation NewHomeTRView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = NO;
        self.layer.contentsScale = [UIScreen mainScreen].scale;
        self.layer.shadowOffset = CGSizeMake(0, 1);
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowRadius = 3;
        self.layer.shadowOpacity = .75f;
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;//设置抗锯齿边缘
        [self setupLayout];
    }
    return self;
}

-(void)setupLayout{
    
   
    [self.contentView addSubview:self.rImageView];
    [self.rImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);

    }];
  
    
    
    
}


-(UIImageView *)rImageView
{
    if(!_rImageView)
    {
        _rImageView=[UIImageView  new];
        _rImageView.backgroundColor = UIColor49b8ff;
        _rImageView.layer.cornerRadius = 4;
        _rImageView.layer.masksToBounds = YES;
    }
    return _rImageView;
}

@end
