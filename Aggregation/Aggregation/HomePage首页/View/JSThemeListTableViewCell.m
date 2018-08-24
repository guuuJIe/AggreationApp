//
//  JSThemeListTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSThemeListTableViewCell.h"

@interface JSThemeListTableViewCell()
@property (nonatomic , strong) UIImageView *themeImage;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *subTitleLabel;
@property (nonatomic , strong) UILabel *priceLabel;
@property (nonatomic , strong) UILabel *newLabel;
@end

@implementation JSThemeListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.themeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(14*AdapterScal);
        make.top.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView).offset(-14*AdapterScal);
        make.height.mas_equalTo(170*AdapterScal);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.themeImage.mas_bottom).offset(12*AdapterScal);
        make.left.equalTo(self.themeImage);
        make.width.mas_equalTo(220*AdapterScal);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(8*AdapterScal);
        make.left.equalTo(self.titleLabel);
        make.width.mas_equalTo(200*AdapterScal);
        make.bottom.mas_equalTo(self.contentView).offset(-15*AdapterScal);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.themeImage.mas_right);
        make.top.equalTo(self.titleLabel);
    }];
    
    [self.newLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.themeImage).offset(14*AdapterScal);
        make.left.equalTo(self.themeImage).offset(-3);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶";
        _titleLabel.font = UIFont14;
        _titleLabel.textColor = UIColor333;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [UILabel new];
        _subTitleLabel.text = @"格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶格兰威特翻过橡木桶";
        _subTitleLabel.font = UIFont12;
        _subTitleLabel.textColor = UIColor999;
        [self.contentView addSubview:_subTitleLabel];
    }
    return _subTitleLabel;
}

- (UIImageView *)themeImage
{
    if (!_themeImage) {
        _themeImage = [UIImageView new];
        _themeImage.backgroundColor = ThemeColor;
        _themeImage.layer.cornerRadius = 4;
        _themeImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_themeImage];
    }
    return _themeImage;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.text = @"800元/箱";
        _priceLabel.font = UIFont14;
        _priceLabel.textColor = UIColor495e;
        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}

- (UILabel *)newLabel
{
    if (!_newLabel) {
        _newLabel = [UILabel new];
        _newLabel.backgroundColor = UIColor495e;
        _newLabel.text = @"NEW";
        _newLabel.font = UIFont15;
        _newLabel.textAlignment = NSTextAlignmentCenter;
        _newLabel.textColor = UIColorfff;
        [self.contentView addSubview:_newLabel];
    }
    return _newLabel;
}


@end
