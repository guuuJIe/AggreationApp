//
//  JSWithdrawSectionTwoTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSWithdrawSectionTwoTableViewCell.h"

@interface JSWithdrawSectionTwoTableViewCell()
@property (nonatomic , strong) UILabel *namelabel;
@property (nonatomic , strong) UILabel *moneyLabel;
@end

@implementation JSWithdrawSectionTwoTableViewCell

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
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = UIColorf4f4;
    bgView.layer.cornerRadius = 3;
    bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(14);
        make.right.equalTo(self.contentView).offset(-14);
        make.height.mas_equalTo(50*AdapterScal);
    }];
    
    
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.equalTo(bgView).offset(12);
    }];
    
    [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.right.equalTo(bgView).offset(-20);
    }];
    
    UILabel *label = [UILabel new];
    label.text = @"\U0000e6a7";
    label.textColor = UIColor666;
    label.font = iconFontSize(20);
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(self.contentView);
    }];
}

- (UILabel *)namelabel
{
    if (!_namelabel) {
        _namelabel = [UILabel new];
        _namelabel.text = @"2018-07-17";
        _namelabel.textColor = UIColor333;
        _namelabel.font = UIFont14;
        [self.contentView addSubview:_namelabel];
    }
    return _namelabel;
}

- (UILabel *)moneyLabel
{
    if (!_moneyLabel) {
        _moneyLabel = [UILabel new];
        _moneyLabel.text = @"返利: ¥1111";
        _moneyLabel.textColor = UIColor666;
        _moneyLabel.font = UIFont12;
        [self.contentView addSubview:_moneyLabel];
    }
    return _moneyLabel;
}
@end
