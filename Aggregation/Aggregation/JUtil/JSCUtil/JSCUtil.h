//
//  JSCUtil.h
//  SalesMan
//
//  Created by chenqiang on 2018/5/17.
//  Copyright © 2018年 SalesMan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSCUtil : NSObject

/**
 字符串 ~> 两种不同 大小 不同 颜色
 
 @param string 所有文字
 @param range 范围
 @param rangeFont 范围内的字体
 @param otherFont 其他字体
 @param otherColor 其他的颜色
 @param rangeColor 范围内的颜色
 @return 两种不同 大小 不同 颜色
 */
+(NSAttributedString *)getSumString:(NSString *)string
                          withRange:(NSRange)range
                      withRangeFont:(UIFont *)rangeFont
                      withOtherFont:(UIFont *)otherFont
                 WithOtherFontColor:(UIColor *)otherColor
                     withRangeColor:(UIColor *)rangeColor;

/**
 颜色转图片
 
 @param color color description
 @param height height description
 @return return value description
 */
+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 删除 navigationController.viewControllers 里的界面
 
 @param array navigationController.viewControllers
 @param classNames 多个 string
 @return return navigationController.viewControllers
 */
+(NSMutableArray *)removeNavViewController:(NSArray *)array withArrayClassName:(NSArray *)classNames;

/*!
 * @breif
 * @param obj 输入值
 * @return 传入对象为空则返回默认输入值
 */
+ (id _Nonnull)insertStringWithNotNullObject:(id _Nonnull)obj
                              andDefailtInfo:(nonnull id)defailInfo;
/**
 判断手机号是否正确
 */
+ (BOOL)valiMobile:(NSString *_Nonnull)mobile;

/*!
 * @brief 获取当前时间作为图片的名称
 * @return 以"20160621171802.png"形式的当前时间字符串形式的照片名
 */
+ (NSString * _Nonnull)achieveImageNameWithCurrentTime;
/*!
 * @brief 把秒转换成时分秒
 * @return 时分秒时间字符串
 */
+ (NSString *)timeFormatted:(NSString *)totalTime;
/**
 将时间戳转字符串
 @param interval 时间戳
 */
+(NSString *)timeStringChangeFromTimeStamp:(NSTimeInterval)interval;
/**
  画虚线
 @param imageView 控件
 */
+ (void)drawLineByUIImageView:(UIImageView *)imageView;


@end
