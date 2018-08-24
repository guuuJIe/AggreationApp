//
//  NaviView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "NaviView.h"

@interface NaviView()

@end

@implementation NaviView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.top.equalTo(self).offset(15*AdapterScal+StauesBarHeight);
        make.bottom.equalTo(self).offset(-10*AdapterScal);
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.backImage);
    }];
}

- (void)tapClick
{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

- (UIImageView *)backImage
{
    if (!_backImage) {
        _backImage = [UIImageView new];
        UIImage  *img = [UIImage imageNamed:@"Back"];
        _backImage.userInteractionEnabled = YES;
        _backImage.image = [img imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        [_backImage addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)]];
        _backImage.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_backImage];
    }
    return _backImage;
}

- (UILabel *)title
{
    if (!_title) {
        _title = [UILabel new];
        _title.textColor = UIColor000;
        _title.font = [UIFont boldSystemFontOfSize:18];
        _title.alpha = 0;
        [self addSubview:_title];
    }
    return _title;
}
@end
