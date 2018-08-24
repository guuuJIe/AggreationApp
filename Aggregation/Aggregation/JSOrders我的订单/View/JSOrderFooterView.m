//
//  JSOrderFooterView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#define TableViewFooterBottomHeight 50

#import "JSOrderFooterView.h"
#import "GoodsStautesOperationView.h"

@interface JSOrderFooterView()
@property (nonatomic , strong) GoodsStautesOperationView *optionView;
@property (nonatomic , strong) UILabel *goodsLabel;
@end

@implementation JSOrderFooterView

-(CGFloat)cellHeight{
    CGFloat height = 45 *AdapterScal;
    if(self.optionView.btnModelArray.count>0){
        height = height + TableViewFooterBottomHeight;
    }
    return height;
}


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
//        //得到view的遮罩路径

    }
    return self;
}

- (void)setupLayout
{
    UIView *bgview = [UIView new];
    bgview.backgroundColor = UIColorfafa;
    [self.contentView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColore5e5;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    [self.goodsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(12*AdapterScal);
        make.right.equalTo(self.contentView).offset(-20*AdapterScal);
    }];
    
    UIView *lineView2 = [UIView new];
    lineView2.backgroundColor = UIColore5e5;
    [self.contentView addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsLabel.mas_bottom).offset(12);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    [self.optionView setOrderOption];
    [self.optionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgview).offset(0);
        make.right.equalTo(bgview).offset(0);
        make.height.mas_equalTo(TableViewFooterBottomHeight);
        make.top.equalTo(lineView2.mas_bottom).offset(0*AdapterScal);
    }];
    [self.contentView layoutIfNeeded];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(13,0,ScreenWidth-12,50)];
    [view2 setFrame:CGRectMake(12, CGRectGetMaxY(self.optionView.frame), ScreenWidth-24, 10)];
    view2.backgroundColor = UIColorfafa;
    [self.contentView addSubview:view2];
    
    //设置切哪个直角
    //    UIRectCornerTopLeft     = 1 << 0,  左上角
    //    UIRectCornerTopRight    = 1 << 1,  右上角
    //    UIRectCornerBottomLeft  = 1 << 2,  左下角
    //    UIRectCornerBottomRight = 1 << 3,  右下角
    //    UIRectCornerAllCorners  = ~0UL     全部角
    //得到view的遮罩路径
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8,8)];
    //创建 layer
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = view2.bounds;
    //赋值
    maskLayer.path = maskPath.CGPath;
    view2.layer.mask = maskLayer;
    
  
    
}

- (GoodsStautesOperationView *)optionView
{
    if (!_optionView) {
        _optionView = [GoodsStautesOperationView new];
        _optionView.userInteractionEnabled = YES;
//        _optionView.hidden = YES;
        WeakSelf(self);
        _optionView.orderHandleBlock = ^(NSString *flag) {
            StrongSelf(self);
            if (self.clickBlock) {
                self.clickBlock(flag);
            }
        };
        [self.contentView addSubview:_optionView];
    }
    return _optionView;
}

- (UILabel *)goodsLabel
{
    if (!_goodsLabel) {
        _goodsLabel = [UILabel new];
        _goodsLabel.text = @"共154件商品 合计: ¥599";
        _goodsLabel.font = UIFont14;
        _goodsLabel.textColor = UIColor333;
        [self.contentView addSubview:_goodsLabel];
    }
    return _goodsLabel;
    
}

@end
