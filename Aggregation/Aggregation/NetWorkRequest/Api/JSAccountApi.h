//
//  JSAccountApi.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSAccountApi : NSObject
/**
 登录
 @param parameters parameters description
 @param completionHander completionHander description
 */

- (void)loginAccAndPwdWithparameters:(id)parameters withCompletionHandler:(MessageBodyNetworkCompletionHandler)completionHander;
@end
