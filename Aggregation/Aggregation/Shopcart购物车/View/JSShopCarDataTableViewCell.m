//
//  JSShopCarDataTableViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSShopCarDataTableViewCell.h"
@interface JSShopCarDataTableViewCell()
@property (nonatomic , strong) UIButton *selButton;
@property (nonatomic , strong) UIImageView *goodImage;
@property (nonatomic , strong) UILabel *namelabel;
@property (nonatomic , strong) UILabel *capcitylabel;
@property (nonatomic , strong) UILabel *priceLabel;
@property (nonatomic , strong) UIButton *addBtn;
@property (nonatomic , strong) UILabel *numLabel;
@property (nonatomic , strong) UIButton *cutBtn;


@end

@implementation JSShopCarDataTableViewCell

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
        self.contentView.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self setupLayout];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)addBtnClick:(UIButton *)sender
{
    NSInteger count = [self.numLabel.text integerValue];
    count++;
    self.numLabel.text = [NSString stringWithFormat:@"%ld", (long)count];
    if (self.AddBlock) {
        self.AddBlock(self.numLabel);
    }
}

- (void)cutBtnClick:(UIButton *)sender
{
    NSInteger count = [self.numLabel.text integerValue];
    count--;
    if (count <= 0) {
        return;
    }
    self.numLabel.text = [NSString stringWithFormat:@"%ld", count];
    if (self.CutBlock) {
        self.CutBlock(self.numLabel);
    }
    
}

- (void)selectBtnClick:(UIButton *)sender
{
    
    sender.selected = !sender.selected;
    if (self.ClickRowBlock) {
        self.ClickRowBlock(sender.selected);
    }
 
    
}

- (void)setupLayout
{
//    UIView *lineView = [UIView new];
//    lineView.backgroundColor = UIColorf4f4;
//    [self.bgview addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.equalTo(self.bgview);
//        make.width.mas_equalTo(JLineHeight);
//    }];
//    bgView.layer.cornerRadius = 5;
//    bgView.layer.masksToBounds = YES;
    
//    bgView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
//    bgView.layer.shadowOffset = CGSizeMake(0, -8);
//    bgView.layer.shadowOpacity = 0.5;
//    bgView.layer.shadowRadius = 4;
    
//    [self.contentView addSubview:self.bgview];
//    [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.contentView).offset(0);
//        make.right.equalTo(self.contentView).offset(0);
//        make.top.equalTo(self.contentView);
//    }];
    
    [self.contentView addSubview:self.selButton];
    [self.selButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(12*AdapterScal);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [self.contentView addSubview:self.goodImage];
    [self.goodImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.selButton.mas_right).offset(8);
        make.size.mas_equalTo(CGSizeMake(80*AdapterScal, 80*AdapterScal));
        make.bottom.equalTo(self.contentView).offset(-5*AdapterScal);
    }];
    
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.contentView).offset(0*AdapterScal);
//    }];
    
    
    [self.contentView addSubview:self.namelabel];
    [self.namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodImage);
        make.left.equalTo(self.goodImage.mas_right).offset(10*AdapterScal);
        make.right.equalTo(self.contentView).offset(-5*AdapterScal);
    }];
    
    [self.contentView addSubview:self.capcitylabel];
    [self.capcitylabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.namelabel.mas_bottom).offset(6*AdapterScal);
        make.left.equalTo(self.namelabel);
    }];
    
    [self.contentView addSubview:self.priceLabel];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.goodImage);
        make.left.equalTo(self.namelabel);
    }];
    
    UIView *numView = [[UIView alloc] init];
    numView.backgroundColor = UIColorfff;
    [self.contentView addSubview:numView];
    [numView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-10*AdapterScal);
        make.centerY.equalTo(self.priceLabel);
        make.size.mas_equalTo(CGSizeMake(100, 22));
    }];
    //数量加按钮
    UIButton *addBtn = [UIButton new];
    [addBtn setBackgroundColor:[UIColor whiteColor]];
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateHighlighted];
    [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.addBtn = addBtn;
//    [self.addBtn setEnlargeEdgeWithTop:10 left:20 bottom:10 right:10];
    [numView addSubview:addBtn];
    
    //数量显示
    UILabel* numberLabel = [[UILabel alloc]init];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.text = @"1";
    numberLabel.font = [UIFont systemFontOfSize:13];
    numberLabel.textColor = UIColor666;
    [numberLabel setBackgroundColor:UIColorf4f4];
    numberLabel.layer.cornerRadius = 1;
    numberLabel.layer.masksToBounds = YES;
    self.numLabel = numberLabel;
    [numView addSubview:numberLabel];
    
    //数量减按钮
    UIButton *cutBtn = [UIButton new];
    [cutBtn setImage:[UIImage imageNamed:@"cut"] forState:UIControlStateNormal];
    [cutBtn setImage:[UIImage imageNamed:@"cut"] forState:UIControlStateHighlighted];
    [cutBtn setBackgroundColor:[UIColor whiteColor]];
    [cutBtn addTarget:self action:@selector(cutBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.cutBtn = cutBtn;
//    [self.cutBtn setEnlargeEdgeWithTop:10 left:20 bottom:10 right:10];
    [numView addSubview:cutBtn];
    
    [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(numView.mas_right).offset(-1);
        make.top.equalTo(numView).offset(1);
        make.bottom.equalTo(numView).offset(-1);
        make.width.mas_equalTo(25);
    }];
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(numView).offset(-1);
        make.top.equalTo(numView).offset(1);
        make.right.equalTo(addBtn.mas_left).offset(-1);
        make.width.mas_equalTo((50-4));
    }];
    [cutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(numView).offset(1);
        make.bottom.equalTo(numView).offset(-1);
        make.right.equalTo(numberLabel.mas_left).offset(-1);
    }];
    
//    self.bgview = bgView;
}

- (UIButton *)selButton
{
    if (!_selButton) {
        _selButton = [UIButton new];
        [_selButton setTitle:@"\U0000e72f" forState:0];
        [_selButton setTitle:@"\U0000e601" forState:UIControlStateSelected];
        [_selButton setTitleColor:UIColor333 forState:0];
        [_selButton.titleLabel setFont:iconFontSize(20)];
        [_selButton setTitleColor:ThemeColor forState:UIControlStateSelected];
        [_selButton addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        /[self.contentView addSubview:_selButton];
    }
    return _selButton;
}

- (UILabel *)namelabel
{
    if (!_namelabel) {
        _namelabel = [UILabel new];
        _namelabel.text = @"乌克兰小酒，乌克兰小酒乌克兰小酒乌克兰小酒";
        _namelabel.numberOfLines = 0;
        _namelabel.textColor = UIColor333;
        _namelabel.font = UIFont14;
//        [self.contentView addSubview:_namelabel];
    }
    return _namelabel;
}

- (UILabel *)capcitylabel
{
    if (!_capcitylabel) {
        _capcitylabel = [UILabel new];
        _capcitylabel.text = @"900ML/瓶";
        _capcitylabel.numberOfLines = 0;
        _capcitylabel.textColor = UIColor999;
        _capcitylabel.font = UIFont12;
//        [self.contentView addSubview:_capcitylabel];
    }
    return _namelabel;
}
- (UIImageView *)goodImage
{
    if (!_goodImage) {
        _goodImage = [UIImageView new];
        _goodImage.backgroundColor = [UIColor redColor];
//        [self.contentView addSubview:_goodImage];
    }
    return _goodImage;
}

- (UIView *)bgview
{
    if (!_bgview) {
        _bgview = [UIView new];
        _bgview.backgroundColor = [UIColor whiteColor];
    }
    return _bgview;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.text = @"¥788.00/瓶";
        _priceLabel.textColor = UIColor495e;
        _priceLabel.font = UIFont14;
//        [self.contentView addSubview:_priceLabel];
    }
    return _priceLabel;
}
@end
