//
//  JSMemberCenterSectionTwoTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSMemberCenterSectionTwoTableViewCell.h"

@interface JSMemberCenterSectionTwoTableViewCell()
@property (nonatomic , strong) UILabel *namelabel;
@property (nonatomic , strong) UILabel *moneyLabel;
@end

@implementation JSMemberCenterSectionTwoTableViewCell

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
        make.right.equalTo(bgView).offset(-12);
    }];
}

- (UILabel *)namelabel
{
    if (!_namelabel) {
        _namelabel = [UILabel new];
        _namelabel.text = @"巴巴爸爸爸爸商店";
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
