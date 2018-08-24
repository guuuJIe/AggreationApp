//
//  ConfirmOrderSecitonOneTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ConfirmOrderSecitonOneTableViewCell.h"
@interface ConfirmOrderSecitonOneTableViewCell()
@property (nonatomic , strong) UIImageView *headImage;
@property (nonatomic , strong) UILabel *namelabel;
@end
@implementation ConfirmOrderSecitonOneTableViewCell

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
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12*AdapterScal);
        make.top.equalTo(self.contentView).offset(12*AdapterScal);
    }];
    
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImage.mas_right).offset(6*AdapterScal);
        make.centerY.equalTo(self.headImage);
    }];
}

- (UIImageView *)headImage
{
    if (!_headImage) {
        _headImage = [UIImageView new];
        UIImage *image1 = [UIImage imageNamed:@"Home_unsel"];
        
        _headImage.contentMode = UIViewContentModeScaleAspectFit;
        _headImage.image = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];//status_image_1
        [_headImage setTintColor:UIColor666];
        [self.contentView addSubview:_headImage];
    }
    return _headImage;
}



- (UILabel *)namelabel
{
    if (!_namelabel) {
        _namelabel = [UILabel new];
        _namelabel.text = @"酒水旗舰店";
        _namelabel.textColor = UIColor333;
        _namelabel.font = UIFont14;
        [self.contentView addSubview:_namelabel];
    }
    return _namelabel;
}

@end
