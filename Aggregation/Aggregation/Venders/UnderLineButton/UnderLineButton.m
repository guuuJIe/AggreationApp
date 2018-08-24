//
//  UnderLineButton.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "UnderLineButton.h"

@implementation UnderLineButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupLayout];
    }
    return self;
}
- (void)setupLayout
{
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
        make.width.mas_equalTo(64);
        make.height.mas_equalTo(4);
    }];
    
    
    
    self.titleLabel.font = [UIFont systemFontOfSize:14];
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super setTitle:title forState:state];
    [self.titleLabel sizeToFit];
    
    [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        if(self.l_width == 0){
            make.width.mas_equalTo(self.titleLabel.frame.size.width-10);
        }else if(self.l_width != 0){
            make.width.mas_equalTo(self.l_width);
        }
        
    }];
    [self updateConstraints];
    [self updateConstraintsIfNeeded];
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.lineView.hidden = !selected;
}

-(UIView *)lineView{
    if(!_lineView)
    {
        _lineView = [UIView new];
        _lineView.backgroundColor = UIColor495e;
        _lineView.hidden = YES;
    }
    return _lineView;
}
@end
