//
//  JSAccountApi.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSAccountApi.h"

@interface JSAccountApi()

@property (nonatomic , strong) JSHttpClient *client;

@end

@implementation JSAccountApi

- (void)loginAccAndPwdWithparameters:(id)parameters withCompletionHandler:(MessageBodyNetworkCompletionHandler)completionHander
{
    [self.client post:appLogin parameters:parameters isNeedHeader:NO withCompletionHandler:^(NSError *error, id result) {
        MessageBody *body = [MessageBody instanceWithDataResponseObject:result withTheDataModelClass:NSClassFromString(@"UserModel") withError:error isArray:NO];
        completionHander(error,body);
        [self saveLoginResult:body];
    }];
}

- (void)saveLoginResult:(MessageBody *)body
{
    [UserInfo sharedUserInfo].userModel = body.result;
    [[UserInfo sharedUserInfo] saveUserModel];
}

- (JSHttpClient *)client
{
    if (!_client) {
        _client = [JSHttpClient shareClient];
    }
    return _client;
}
@end
