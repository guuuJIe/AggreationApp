//
//  HotSearchKeyWordCollectionViewCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "HotSearchKeyWordCollectionViewCell.h"
static CGFloat const shadowHeight = 20;
static CGFloat const marginLabelToCell = 15;
static CGFloat const labelHeight = 17;
@interface HotSearchKeyWordCollectionViewCell()
@property (nonatomic , strong) UILabel *keywordlabel;
@end

@implementation HotSearchKeyWordCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColorf4f4;
        self.layer.masksToBounds = YES;
//        self.layer.cornerRadius = heightForCell / 2;
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.keywordlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)setKeyword:(NSString *)keyword {
   
    _keywordlabel.text = keyword;
    [self layoutIfNeeded];
    [self updateConstraintsIfNeeded];
}



@end
