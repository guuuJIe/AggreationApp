//
//  Singleton.h
//  boligou
//
//  Created by chenqiang on 2017/11/6.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

/**
 *  在.h文件中定义的宏，arc
 *
 *  SingletonH(name) 这个是宏
 *  + (instancetype)shared##name;这个是被代替的方法， ##代表着shared+name 高度定制化
 * 在外边我们使用 “SingletonH(gege)” 那么在.h文件中，定义了一个方法"+ (instancetype)sharedgege",所以，第一个字母要大写
 *
 *  @return 一个搞定好的方法名
 */
#define SHSingleInstance_H_(name) \
+ (instancetype)shared##name;


/**
 *  在.m文件中处理好的宏 arc
 *
 *  SingletonM(name) 这个是宏,因为是多行的东西，所以每行后面都有一个"\",最后一行除外，
 * 之所以还要传递一个“name”,是因为有个方法要命名"+ (instancetype)shared##name"
 *  @return 单利
 */
#define SHSingleInstance_M_(name) \
static id _instance = nil; \
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
if (_instance == nil) \
{ \
_instance = [[self alloc] init]; \
} \
}); \
return _instance; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
if (_instance == nil) \
{ \
_instance = [super allocWithZone:zone]; \
} \
}); \
return _instance; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
} \
+ (id)mutableCopyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
}


#endif /* Singleton_h */
