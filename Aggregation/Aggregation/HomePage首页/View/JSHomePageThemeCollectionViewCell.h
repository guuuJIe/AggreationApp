//
//  JSHomePageThemeCollectionViewCell.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSHomePageThemeCollectionViewCell : UICollectionViewCell
@property (nonatomic,copy) void(^clickBlock)(NSInteger index);
@end
