//
//  ClassificationCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ClassificationCollectionViewCell.h"
@interface ClassificationCollectionViewCell()
@property (nonatomic , strong) UIImageView *classifyImage;
@property (nonatomic , strong) UILabel *titleLabel;
@end

@implementation ClassificationCollectionViewCell

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
    [self.classifyImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(0*AdapterScal);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.classifyImage.mas_bottom).offset(2*AdapterScal);
    }];
}

- (void)setupData:(NSDictionary *)dic
{
    self.classifyImage.image = [UIImage imageNamed:dic[@"imageName"]];
    self.titleLabel.text = dic[@"title"];
}

- (UIImageView *)classifyImage
{
    if (!_classifyImage) {
        _classifyImage = [UIImageView new];
        _classifyImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_classifyImage];
    }
    return _classifyImage;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = UIFont14;
        _titleLabel.textColor = UIColor666;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}
@end
