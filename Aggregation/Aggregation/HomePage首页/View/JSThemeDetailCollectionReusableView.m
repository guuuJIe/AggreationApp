//
//  JSThemeDetailCollectionReusableView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSThemeDetailCollectionReusableView.h"
#import "UnderLineButton.h"
@interface JSThemeDetailCollectionReusableView()
@property (nonatomic , strong) UIImageView *themeImage;
@property (nonatomic , strong) UILabel *stateLabel;
@property (nonatomic , strong) UILabel *funcLabel;
@end

@implementation JSThemeDetailCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    [self.themeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0*AdapterScal);
        make.top.equalTo(self).offset(0);
        make.right.equalTo(self).offset(0*AdapterScal);
        make.height.mas_equalTo(170*AdapterScal);
    }];
    
    [self.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.themeImage.mas_bottom).offset(20*AdapterScal);
        make.left.equalTo(self).offset(12);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColor000;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.stateLabel);
        make.top.equalTo(self.stateLabel.mas_bottom).offset(4*AdapterScal);
        make.right.equalTo(self.stateLabel).offset(-5*AdapterScal);
        make.height.mas_equalTo(2);
//        make.width.mas_equalTo(self.stateLabel.width-10);
    }];
    
    [self.funcLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(10*AdapterScal);
        make.left.equalTo(lineView);
        make.right.equalTo(self).offset(-12);
    }];
    
    UILabel *label = [UILabel new];
    label.text = @"相关推荐";
    label.textColor = UIColor000;
    label.font = UIFont16;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.funcLabel);
        make.top.equalTo(self.funcLabel.mas_bottom).offset(30*AdapterScal);
        make.bottom.equalTo(self).offset(-12*AdapterScal);
    }];
}

- (UIImageView *)themeImage
{
    if (!_themeImage) {
        _themeImage = [UIImageView new];
        _themeImage.backgroundColor = [UIColor redColor];
        [self addSubview:_themeImage];
    }
    return _themeImage;
}

- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        _stateLabel = [UILabel new];
        _stateLabel.font = UIFont16;
        _stateLabel.text = @"瓶酒的做法";
        _stateLabel.textColor = UIColor000;
        [self addSubview:_stateLabel];
    }
    return _stateLabel;
}

- (UILabel *)funcLabel
{
    if (!_funcLabel) {
        _funcLabel = [UILabel new];
        _funcLabel.text = @"啤酒是以小麦芽和大麦芽为主要原料，并加啤酒花，经过液态糊化和糖化，再经过液态发酵而酿制成的。其酒精含量较低，含有二氧化碳,富有营养。它含有多种氨基酸、维生素、低分子糖、无机盐和各种酶。这些营养成分人体容易吸收利用。啤酒中的低分子糖和氨基酸很易被消化吸收，在体内产生大量热能，因此往往啤酒被人们称为“液体面包”。1L12°Bx 的啤酒，可产生3 344kJ 热量，相当于3~5 个鸡蛋或210g面包所产生热量。一个轻体力劳动者，如果一天能饮用1L 啤酒，即可获得所需热量的三分之一";
        _funcLabel.textColor = UIColor666;
        _funcLabel.font = UIFont14;
        _funcLabel.numberOfLines = 0;
        [self addSubview:_funcLabel];
    }
    return _funcLabel;
}
@end
