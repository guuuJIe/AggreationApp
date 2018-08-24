//
//  JSGoodsStatusHeadeView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSGoodsStatusHeadeView.h"

@interface JSGoodsStatusHeadeView()
@property (nonatomic , strong) UIImageView *headImage;
@property (nonatomic , strong) UILabel *namelabel;
@end

@implementation JSGoodsStatusHeadeView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12*AdapterScal);
        make.top.equalTo(self.contentView).offset(12*AdapterScal);
    }];
    
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(6*AdapterScal);
        make.centerY.equalTo(self.headImage);
    }];
    
//    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(12, 40, ScreenWidth - 50, 1)];
////    image.backgroundColor = [UIColor blackColor];
//    [self drawLineByUIView:image];
//    [self addSubview:image];
   
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(12, 40, ScreenWidth - 50, 1)];
    [JSCUtil drawLineByUIImageView:image];
    [self addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(12);
        make.left.equalTo(self.headImage);
        make.right.equalTo(self).offset(-14);
        make.height.mas_equalTo(JLineHeight);
    }];
    
//    [image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(14);
//        make.right.equalTo(self).offset(-14);
//        make.bottom.equalTo(self);
//       
//    }];
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

- (void)drawLineByUIView:(UIImageView *)imageView
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:imageView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(imageView.frame) / 2, CGRectGetHeight(imageView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[UIColor lightGrayColor].CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(imageView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:4], [NSNumber numberWithInt:1], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(imageView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [imageView.layer addSublayer:shapeLayer];
}


@end
