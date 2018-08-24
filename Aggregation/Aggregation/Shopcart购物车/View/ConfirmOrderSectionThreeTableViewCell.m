//
//  ConfirmOrderSectionThreeTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ConfirmOrderSectionThreeTableViewCell.h"

@implementation ConfirmOrderSectionThreeTableViewCell

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
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColore5e5;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.top.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-12);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"付款方式";
    titleLabel.textColor = UIColor333;
    titleLabel.font = UIFont14;
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.top.equalTo(lineView.mas_bottom).offset(16);
    }];
    
    UILabel *titleLabel2 = [UILabel new];
    titleLabel2.text = @"货到付款";
    titleLabel2.textColor = UIColor333;
    titleLabel2.font = UIFont14;
    [self.contentView addSubview:titleLabel2];
    [titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-30);
        make.centerY.equalTo(titleLabel);
    }];
    
    UILabel *iconLabel = [UILabel new];
    iconLabel.text = @"\U0000e6a7";
    iconLabel.textColor = UIColor333;
    iconLabel.font = iconFontSize(20);
    [self.contentView addSubview:iconLabel];
    [iconLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(titleLabel2);
    }];
    
    UILabel *stateLabel = [UILabel new];
    stateLabel.text = @"商家留言";
    stateLabel.textColor = UIColor333;
    stateLabel.font = UIFont14;
    [self.contentView addSubview:stateLabel];
    [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel).offset(0);
        make.top.equalTo(titleLabel.mas_bottom).offset(16);
    }];
    
    UILabel *stateLabel2 = [UILabel new];
    stateLabel2.text = @"需要包装";
    stateLabel2.textColor = UIColor333;
    stateLabel2.font = UIFont14;
    [self.contentView addSubview:stateLabel2];
    [stateLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-30);
        make.centerY.equalTo(stateLabel);
        make.bottom.equalTo(self.contentView).offset(-14*AdapterScal);
    }];
    
    UILabel *iconLabel2 = [UILabel new];
    iconLabel2.text = @"\U0000e6a7";
    iconLabel2.textColor = UIColor333;
    iconLabel2.font = iconFontSize(23);
    [self.contentView addSubview:iconLabel2];
    [iconLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        make.centerY.equalTo(stateLabel2);
        make.bottom.equalTo(self.contentView).offset(-14*AdapterScal);
    }];
}

@end
