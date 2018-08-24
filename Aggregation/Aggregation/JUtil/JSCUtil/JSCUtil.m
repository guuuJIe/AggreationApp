//
//  JSCUtil.m
//  SalesMan
//
//  Created by chenqiang on 2018/5/17.
//  Copyright © 2018年 SalesMan. All rights reserved.
//

#import "JSCUtil.h"

@implementation JSCUtil

+(NSAttributedString *)getSumString:(NSString *)string
                          withRange:(NSRange)range
                      withRangeFont:(UIFont *)rangeFont
                      withOtherFont:(UIFont *)otherFont
                 WithOtherFontColor:(UIColor *)otherColor
                     withRangeColor:(UIColor *)rangeColor{
    @try {
        if(string){
            NSMutableAttributedString *attributedString=[[NSMutableAttributedString alloc]initWithString:string];
            
            
            
            // 设置字体
            [attributedString addAttribute:NSFontAttributeName value:otherFont range:NSMakeRange(0, string.length)];
            [attributedString addAttribute:NSForegroundColorAttributeName value:otherColor range:NSMakeRange(0, string.length)];
            [attributedString addAttribute:NSStrokeColorAttributeName value:otherColor range:NSMakeRange(0, string.length)];
            [attributedString addAttribute:NSStrokeWidthAttributeName value:@0 range:NSMakeRange(0, string.length)];
            
            
            [attributedString addAttribute:NSFontAttributeName value:rangeFont range:range];
            [attributedString addAttribute:NSForegroundColorAttributeName value:rangeColor range:range];
            [attributedString addAttribute:NSStrokeColorAttributeName value:otherColor range:range];
            [attributedString addAttribute:NSStrokeWidthAttributeName value:@0 range:range];
            return attributedString;
        }
        return [NSMutableAttributedString new];
    } @catch (NSException *exception) {
        return [NSMutableAttributedString new];
    } @finally {
        
    }
    
}

+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}


+(NSMutableArray *)removeNavViewController:(NSArray *)array withArrayClassName:(NSArray *)classNames{
    NSMutableArray *marr = [[NSMutableArray alloc]initWithArray:array];
    for(NSString *className in classNames){
        
        NSMutableArray *larr = [NSMutableArray new];
        for(int i = 0 ; i<marr.count; i ++){
            if(i != marr.count-1){
                UIViewController *vc = marr[i];
                if ([vc isMemberOfClass:[NSClassFromString(className) class]]) {
                    [larr addObject:vc];
                }
            }
        }
        
        [marr removeObjectsInArray:larr];
    }
    
    
    return marr;
}

+ (id _Nonnull)insertStringWithNotNullObject:(id _Nonnull)obj
                              andDefailtInfo:(nonnull id)defailInfo
{
    if (!obj || [obj isEqual:[NSNull null]])
    {
        return defailInfo;
    }
    if ([obj isKindOfClass:[NSString class]])
    {
        if ([obj isEqualToString:@""])
        {
            return defailInfo;
        }
    }
    return obj;
}

//判断手机号码格式是否正确
+ (BOOL)valiMobile:(NSString *)mobile
{
    if (mobile.length != 11)
    {
        return NO;
    }
    /**
     * 手机号码:
     * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[0, 1, 6, 7, 8], 18[0-9]
     * 移动号段: 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     * 联通号段: 130,131,132,145,155,156,170,171,175,176,185,186
     * 电信号段: 133,149,153,170,173,177,180,181,189
     */
    NSString *MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134,135,136,137,138,139,147,150,151,152,157,158,159,170,178,182,183,184,187,188
     */
    NSString *CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,145,155,156,170,171,175,176,185,186
     */
    NSString *CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,149,153,170,173,177,180,181,189
     */
    NSString *CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobile] == YES)
        || ([regextestcm evaluateWithObject:mobile] == YES)
        || ([regextestct evaluateWithObject:mobile] == YES)
        || ([regextestcu evaluateWithObject:mobile] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSString * _Nonnull)achieveImageNameWithCurrentTime
{
    //获取当前时间
    NSDate* today = [NSDate date];
    //转换时间格式
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyyMMddHHmmss"];
    [df setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *s1 = [df stringFromDate:today];
    NSString *s2 = [NSString stringWithFormat:@"%@.jpg",s1];
    return s2;
}

+ (NSString *)timeFormatted:(NSString *)totalTime;
{
  long seconds = [totalTime longLongValue];
  //format of hour
  NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    
  long h = seconds/60/60;
    JLog(@"%.2ld",h);
  //format of minute
  NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
  //format of second
//  NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
  //format of time
  NSString *format_time = [NSString stringWithFormat:@"%@小时%@分钟",str_hour,str_minute];

  return format_time;
}

//时间戳转字符串
+(NSString *)timeStringChangeFromTimeStamp:(NSTimeInterval)interval
{
    NSDate *date  = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString  = [formatter stringFromDate:date];
    return dateString;
}

+ (void)drawLineByUIImageView:(UIImageView *)imageView
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:imageView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(imageView.frame) / 2, CGRectGetHeight(imageView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[UIColor lightGrayColor].CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(imageView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:2], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(imageView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [imageView.layer addSublayer:shapeLayer];
}


@end
