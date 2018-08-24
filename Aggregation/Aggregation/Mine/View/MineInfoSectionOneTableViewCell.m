//
//  MineInfoSectionOneTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "MineInfoSectionOneTableViewCell.h"
#import "MineOrderView.h"
#import "MineConsumptionView.h"
#import "MemberView.h"
#import "NonMemberView.h"

@interface MineInfoSectionOneTableViewCell()
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *companyLabel;
@property (nonatomic , strong) UIImageView *setImage;

@property (nonatomic , strong) MemberView *memberView;
@property (nonatomic , strong) NonMemberView *nonMemberView;

@property (nonatomic , strong) UIImageView *headImage;
@property (nonatomic , strong) MineOrderView *orderView;
@property (nonatomic , strong) MineConsumptionView *consumpView;
@end

@implementation MineInfoSectionOneTableViewCell

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
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupLayout];
    }
    
    return self;
}

- (void)setupLayout
{
   
    UIImageView *view = [UIImageView new];
    view.image = [UIImage imageNamed:@"bgview"];
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.bottom.equalTo(self.headImage.mas_bottom).offset(40);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(22*AdapterScal+StauesBarHeight);
        make.left.equalTo(self.contentView).offset(14*AdapterScal);
    }];
    
    [self.setImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel);
        make.right.equalTo(self.contentView).offset(-14*AdapterScal);
        make.size.mas_equalTo(CGSizeMake(23, 23));
    }];
    
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(24*AdapterScal);
        make.size.mas_equalTo(CGSizeMake(70*AdapterScal, 70*AdapterScal));
        make.left.mas_equalTo(self.titleLabel);
    }];
    
    
    [self.memberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage);
        make.left.equalTo(self.headImage.mas_right).offset(12*AdapterScal);
        make.right.mas_equalTo(self.contentView).offset(-10*AdapterScal);
    }];
    
//    [self.companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.headImage).offset(14*AdapterScal);
//        make.left.equalTo(self.headImage.mas_right).offset(14*AdapterScal);
//        make.width.mas_equalTo(180*AdapterScal);
//    }];
//
//    UIImageView *iconImage = [[UIImageView alloc] init];
//    iconImage.image = [UIImage imageNamed:@"member_icon_1"];
//    iconImage.contentMode = UIViewContentModeScaleAspectFit;
//    [self.contentView addSubview:iconImage];
//    [iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.companyLabel.mas_right).offset(14*AdapterScal);
//        make.centerY.equalTo(self.companyLabel);
//    }];
    
    self.orderView = [[MineOrderView alloc] init];
    [self.contentView addSubview:self.orderView];
    [self clickWithOrderView:self.orderView];
    [self.orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(20*AdapterScal);
        make.left.equalTo(self.contentView).offset(13*AdapterScal);
        make.right.equalTo(self.contentView).offset(-13*AdapterScal);
//        make.bottom.equalTo(self.contentView).offset(-80*AdapterScal);
    }];
    
    self.consumpView = [[MineConsumptionView alloc] init];
    [self.contentView addSubview:self.consumpView];
    [self.consumpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderView.mas_bottom).offset(24*AdapterScal);
        make.left.equalTo(self.contentView).offset(13*AdapterScal);
        make.right.equalTo(self.contentView).offset(-13*AdapterScal);
        make.bottom.equalTo(self.contentView).offset(-40*AdapterScal);
    }];
}


- (void)clickWithOrderView:(MineOrderView *)orderView
{
    WeakSelf(self);
    orderView.clickBlock = ^(NSInteger tag) {
        if (weakself.clickBlock) {
            weakself.clickBlock(tag);
        }
    };
}
//- (void)click
//{
//    if (self.setClickBlock) {
//        self.setClickBlock();
//    }
//}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColorfff;
        _titleLabel.text = @"我的";
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView *)setImage
{
    if (!_setImage) {
        _setImage = [UIImageView new];
        _setImage.image = [UIImage imageNamed:@"Setting"];
        [self.contentView addSubview:_setImage];
    }
    return _setImage;
}

- (UIImageView *)headImage
{
    if (!_headImage) {
        _headImage = [UIImageView new];
        _headImage.layer.cornerRadius = 4;
        _headImage.layer.masksToBounds = YES;
        _headImage.backgroundColor = UIColor1f13;
        [self.contentView addSubview:_headImage];
    }
    return _headImage;
}

//- (UILabel *)companyLabel
//{
//    if (!_companyLabel) {
//        _companyLabel = [UILabel new];
//        _companyLabel.text = @"酒商酒汇网络科技哟徐爱你公司";
//        _companyLabel.userInteractionEnabled = YES;
//        _companyLabel.font = [UIFont boldSystemFontOfSize:16];
//        _companyLabel.textColor = UIColorfff;
//        [_companyLabel addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)]];
//        [self.contentView addSubview:_companyLabel];
//    }
//    return _companyLabel;
//}


- (MemberView *)memberView
{
    if (!_memberView) {
        _memberView = [[MemberView alloc] init];
        WeakSelf(self);
        _memberView.clickBlock = ^{
            if (weakself.setClickBlock) {
                weakself.setClickBlock();
            }
        };
        [self.contentView addSubview:_memberView];
    }
    return _memberView;
}

- (NonMemberView *)nonMemberView
{
    if (!_nonMemberView) {
        _nonMemberView = [[NonMemberView alloc] init];
        [self.contentView addSubview:_nonMemberView];
    }
    return _nonMemberView;
}
@end
