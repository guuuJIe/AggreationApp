//
//  GoodsClassificationCollectionViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsClassificationCollectionViewCell : UICollectionViewCell
@property (nonatomic,copy) void(^clickBlock)(NSInteger index);
@end
