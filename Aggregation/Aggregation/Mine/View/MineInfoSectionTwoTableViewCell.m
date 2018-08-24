//
//  MineInfoSectionTwoTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "MineInfoSectionTwoTableViewCell.h"

@interface MineInfoSectionTwoTableViewCell()
@property (nonatomic , strong) UIImageView *iconImage;
@property (nonatomic , strong) UILabel *leftLabel;

@end

@implementation MineInfoSectionTwoTableViewCell

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
//        self.backgroundColor = [UIColor clearColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10*AdapterScal);
        make.left.equalTo(self.contentView).offset(14*AdapterScal);
        make.bottom.equalTo(self.contentView).offset(-12*AdapterScal);
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImage.mas_right).offset(10*AdapterScal);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-14*AdapterScal);
        make.centerY.equalTo(self.contentView);
    }];
    
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColor666;
    lineview.alpha = 0.2;
    [self.contentView addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconImage);
        make.height.mas_equalTo(JLineHeight);
        make.right.equalTo(self.rightLabel).offset(0);
        make.bottom.equalTo(self.contentView);
    }];
}

- (void)setupData:(NSDictionary *)dic
{
    self.iconImage.image = [UIImage imageNamed:dic[@"image"]];
    self.leftLabel.text = dic[@"leftText"];
}

- (UIImageView *)iconImage
{
    if (!_iconImage) {
        _iconImage = [UIImageView new];
        _iconImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_iconImage];
    }
    return _iconImage;
}

- (UILabel *)leftLabel
{
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.font = UIFont14;
        _leftLabel.textColor = UIColor333;
        [self.contentView addSubview:_leftLabel];
    }
    return _leftLabel;
}

- (UILabel *)rightLabel
{
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.font = iconFontSize(16);
        _rightLabel.text = @"\U0000e6a7";
        _rightLabel.textColor = UIColor666;
        [self.contentView addSubview:_rightLabel];
    }
    return _rightLabel;
}
@end
