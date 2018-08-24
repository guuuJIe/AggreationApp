//
//  NSString+width.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "NSString+width.h"

@implementation NSString (width)
//*******//
- (CGFloat)stringWidthWithFont:(UIFont *)font height:(CGFloat)height {
    if (self == nil ) {
        return 0;
    }
    NSString *copyString = [NSString stringWithFormat:@"%@", self];
    CGSize constrainedSize = CGSizeMake(999999, height);
    NSDictionary * attribute = @{NSFontAttributeName:font};
    CGSize size = [copyString boundingRectWithSize:constrainedSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return ceilf(size.width);
}
@end
