//
//  JSHomePageSectionTwoCollectionViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/10.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSHomePageSectionTwoCollectionViewCell : UICollectionViewCell
@property (nonatomic,copy) void(^clickBlock)(NSInteger index);
@end
