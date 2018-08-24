//
//  GuseeYoulikeCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "GuseeYoulikeCollectionViewCell.h"
#import "UIView+Category.h"
@interface GuseeYoulikeCollectionViewCell()
@property (nonatomic , strong) UIImageView *headImage;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *pricelabel;
@end

@implementation GuseeYoulikeCollectionViewCell

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
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self).offset(15);
        
        make.height.mas_equalTo(100*AdapterScal);
        make.width.mas_equalTo(100*AdapterScal);
    }];
    
    [self.headImage layoutIfNeeded];
    [self.headImage setCornerRadius:4 withShadow:YES withOpacity:0.4];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(12);
        make.left.equalTo(self.headImage);
        make.width.mas_equalTo(self.headImage);
    }];
    
    [self.pricelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10*AdapterScal);
    }];
}

- (UIImageView *)headImage
{
    if (!_headImage) {
        _headImage = [UIImageView new];
        _headImage.layer.cornerRadius = JLittleCornerRadius;
        _headImage.layer.masksToBounds = YES;
        _headImage.backgroundColor = UIColorf4f4;
        
//        _headImage.image = [UIImage imageNamed:@"logo"];
    
        [self.contentView addSubview:_headImage];
    }
    return _headImage;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = UIColor333;
        _titleLabel.font = UIFont14;
        _titleLabel.text = @"格兰威特法国格兰威特法国";
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)pricelabel
{
    if (!_pricelabel) {
        _pricelabel = [UILabel new];
        _pricelabel.textColor = UIColor333;
        _pricelabel.font = UIFont14;
        _pricelabel.text = @"800元/箱";
        [self.contentView addSubview:_pricelabel];
    }
    return _pricelabel;
}
@end
