//
//  JSMemberCenterSectionOneTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSMemberCenterSectionOneTableViewCell.h"
#import "DeadlineView.h"
#import "UIView+Category.h"
#import "RebateView.h"
@interface JSMemberCenterSectionOneTableViewCell()
@property (nonatomic , strong) DeadlineView *timeView;
@property (nonatomic , strong) RebateView *rebateView;
@end
@implementation JSMemberCenterSectionOneTableViewCell

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
    UIImageView *headImage = [UIImageView new];
    headImage.image = [UIImage imageNamed:@"bgview"];

    [self.contentView addSubview:headImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
    
        make.height.mas_equalTo(160*AdapterScal);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"会员中心";
    titleLabel.textColor = UIColorfff;
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [self.contentView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headImage).offset(10*AdapterScal);
        make.left.equalTo(self.contentView).offset(14);
    }];
    
    [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(18*AdapterScal);
        make.left.equalTo(self.contentView).offset(14);
        make.right.equalTo(self.contentView).offset(-14);
    }];
    [self.timeView layoutIfNeeded];
    [self.timeView setCornerRadius:4 withShadow:YES withOpacity:0.5];
    
    UILabel *inviationLabel = [UILabel new];
    inviationLabel.text = @"邀请码";
    inviationLabel.textColor = UIColor333;
    inviationLabel.font = UIFont20;
    [self.contentView addSubview:inviationLabel];
    [inviationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeView.mas_bottom).offset(40*AdapterScal);
        make.left.equalTo(self.contentView).offset(14);
    }];
    
    UILabel *inviationcode = [UILabel new];
    inviationcode.text = @"你的邀请码是:77930";
    inviationcode.textColor = UIColor333;
    inviationcode.font = UIFont14;
    [self.contentView addSubview:inviationcode];
    [inviationcode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inviationLabel.mas_bottom).offset(10*AdapterScal);
        make.left.equalTo(self.contentView).offset(14);
    }];
    
    UIImageView *rightImage = [[UIImageView alloc] init];
    rightImage.contentMode = UIViewContentModeScaleAspectFit;
    rightImage.image = [UIImage imageNamed:@"member_icon_8"];
    [self.contentView addSubview:rightImage];
    [rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeView.mas_bottom).offset(16);
        make.right.equalTo(self.contentView).offset(-30);
    }];
    
    UIImageView *arrowImage = [[UIImageView alloc] init];
    arrowImage.contentMode = UIViewContentModeScaleAspectFit;
    arrowImage.image = [UIImage imageNamed:@"member_icon_4"];
    [self.contentView addSubview:arrowImage];
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(rightImage);
        make.right.equalTo(self.contentView).offset(-12);
    }];
    
    [self.rebateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.contentView);
        make.top.equalTo(rightImage.mas_bottom).offset(20*AdapterScal);
    }];
    
    UILabel *subLabel = [UILabel new];
    subLabel.text = @"邀请成功下级";
    subLabel.textColor = UIColor333;
    subLabel.font = UIFont16;
    [self.contentView addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rebateView.mas_bottom).offset(20*AdapterScal);
        make.left.equalTo(self.contentView).offset(14);
        make.bottom.equalTo(self.contentView).offset(-16*AdapterScal);
    }];
    
}

- (DeadlineView *)timeView
{
    if (!_timeView) {
        _timeView = [[DeadlineView alloc] init];
        WeakSelf(self);
        _timeView.clickBlock = ^{
            if (weakself.clickBlock) {
                weakself.clickBlock();
            }
        };
        [self.contentView addSubview:_timeView];
    }
    return _timeView;
}


- (RebateView *)rebateView
{
    if (!_rebateView) {
        _rebateView = [[RebateView alloc] init];
        WeakSelf(self);
        _rebateView.clickBlock = ^(NSInteger tag) {
            weakself.withdrawClickBlock(tag);
        };
        [self.contentView addSubview:_rebateView];
    }
    return _rebateView;
}

@end
