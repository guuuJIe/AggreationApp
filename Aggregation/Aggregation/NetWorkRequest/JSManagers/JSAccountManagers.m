//
//  JSAccountManagers.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSAccountManagers.h"
#import "JSAccountApi.h"
@interface JSAccountManagers()
@property (nonatomic , strong) JSAccountApi *accoutApi;
@end

@implementation JSAccountManagers
#pragma mark - <发起登录请求>
- (BOOL)validatingOfSignUp
{
    if (!self.userName || [self.userName isEqualToString:@""])
    {
        
        [JMBManager showBriefAlert:@"请输入用户名"];
        return NO;
    }
    if (!self.passWord || [self.passWord isEqualToString:@""])
    {
        [JMBManager showBriefAlert:@"请输入密码"];
        
        return NO;
    }
    
//#ifdef  DEBUG
    
//#else
    if (![JSCUtil valiMobile:self.userName]) {
        [JMBManager showBriefAlert:@"请输入正确的手机格式"];
        return NO;
    }
//#endif
    
    return YES;
}

- (void)responderOfSignUpWhileFinished:(MessageBodyNetworkCompletionHandler)completionHander
{
    if (![self validatingOfSignUp]) {
        return;
    }
    
    [JMBManager showLoading];
    //请求参数
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:self.userName forKey:@"username"];
    [parameters setObject:self.passWord forKey:@"password"];
    
    [self.accoutApi loginAccAndPwdWithparameters:parameters withCompletionHandler:^(NSError *error, MessageBody *result) {
        if (result.code == 200) {
            completionHander(error,result);
        }else{
            [JMBManager showBriefAlert:result.message];
        }
        [JMBManager hideAlert];
    }];
    
}

- (JSAccountApi *)accoutApi
{
    if (!_accoutApi) {
        _accoutApi = [JSAccountApi new];
    }
    return _accoutApi;
}
@end
