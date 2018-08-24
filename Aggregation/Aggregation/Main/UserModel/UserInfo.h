//
//  UserInfo.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/9.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import "Singleton.h"

@interface UserInfo : NSObject
@property (nonatomic , strong) UserModel *userModel;
SHSingleInstance_H_(UserInfo)

-(void)saveUserModel;
@end
