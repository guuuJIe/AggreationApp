//
//  JSOrderHeadView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSOrderHeadView.h"

@interface JSOrderHeadView()
@property (nonatomic , strong) UIImageView *bgImage;
@property (nonatomic , strong) UIView *bgView;
@property (nonatomic , strong) UIImageView *headImage;
@property (nonatomic , strong) UILabel *namelabel;
@property (nonatomic , strong) UIImageView *statusImage;
@end

@implementation JSOrderHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.contentView.backgroundColor = [UIColor clearColor];
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(13,0,ScreenWidth-12,50)];
        [view2 setFrame:CGRectMake(10, 35, ScreenWidth-24, 40)];
        view2.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:view2];
        
        //设置切哪个直角
        //    UIRectCornerTopLeft     = 1 << 0,  左上角
        //    UIRectCornerTopRight    = 1 << 1,  右上角
        //    UIRectCornerBottomLeft  = 1 << 2,  左下角
        //    UIRectCornerBottomRight = 1 << 3,  右下角
        //    UIRectCornerAllCorners  = ~0UL     全部角
        //得到view的遮罩路径
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8,8)];
        //创建 layer
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = view2.bounds;
        //赋值
        maskLayer.path = maskPath.CGPath;
        view2.layer.mask = maskLayer;
        
        self.bgView = view2;
        
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.contentView);
//        make.left.equalTo(self.contentView).offset(12);
//        make.right.equalTo(self.contentView).offset(-12);
//    }];
//    [self.bgView layoutIfNeeded];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView).offset(12*AdapterScal);
        make.top.equalTo(self.bgView).offset(12*AdapterScal);
    }];
    
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(6*AdapterScal);
        make.centerY.equalTo(self.headImage);
    }];
    
    UILabel *label = [UILabel new];
    label.text = @"\U0000e6a7";
    label.font = iconFontSize(20);
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.namelabel.mas_right).offset(6*AdapterScal);
        make.centerY.equalTo(self.namelabel);
    }];
    [self.statusImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView);
        make.right.equalTo(self.bgView);
    }];
}

- (UIImageView *)headImage
{
    if (!_headImage) {
        _headImage = [UIImageView new];
        _headImage.contentMode = UIViewContentModeScaleAspectFit;
        _headImage.image = [UIImage imageNamed:@"Home_unsel"];//status_image_1
        [self.contentView addSubview:_headImage];
    }
    return _headImage;
}

- (UIImageView *)statusImage
{
    if (!_statusImage) {
        _statusImage = [UIImageView new];
        _statusImage.contentMode = UIViewContentModeScaleAspectFit;
        _statusImage.image = [UIImage imageNamed:@"status_image_1"];
        [self.contentView addSubview:_statusImage];
    }
    return _statusImage;
}

- (UILabel *)namelabel
{
    if (!_namelabel) {
        _namelabel = [UILabel new];
        _namelabel.text = @"酒水旗舰店";
        _namelabel.textColor = UIColor333;
        _namelabel.font = UIFont14;
        [self.contentView addSubview:_namelabel];
    }
    return _namelabel;
}



@end
