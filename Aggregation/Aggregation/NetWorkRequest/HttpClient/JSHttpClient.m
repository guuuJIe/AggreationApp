//
//  JSHttpClient.m
//  SalesMan
//
//  Created by chenqiang on 2018/5/26.
//  Copyright © 2018年 SalesMan. All rights reserved.
//

#import "JSHttpClient.h"
#import "Reachability.h"
#import "AFNetworking.h"

static JSHttpClient *manager = nil;
/**
 网络请求对象
 */
static AFHTTPSessionManager *sessionManager = nil;

/**
 网络接通行
 */
static Reachability *netReachability = nil;

@implementation JSHttpClient
/**
 *  创建单例
 *  @return JSCAFManager
 */
+ (JSHttpClient *)shareClient
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[JSHttpClient alloc] init];
        sessionManager = [AFHTTPSessionManager manager];
        //设置请求格式，格式为字典 k-v
        sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
//        sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
#ifdef DEBUG
        sessionManager.securityPolicy.allowInvalidCertificates = YES;
        [sessionManager.securityPolicy setValidatesDomainName:NO];
#else
    
#endif
        sessionManager.requestSerializer.timeoutInterval = 30.0f;
        sessionManager.requestSerializer.timeoutInterval = 30.0f;
        sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
        [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        netReachability = [Reachability reachabilityForInternetConnection];
        
    }
    return self;
}

-(void)post:(NSString *)action parameters:(id)inpParameters isNeedHeader:(bool)isNeed withCompletionHandler:(NetworkCompletionHandler)completionHander

{
    NSString *server = kServer;
    NSString *URLString = [NSString stringWithFormat:@"%@%@", server, action];
    
    //如果网络不可用，不发起网络请求，直接返回错误
    if ([netReachability currentReachabilityStatus] == NotReachable) {
        
        completionHander([NSError errorWithDomain:@"无网络" code:999 userInfo:nil],nil);
        return ;
    }
    if(isNeed){
//        [sessionManager.requestSerializer setValue:[UserInfo sharedUserInfo].userModel.token forHTTPHeaderField:@"Authorization"];
    }
    
    
    
    [sessionManager POST:URLString parameters:inpParameters progress:^(NSProgress * _Nonnull uploadProgress) {

        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        //返回响应
        completionHander(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHander(error,nil);
        
    }];
    
}

- (void)get:(NSString *)action parameters:(id)inpParameters isNeedHeader:(bool)isNeed withCompletionHandler:(NetworkCompletionHandler)completionHander
{
    
    NSString *server = kServer;
    NSString *URLString = [NSString stringWithFormat:@"%@%@", server, action];
    
    //如果网络不可用，不发起网络请求，直接返回错误
    if ([netReachability currentReachabilityStatus] == NotReachable) {
        
        //这里的netcode根据服务器自己定义成枚举或者宏定义
        completionHander([NSError errorWithDomain:@"无网络" code:999 userInfo:nil],nil);
        
        return ;
    }
    
    if(isNeed){
//        [sessionManager.requestSerializer setValue:[UserInfo sharedUserInfo].userModel.token forHTTPHeaderField:@"Authorization"];
    }
    
    [sessionManager GET:URLString parameters:inpParameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 返回响应
        completionHander(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHander(error,nil);
    }];
}

//多张图片一次上传服务器 NSArray 放 Dic -  name image
- (void)postUploadWithAction:(NSString *)action parameters:(id)inpParameters uploadImages:(NSArray *)images  withCompletionHandler:(NetworkCompletionHandler)completionHander
{
    NSString *server = kServer;
    NSString *URLString = [NSString stringWithFormat:@"%@%@", server, action];
    
    //如果网络不可用，不发起网络请求，直接返回错误
    if ([netReachability currentReachabilityStatus] == NotReachable) {
        completionHander([NSError errorWithDomain:@"Network is not reachable" code:0 userInfo:nil],nil);
        return ;
    }
    
    [sessionManager POST:URLString parameters:inpParameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 添加一个标记 去分图片名称
        for(NSInteger i = 0; i < images.count; i++)
        {
            NSDictionary * imageDic = [images objectAtIndex: i];
            UIImage *image = imageDic[@"image"];
            // 压缩图片
            
            NSData *data = UIImageJPEGRepresentation(image, 1.0);
            if (data.length>100*1024)
            {
                if (data.length>1024*1024) {//1M以及以上
                    data = UIImageJPEGRepresentation(image, 0.1);
                }else if (data.length>512*1024) {//0.5M-1M
                    data = UIImageJPEGRepresentation(image, 0.5);
                }else if (data.length>200*1024) {//0.25M-0.5M
                    data = UIImageJPEGRepresentation(image, 0.9);
                }
            }
       
            NSString *name = imageDic[@"name"];
            // 上传filename
//            NSString * fileName = [NSString stringWithFormat:@"%@.jpg", name];
            NSString * fileName = [JSCUtil achieveImageNameWithCurrentTime];
            [formData appendPartWithFileData:data name:name fileName:fileName mimeType:@"image/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //返回响应
        completionHander(nil,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completionHander(error,nil);
        
    }];
}
@end
