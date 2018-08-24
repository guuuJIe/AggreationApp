//
//  JSMineOrdersTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSMineOrdersTableViewCell.h"

@interface JSMineOrdersTableViewCell()
@property (nonatomic , strong) UIImageView *goodsImageView;
@property (nonatomic , strong) UILabel *goodTitleLabel;
@property (nonatomic , strong) UILabel *capacityLabel;
@property (nonatomic , strong) UILabel *priceLabel;
@property (nonatomic , strong) UILabel *numLabel;
@end

@implementation JSMineOrdersTableViewCell

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
    UIView *bgview = [UIView new];
    bgview.backgroundColor = UIColorfafa;
    [self.contentView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(12);
        make.right.equalTo(self.contentView).offset(-12);
    }];
    
    [self.goodsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(14);
        make.left.equalTo(self.contentView).offset(20);
        make.size.mas_equalTo(CGSizeMake(80*AdapterScal, 80*AdapterScal));
        make.bottom.equalTo(self.contentView).offset(-8*AdapterScal);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-16);
        //        make.top.equalTo(self.goodsImageView).offset(10);
        make.centerY.equalTo(self.goodTitleLabel);
    }];
    
    [self.goodTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImageView).offset(5);
        make.left.equalTo(self.goodsImageView.mas_right).offset(12);
        make.right.equalTo(self.priceLabel.mas_left).offset(-15);
    }];
    
    
    
    [self.capacityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(self.goodTitleLabel.mas_bottom).offset(17);
        make.left.equalTo(self.goodTitleLabel);
        make.bottom.equalTo(self.goodsImageView.mas_bottom).offset(-5);
    }];
    
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-12);
        //        make.top.equalTo(self.capacityLabel);
        make.centerY.equalTo(self.capacityLabel);
    }];
}

-(UIImageView *)goodsImageView{
    if(!_goodsImageView){
        _goodsImageView = [UIImageView new];
        _goodsImageView.image = [UIImage imageNamed:@"bgview"];
        _goodsImageView.layer.cornerRadius = JLittleCornerRadius;
        _goodsImageView.layer.masksToBounds = YES;
        //        _goodsImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_goodsImageView];
    }
    return _goodsImageView;
}

-(UILabel *)goodTitleLabel
{
    if(!_goodTitleLabel){
        _goodTitleLabel = [UILabel new];
        _goodTitleLabel.textColor = UIColor333;
        _goodTitleLabel.font = UIFont14;
        _goodTitleLabel.numberOfLines = 0;
        _goodTitleLabel.text = @"";
        [self.contentView addSubview:_goodTitleLabel];
    }
    return _goodTitleLabel;
}

-(UILabel *)capacityLabel
{
    if(!_capacityLabel){
        _capacityLabel = [UILabel new];
        _capacityLabel.textColor = UIColor999;
        _capacityLabel.font = UIFont13;
        _capacityLabel.numberOfLines = 0;
        _capacityLabel.text = @"300ml/12";
        [self.contentView addSubview:_capacityLabel];
    }
    return _capacityLabel;
}
-(UILabel *)priceLabel
{
    if(!_priceLabel){
        _priceLabel = [UILabel new];
        _priceLabel.textColor = [UIColor colorWithHexString:@"000"];
        _priceLabel.font = UIFont13;
        _priceLabel.text = @"¥ 599.00";
        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}
@end
