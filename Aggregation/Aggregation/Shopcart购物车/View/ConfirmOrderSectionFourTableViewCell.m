//
//  ConfirmOrderSectionFourTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ConfirmOrderSectionFourTableViewCell.h"

@implementation ConfirmOrderSectionFourTableViewCell

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
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColore5e5;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.top.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-12);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *jiner = [UILabel new];
    jiner.text = @"商家金额";
    jiner.textColor = UIColor333;
    jiner.font = UIFont14;
    [self.contentView addSubview:jiner];
    [jiner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView).offset(0);
        make.top.equalTo(lineView.mas_bottom).offset(16);
    }];
    
    UILabel *jinerValue = [UILabel new];
    jinerValue.text = @"¥599.00";
    jinerValue.textColor = UIColor333;
    jinerValue.font = UIFont14;
    [self.contentView addSubview:jinerValue];
    [jinerValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(jiner);
    }];
    
    UILabel *yunfei = [UILabel new];
    yunfei.text = @"运费";
    yunfei.textColor = UIColor333;
    yunfei.font = UIFont14;
    [self.contentView addSubview:yunfei];
    [yunfei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView).offset(0);
        make.top.equalTo(jiner.mas_bottom).offset(16*AdapterScal);
    }];
    
    UILabel *yunfeiValue = [UILabel new];
    yunfeiValue.text = @"¥599.00";
    yunfeiValue.textColor = UIColor333;
    yunfeiValue.font = UIFont14;
    [self.contentView addSubview:yunfeiValue];
    [yunfeiValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(yunfei);
    }];
    
    UILabel *zhifu = [UILabel new];
    zhifu.text = @"实际支付";
    zhifu.textColor = UIColor333;
    zhifu.font = UIFont14;
    [self.contentView addSubview:zhifu];
    [zhifu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(yunfei).offset(0);
        make.top.equalTo(yunfei.mas_bottom).offset(16*AdapterScal);
    }];
    
    UILabel *zhifuValue = [UILabel new];
    zhifuValue.text = @"¥599.00";
    zhifuValue.textColor = UIColorf4f4;
    zhifuValue.font = UIFont14;
    [self.contentView addSubview:zhifuValue];
    [zhifuValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(zhifu);
        make.bottom.equalTo(self.contentView).offset(-14*AdapterScal);
    }];
    
}
@end
