//
//  JSWithdrawTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSWithdrawTableViewCell.h"
#import "UnderLineButton.h"
@interface JSWithdrawTableViewCell()
@property (nonatomic , strong) UILabel *moneyLbl;
@property (nonatomic , strong) UILabel *monetLbl2;
@end
@implementation JSWithdrawTableViewCell

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
    UIImageView *topImage = [[UIImageView alloc] init];
    topImage.image = [UIImage imageNamed:@"withdraw_1"];
    topImage.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:topImage];
    [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
//        make.bottom.equalTo(self.contentView);
    }];
    
    UILabel *moneyLable = [UILabel new];
    moneyLable.text = @"可提现返利金额";
    moneyLable.textColor = UIColorfff;
    moneyLable.font = UIFont14;
    [self.contentView addSubview:moneyLable];
    [moneyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topImage).offset(36*AdapterScal);
        make.top.equalTo(topImage).offset(30*AdapterScal);
    }];
    
    UILabel *moneyLable2 = [UILabel new];
    moneyLable2.text = @"¥ 3331.00";
    moneyLable2.textColor = UIColorfff;
    moneyLable2.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:moneyLable2];
    [moneyLable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(moneyLable);
        make.top.equalTo(moneyLable.mas_bottom).offset(10*AdapterScal);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = UIColorfff;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topImage);
        make.width.mas_equalTo(JLineHeight);
        make.top.equalTo(topImage).offset(30*AdapterScal);
        make.bottom.equalTo(topImage).offset(-40*AdapterScal);
    }];
    
    UILabel *moneyLable3 = [UILabel new];
    moneyLable3.text = @"处理返利金额";
    moneyLable3.textColor = UIColorfff;
    moneyLable3.font = UIFont14;
    [self.contentView addSubview:moneyLable3];
    [moneyLable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topImage).offset(-40*AdapterScal);
        make.top.equalTo(topImage).offset(30*AdapterScal);
    }];
    
    UILabel *moneyLable4 = [UILabel new];
    moneyLable4.text = @"¥ 3331.00";
    moneyLable4.textColor = UIColorfff;
    moneyLable4.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:moneyLable4];
    [moneyLable4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(moneyLable3);
        make.top.equalTo(moneyLable3.mas_bottom).offset(10*AdapterScal);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:@"withdraw_2"] forState:0];
    [button addTarget:self action:@selector(withdraw) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(topImage);
        make.bottom.equalTo(topImage).offset(10*AdapterScal);
    }];
    
    UIView *lastView;
    NSArray *arr = @[@"提现完成",@"提现处理中"];
    for (int i = 0; i<arr.count; i++) {
        UnderLineButton *button = [UnderLineButton new];
        button.lineView.backgroundColor = UIColor4a58;
        button.l_width = 50;
        [button setTitle:arr[i] forState:0];
        [button setTitleColor:UIColor333 forState:0];
        [button setBackgroundColor:UIColorfff];
        [button setTitleColor:UIColor4a58 forState:UIControlStateSelected];
        button.tag = i+200;
        [self.contentView addSubview:button];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0) {
                make.left.equalTo(self);
            }else{
                make.left.equalTo(lastView.mas_right);
            }
            make.top.equalTo(topImage.mas_bottom).offset(25*AdapterScal);
            make.width.mas_equalTo(ScreenWidth/2);
            make.height.mas_equalTo(45*AdapterScal);
            make.bottom.equalTo(self.contentView).offset(0*AdapterScal);
        }];
        lastView = button;
    }
    
    UnderLineButton *defaultbutton = [self viewWithTag:200];
    [self click:defaultbutton];
}

- (void)withdraw
{
    if (self.withdrawBlock) {
        self.withdrawBlock();
    }
}

- (void)click:(UnderLineButton *)button
{
    if(!button.selected){
        button.selected = !button.selected;
        
        NSInteger tag = button.tag==200?201:200;
        
        UnderLineButton *otherButton = [self viewWithTag:tag];
        otherButton.selected = NO;
    }
    if (self.clickBlock) {
        self.clickBlock(button.tag);
    }
}

@end
