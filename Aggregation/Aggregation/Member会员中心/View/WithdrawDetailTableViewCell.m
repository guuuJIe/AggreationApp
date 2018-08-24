//
//  WithdrawDetailTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "WithdrawDetailTableViewCell.h"

@interface WithdrawDetailTableViewCell()
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *subtitLabel;
@end

@implementation WithdrawDetailTableViewCell

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
        [self setLayout];
    }
    return self;
}

- (void)setLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.subtitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(90);
        make.centerY.equalTo(self.contentView);
    }];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"当前状态";
        _titleLabel.textColor = UIColor666;
        _titleLabel.font = UIFont12;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)subtitLabel
{
    if (!_subtitLabel) {
        _subtitLabel = [UILabel new];
        _subtitLabel.text = @"支付成功";
        _subtitLabel.textColor = UIColor666;
        _subtitLabel.font = UIFont12;
        [self.contentView addSubview:_subtitLabel];
    }
    return _subtitLabel;
}
@end
