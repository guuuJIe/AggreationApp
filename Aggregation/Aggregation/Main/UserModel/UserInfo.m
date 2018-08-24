//
//  UserInfo.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/9.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "UserInfo.h"
#define UserPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true)lastObject]stringByAppendingString:@"/UserModel.archiver"]

@implementation UserInfo

SHSingleInstance_M_(UserInfo)

-(void)saveUserModel
{
    [NSKeyedArchiver archiveRootObject:self.userModel toFile:UserPath];
}
-(UserModel *)userModel
{
    
    if(_userModel==nil)
    {
        _userModel= [NSKeyedUnarchiver unarchiveObjectWithFile:UserPath];
        
    }
    return _userModel;
}
@end
