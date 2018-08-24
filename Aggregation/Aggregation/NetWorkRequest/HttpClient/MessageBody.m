//
//  MessageBody.m
//  GoodsDetail
//
//  Created by chenqiang on 2017/12/29.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import "MessageBody.h"


@implementation MessageBody

+ (instancetype)instanceWithResponseObject:(id)responseObject
                                withError:(NSError *)error
                    withTheDataModelClass:(Class)dataModelClass
                                  isArray:(bool)isArray
                                    isRow:(bool)isRow{
    
    if(!isRow){
        return [self instanceWithListResponseObject:responseObject withTheDataModelClass:dataModelClass withError:error isArray:isArray];
    }else{
        
        return [self instanceWithDataResponseObject:responseObject withTheDataModelClass:dataModelClass withError:error isArray:isArray];
    }
}
+ (instancetype)instanceWithListResponseObject:(id)responseObject withTheDataModelClass:(Class)dataModelClass withError:(NSError *)error isArray:(bool)isArray{
    
    MessageBody *body=[MessageBody new];
    body.datas = [NSMutableArray new];
    if(error){
        if(error.code == 999){
            body.message = error.domain;
            body.code = 999;
            body.error = error;
        }else{
            body.message=@"系统繁忙，请稍后重试!";
            body.code=505;
            body.error=error;
        }
        
    }else{
        NSDictionary *rODic= [NSDictionary dictionaryWithDictionary:responseObject];
       
        // 成功
        if([rODic[@"code"] integerValue] == 200)
        {
            NSDictionary *dict = rODic[@"data"];
            body.code=[rODic[@"code"] integerValue];
            body.message=rODic[@"message"];
          
            NSString *resultName;
            NSArray *resultNameArray = @[@"data",@"list",@"goods",@"obj",@"objlist"];
            for(NSString *rname in resultNameArray){
                if(dict[rname] != nil){
                    resultName = rname;
                    break;
                }
            }
           
            if(dataModelClass)
            {
                if(isArray){
                    body.result = [dataModelClass mj_objectArrayWithKeyValuesArray:dict[resultName]];

                }else{
                    body.result=[dataModelClass mj_objectWithKeyValues:dict[resultName]];
                }
            }else{
                if(isArray){
                    body.result=dict[resultName];
                }else{
                    body.result=dict[resultName];
                }
            }
            
        }else{
            
            // 其他的系统错误
            body.message = rODic[@"message"];
            body.code = [rODic[@"code"] integerValue];
            [body authen:[rODic[@"code"] integerValue]];
        }
    }
    return body;
    
}

+ (instancetype)instanceWithDataResponseObject:(id)responseObject withTheDataModelClass:(Class)dataModelClass withError:(NSError *)error isArray:(bool)isArray{
    
    MessageBody *body=[MessageBody new];
    
    if(error){
        if(error.code == 999){
            body.message = error.domain;
            body.code = 999;
            body.error = error;
        }else{
            body.message=@"系统繁忙，请稍后重试!";
            body.code=505;
            body.error=error;
        }
        
    }else{
        NSDictionary *rODic= [NSDictionary dictionaryWithDictionary:responseObject];
        
        // 成功
        if([rODic[@"code"] integerValue] == 200)
        {
            NSDictionary *dict = rODic;
            body.code=[dict[@"code"] integerValue];
            body.message=dict[@"message"];
            body.resultDic = dict;
            
            NSString *resultName = @"data";
     
            if(dataModelClass)
            {
                if(isArray){
                    body.result=[dataModelClass mj_objectArrayWithKeyValuesArray:dict[resultName]];
                }else{
                    body.result=[dataModelClass mj_objectWithKeyValues:dict[resultName]];
                }
            }else
            {
                if(isArray){
                    body.result=dict[resultName];
                }else{
                    body.result=dict[resultName];
                }
            }
        }else{
            // 其他的系统错误
            body.message = rODic[@"message"];
            body.code = [rODic[@"code"] integerValue];
            [body authen:[rODic[@"code"] integerValue]];
        }
    }
    return body;
    
}

-(void)authen:(NSInteger)code
{
    if(code == 400)
    {
        self.message = nil;
//        [UserInfo sharedUserInfo].userModel = [UserModel new];
//        [[UserInfo sharedUserInfo]saveUserModel];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IsLoginUser" object:nil];
        [JMBManager hideAlert];
        return;
    }
}



@end
