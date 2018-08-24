//
//  JSHeadBannerCollectionReusableView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/10.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSHeadBannerCollectionReusableView : UICollectionReusableView
@property (nonatomic,copy) void(^clickBlock)(void);//点击搜索
@end
