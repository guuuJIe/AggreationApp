//
//  UserModel.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/9.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    // class_copyIvarList 获取属性
    Ivar *ivars = class_copyIvarList([UserModel class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        // 获取属性的 name
        const char *name = ivar_getName(ivar);
        NSString *key = [[NSString alloc]initWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([UserModel class], &count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char *name = ivar_getName(ivar);
            NSString *key = [[NSString alloc]initWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            if(value){
                [self setValue:value forKey:key];
            }
        }
    }
    return self;
}

@end
