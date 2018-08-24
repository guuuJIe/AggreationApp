//
//  JSTopSelectView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/20.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSTopSelectView.h"
#import "UnderLineButton.h"
@interface JSTopSelectView()

@end
@implementation JSTopSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UIView *lastView;
    UnderLineButton *button;
    UIButton *salesBtn;
    NSArray *arr = @[@"默认",@"销量",@"新品"];
    for (int i = 0; i<arr.count; i++) {
       
        
        if (i != 1) {
            button = [UnderLineButton new];
            
            [button setTitle:arr[i] forState:0];
            [button setTitleColor:UIColor666 forState:0];
            [button setBackgroundColor:UIColorfff];
            [button setTitleColor:UIColor4a58 forState:UIControlStateSelected];
            button.lineView.backgroundColor = UIColor4a58;
           
            button.tag = i+200;
             [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                if (i == 0) {
                    make.left.equalTo(self);
                }else if(i == 2){
                    make.left.equalTo(salesBtn.mas_right);
                }
                make.top.equalTo(self).offset(0*AdapterScal);
                make.width.mas_equalTo(ScreenWidth/3);
                make.height.mas_equalTo(45*AdapterScal);
                make.bottom.equalTo(self).offset(0*AdapterScal);
            }];
            lastView = button;
            
        }else{
            salesBtn = [[UIButton alloc] init];
            [salesBtn setTitle:arr[i] forState:0];
            [salesBtn setTitleColor:UIColor666 forState:0];
            [salesBtn setBackgroundColor:UIColorfff];
            [salesBtn setTitleColor:UIColor4a58 forState:UIControlStateSelected];
            [salesBtn addTarget:self action:@selector(priceDes:) forControlEvents:UIControlEventTouchUpInside];
            [salesBtn sizeToFit];
            [salesBtn.titleLabel setFont:UIFont14];
            [salesBtn setImage:[UIImage imageNamed:@"soft_icon"] forState:0];
            [button.titleLabel setTextAlignment:NSTextAlignmentLeft];
            [salesBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 80, 0, 0)];
            [self addSubview:salesBtn];
            [salesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(lastView.mas_right);
                make.top.equalTo(self).offset(0*AdapterScal);
                make.width.mas_equalTo(ScreenWidth/3);
                make.height.mas_equalTo(45*AdapterScal);
                make.bottom.equalTo(self).offset(0*AdapterScal);
            }];
            
        }
       
    }
    
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColorf4f4;
    [self addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.right.equalTo(self).offset(-14);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
    UnderLineButton *defaultButton = [self viewWithTag:200];
    [self click:defaultButton];
}

- (void)priceDes:(UnderLineButton*)button
{
    button.selected = !button.selected;
    if (button.selected) {
        
    }else{
        
    }
}

- (void)click:(UnderLineButton *)button
{
    if(!button.selected){
        button.selected = !button.selected;
        
        NSInteger tag = button.tag==200?202:200;
        
        UnderLineButton *otherButton = [self viewWithTag:tag];
        otherButton.selected = NO;
    }
    if (self.clickBlock) {
        self.clickBlock(button.tag);
    }
}
@end
