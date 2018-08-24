//
//  UIImage+Category.h
//  SalesMan
//
//  Created by chenqiang on 2018/5/15.
//  Copyright © 2018年 SalesMan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)
//颜色转背景图片
+(UIImage*) createImageWithColor:(UIColor*) color;
//改变图片大小
+(UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size;
//设置图片透明度
+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha  image:(UIImage*)image;
@end
