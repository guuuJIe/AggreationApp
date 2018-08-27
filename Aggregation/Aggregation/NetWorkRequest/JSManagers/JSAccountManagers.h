//
//  JSAccountManagers.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSAccountManagers : NSObject
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passWord;

/**
 @brief 发起登录请求
 */
- (void)responderOfSignUpWhileFinished:(MessageBodyNetworkCompletionHandler)completionHander;
@end
