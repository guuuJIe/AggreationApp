//
//  OrderTopView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "OrderTopView.h"
#import "UnderLineButton.h"
@interface OrderTopView()
@property (nonatomic , strong) UIView *bgView;
@property (nonatomic , strong) UnderLineButton *selectedBtn;
@end
@implementation OrderTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
//        UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(13,0,ScreenWidth-12,50)];
//        [view2 setFrame:CGRectMake(10, 35, ScreenWidth-24, 40)];
//        view2.backgroundColor = [UIColor whiteColor];
//        [self addSubview:view2];
//
//        //设置切哪个直角
//        //    UIRectCornerTopLeft     = 1 << 0,  左上角
//        //    UIRectCornerTopRight    = 1 << 1,  右上角
//        //    UIRectCornerBottomLeft  = 1 << 2,  左下角
//        //    UIRectCornerBottomRight = 1 << 3,  右下角
//        //    UIRectCornerAllCorners  = ~0UL     全部角
//        //得到view的遮罩路径
//        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8,8)];
//        //创建 layer
//        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.frame = view2.bounds;
//        //赋值
//        maskLayer.path = maskPath.CGPath;
//        view2.layer.mask = maskLayer;
//
//        self.bgView = view2;
        self.userInteractionEnabled = YES;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    
    UIImageView *imageView2 = [UIImageView new];
    imageView2.image = [UIImage imageNamed:@"circle"];
    [self addSubview:imageView2];
    imageView2.userInteractionEnabled = YES;
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];

    UIView *lastView;
    NSArray *arr = @[@"总订单",@"待接单",@"待收货",@"待退货"];
    for (int i = 0; i<arr.count; i++) {
        UnderLineButton *button = [UnderLineButton new];
        button.lineView.backgroundColor = UIColor4a58;
        button.l_width = 50;
        [button setTitle:arr[i] forState:0];
        [button setTitleColor:UIColor666 forState:0];
        [button setBackgroundColor:UIColorfff];
        [button setTitleColor:UIColor4a58 forState:UIControlStateSelected];
        button.tag = i+200;
        [self addSubview:button];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self).offset(1);
            }else{
                make.left.equalTo(lastView.mas_right);
            }
            make.top.equalTo(self).offset(3);
            make.width.mas_equalTo(ScreenWidth/4-2);
            make.bottom.equalTo(self).offset(0*AdapterScal);
        }];
        lastView = button;
    }
    
    UIView *line = [UIView new];
    line.backgroundColor = UIColore5e5;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(JLineHeight);
        make.top.equalTo(lastView.mas_bottom).offset(0);
    }];
    UnderLineButton *button = [self viewWithTag:200];
    [self click:button];
}

- (void)click:(UnderLineButton *)btn
{
    if (btn!= self.selectedBtn) {
        self.selectedBtn.selected = NO;
        btn.selected = YES;
        self.selectedBtn = btn;
    }else{
        self.selectedBtn.selected = YES;
    }
    if (self.clickBlock) {
        self.clickBlock(btn.tag);
    }
}

@end
