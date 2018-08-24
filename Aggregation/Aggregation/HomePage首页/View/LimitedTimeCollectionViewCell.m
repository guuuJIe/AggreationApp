//
//  LimitedTimeCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "LimitedTimeCollectionViewCell.h"
#import "GradientLabel.h"
#import "GradientLbl.h"
#import "GradientHelp.h"
#import "JSHomePageSectionZeroView.h"

@interface LimitedTimeCollectionViewCell()
@property (nonatomic , strong) UILabel *titlelabel;
@property (nonatomic , strong) UILabel *comeInLabel;
@property (nonatomic , strong) UIImageView *rightimage;
@property (nonatomic , strong) JSHomePageSectionZeroView *limitView;
@end


@implementation LimitedTimeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    
    [self.limitView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];

//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(14, 5, 60,25)];
//    label.text = @"显示抢购";
//    [self.contentView addSubview:label];
//
//    [GradientHelp TextGradientview:label bgVIew:self gradientColors:@[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor] gradientStartPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
//
//
//    [self.comeInLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(label.mas_bottom).offset(6*AdapterScal);
//        make.left.equalTo(label);
//    }];
//
//    [self.rightimage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.contentView).offset(-14);
//        make.centerY.equalTo(self.contentView);
//    }];
}

- (void)setupData:(NSDictionary *)dic
{
    self.rightimage.image = [UIImage imageNamed:dic[@"image"]];
//    self.titleLabel.text = dic[@"topText"];

}


- (UIImageView *)rightimage
{
    if (!_rightimage) {
        _rightimage = [UIImageView new];
        _rightimage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_rightimage];
    }
    return _rightimage;
}

- (UILabel *)comeInLabel
{
    if (!_comeInLabel) {
        _comeInLabel = [UILabel new];
        _comeInLabel.text = @"点击进入";
        _comeInLabel.font = UIFont12;
        _comeInLabel.textColor = UIColor999;
        [self.contentView addSubview:_comeInLabel];
    }
    return _comeInLabel;
}

- (JSHomePageSectionZeroView *)limitView
{
    if (!_limitView) {
        _limitView = [[JSHomePageSectionZeroView alloc] init];
        [self.contentView addSubview:_limitView];
    }
    return _limitView;
}
//- (GradientLabel *)titleLabel
//{
//    if (!_titleLabel) {
//        _titleLabel = [GradientLabel new];
//        [_titleLabel setGradientLabelColors:@[ThemeColor,UIColorccc]];
//        _titleLabel.text = @"";
//        _titleLabel.font = UIFont16;
//        _titleLabel.textColor = UIColor999;
//        [self.contentView addSubview:_titleLabel];
//    }
//    return _titleLabel;
//}
@end
