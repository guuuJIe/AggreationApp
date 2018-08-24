//
//  JSCompanyDetailTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSCompanyDetailTableViewCell.h"

@interface JSCompanyDetailTableViewCell()
@property (nonatomic , strong) UIImageView *goodsImage;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *priceLabel;
@property (nonatomic , strong) UILabel *hotLabel;
@property (nonatomic , strong) UILabel *orginpriceLabel;
@end

@implementation JSCompanyDetailTableViewCell

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
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.goodsImage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(14);
        make.size.mas_equalTo(CGSizeMake(200.0/2*AdapterScal, 190.0/2*AdapterScal));
        make.bottom.equalTo(self.contentView).offset(-10*AdapterScal);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsImage.mas_right).offset(10*AdapterScal);
        make.top.equalTo(self.goodsImage).offset(5*AdapterScal);
        make.right.equalTo(self.contentView).offset(-10*AdapterScal);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.bottom.equalTo(self.goodsImage.mas_bottom).offset(-10*AdapterScal);
    }];
    
    [self.orginpriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel.mas_right).offset(12);
        make.centerY.equalTo(self.priceLabel);
    }];
}


- (UIImageView *)goodsImage
{
    if (!_goodsImage) {
        _goodsImage = [UIImageView new];
        _goodsImage.backgroundColor = UIColorf4f4;
        _goodsImage.layer.cornerRadius = 4;
        _goodsImage.layer.masksToBounds = YES;
        [self.contentView addSubview:_goodsImage];
    }
    return _goodsImage;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"格兰威特翻过橡木桶格兰威特翻过橡木桶";
        _titleLabel.font = UIFont14;
        _titleLabel.textColor = UIColor333;
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.text = @"800元/箱";
        _priceLabel.font = UIFont14;
        _priceLabel.textColor = UIColor495e;
        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}

- (UILabel *)orginpriceLabel
{
    if (!_orginpriceLabel) {
        _orginpriceLabel = [UILabel new];
        _orginpriceLabel.text = @"1000元/箱";
        _orginpriceLabel.font = UIFont11;
        _orginpriceLabel.textColor = UIColor999;
        //        NSDictionary *attriDic = @{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString: _orginpriceLabel.text attributes:@{NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle),NSBaselineOffsetAttributeName : @(NSUnderlineStyleSingle)}];
        _orginpriceLabel.attributedText = attribtStr;
        [self.contentView addSubview:_orginpriceLabel];
    }
    return _orginpriceLabel;
}
@end
