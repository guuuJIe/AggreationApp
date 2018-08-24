//
//  JSShopCarHeadView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSShopCarHeadView.h"
@interface JSShopCarHeadView()
@property (nonatomic , strong) UIButton *selButton;
@property (nonatomic , strong) UIImageView *headImage;
@property (nonatomic , strong) UILabel *namelabel;
@end

@implementation JSShopCarHeadView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.contentView.layer.shadowOffset = CGSizeMake(-3, -9.5);
        self.contentView.layer.shadowOpacity = 0.2;
        self.contentView.layer.shadowRadius = 3;
        
        
        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(13,0,ScreenWidth-12,50)];
        [view2 setFrame:CGRectMake(0, 0, ScreenWidth-24, 40)];
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
        
       
        [self setupLayout];
    }
    return self;
}


- (void)setupLayout
{
    
    [self.selButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(0*AdapterScal);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selButton.mas_right).offset(10*AdapterScal);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(8*AdapterScal);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)selectBtnClick:(UIButton *)sender
{
    
    sender.selected = !sender.selected;
    if (self.ClickBlock) {
        self.ClickBlock(sender.selected);
    }
    
    
}

- (UIImageView *)headImage
{
    if (!_headImage) {
        _headImage = [UIImageView new];
        _headImage.contentMode = UIViewContentModeScaleAspectFit;
        _headImage.image = [UIImage imageNamed:@"Home_unsel"];
        [self.contentView addSubview:_headImage];
    }
    return _headImage;
}

- (UIButton *)selButton
{
    if (!_selButton) {
        _selButton = [UIButton new];
        [_selButton setTitle:@"\U0000e72f" forState:0];
        [_selButton setTitleColor:UIColor333 forState:0];
        [_selButton.titleLabel setFont:iconFontSize(20)];
        [_selButton setTitleColor:UIColor495e forState:UIControlStateSelected];
        [_selButton addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_selButton];
    }
    return _selButton;
}

- (UILabel *)namelabel
{
    if (!_namelabel) {
        _namelabel = [UILabel new];
        _namelabel.text = @"酒水旗舰店";
        _namelabel.numberOfLines = 0;
        _namelabel.textColor = UIColor333;
        _namelabel.font = UIFont14;
        [self.contentView addSubview:_namelabel];
    }
    return _namelabel;
}


@end
