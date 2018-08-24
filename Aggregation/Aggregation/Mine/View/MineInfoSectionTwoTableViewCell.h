//
//  MineInfoSectionTwoTableViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineInfoSectionTwoTableViewCell : UITableViewCell
- (void)setupData:(NSDictionary *)dic;
@property (nonatomic , strong) UILabel *rightLabel;
@end
