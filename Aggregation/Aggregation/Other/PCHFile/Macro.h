//
//  Macro.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/9.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#ifndef Macro_h
#define Macro_h


typedef enum
{
    RefreshTypeNormal,//普通
    RefreshTypeUP,//上拉加载更多
    RefreshTypeDown//下拉刷新
} RefreshType; /* 表格数据更新的类型 */

// 常用颜色 字体大小
#define iconFontSize(iconFontsize) [UIFont fontWithName:@"iconfont" size:iconFontsize]
// 把字体适配考虑进去
#define UIFont10 [UIFont systemFontOfSize:10]
#define UIFont11 [UIFont systemFontOfSize:11]
#define UIFont12 [UIFont systemFontOfSize:12]
#define UIFont13 [UIFont systemFontOfSize:13]
#define UIFont14 [UIFont systemFontOfSize:14]
#define UIFont15 [UIFont systemFontOfSize:15]
#define UIFont16 [UIFont systemFontOfSize:16]
#define UIFont17 [UIFont systemFontOfSize:17]
#define UIFont18 [UIFont systemFontOfSize:18]
#define UIFont20 [UIFont systemFontOfSize:20]
#define UIFont24 [UIFont systemFontOfSize:24]
// 细线
#define JLineHeight 1.0/[UIScreen mainScreen].scale

#define JLittleCornerRadius  4
//颜色
#define GLOBALBGCOLOR [UIColor colorWithHexString:@"f7f7f7"]
#define UIColorf4f4 [UIColor colorWithHexString:@"f4f4f4"]
#define UIColorfafa [UIColor colorWithHexString:@"#fafafa"]
#define UIColorfff [UIColor colorWithHexString:@"ffffff"]
#define UIColor1919 [UIColor colorWithHexString:@"191919"]
#define UIColore5e5 [UIColor colorWithHexString:@"#e5e5e5"]
#define UIColorffccc [UIColor colorWithHexString:@"cccccc"]
#define UIColor7efd [UIColor colorWithHexString:@"#4d7efd"] // 蓝色
#define ThemeColor [UIColor colorWithHexString:@"00c356"]
#define UIColor49b8ff [UIColor colorWithHexString:@"49b8ff"] // 蓝
#define UIColor333  [UIColor colorWithHexString:@"#333333"]
#define UIColor999  [UIColor colorWithHexString:@"999999"]
#define UIColor000  [UIColor colorWithHexString:@"#000000"] //黑色
#define UIColorccc [UIColor colorWithHexString:@"#cccccc"]
#define BlueColor [UIColor colorWithHexString:@"#42bdf1"] //蓝色
#define sunColor [UIColor colorWithHexString:@"ffa70b"]
#define telIconColor [UIColor colorWithHexString:@"67c6bf"]
#define UIColor0e0e [UIColor colorWithHexString:@"#0e0e0e"]
#define UIColor666 [UIColor colorWithHexString:@"#666666"]
#define UIColoreee [UIColor colorWithHexString:@"#eeeeee"]
#define UIColor1f13 [UIColor colorWithHexString:@"#d91f13"]//红色
#define UIColor495e [UIColor colorWithHexString:@"#ff495e"]//红色
#define UIColor4a58 [UIColor colorWithHexString:@"#f74a58"]//红色

#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
// NSLog
#ifdef DEBUG
#define JLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define JLog(...)
#endif

//Imageicon
#define kIC_Img(name,size,color) [UIImage iconWithInfo:TBCityIconInfoMake(name, size, color)]

//弱引用
#define WeakSelf(type)__weak typeof(type)weak##type = type;

//强引用
#define StrongSelf(type)__strong typeof(type)type = weak##type;
// 适配
#define AdapterScal  [UIScreen mainScreen].bounds.size.width/375.0
#define AdapterHeightScal  [UIScreen mainScreen].bounds.size.height/667
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenSize [UIScreen mainScreen].bounds.size
#define AdjustsScrollViewInsetNever(controller,view) if(@available(iOS 11.0, *)) {view.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;} else if([controller isKindOfClass:[UIViewController class]]) {controller.automaticallyAdjustsScrollViewInsets = false;}
#define StauesBarHeight (ScreenHeight == 812.0f ? 44 : 20)
#define SafeNavAreaTopHeight (ScreenHeight == 812.0 ? 88 : 64)
#define BottomAreaHeight (ScreenHeight == 812.0f ? 34 : 0)
#define StatusBarHeighterThanCommon                (ScreenHeight == 812.0f ? 24 : 0)
#define TabBarHeight (ScreenHeight == 812.0f ? 55 : 40)
#define JAppDelegate (AppDelegate *)[UIApplication sharedApplication].delegate
#define URL(url) [NSURL URLWithString:url]


#define WLPlaceholderImage  [UIImage imageNamed:@"PlaceHoldeimage"]

#define JPushLoginSucessed @"JPushLoginSucess"
#define JPushLoginout @"JPushLoginout"
#define FIRST_IN_KEY @"FIRST_IN_KEY"
//版本
#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0

#ifdef DEBUG

//#define kServer @"https://api.jsojs.com"
#define kServer @"https://tapi.jsojs.com"

#else

#define kServer @"https://api.jsojs.com"

#endif

#endif /* Macro_h */
