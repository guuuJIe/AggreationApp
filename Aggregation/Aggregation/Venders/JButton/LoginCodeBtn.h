//
//  LoginCodeBtn.h
//  jsjhb2c
//
//  Created by chenqiang on 2017/3/27.
//  Copyright © 2017年 jsjh. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LoginCodeBtnSize CGSizeMake(93, 25)
#define LoginCodeBtnCornerRadius 4
#define LoginCodeBtnFont [UIFont systemFontOfSize:12]
#define LoginTitleColorNormal [UIColor whiteColor]


typedef enum : NSUInteger {
    LoginCodeBtnTypeWithPay = 1,
    LoginCodeBtnTypeWithOther = 2,
    LoginCodeBtnTypeWithLogin = 3,
    LoginCodeBtnTypeWithRegister = 4,
    LoginCodeBtnTypeWithBindTel = 5,
    LoginCodeBtnTypeWithFindPwd = 6,
    
    LoginCodeBtnTypeWithGetPabCode = 10,// 快捷支付 另一个接口
    
    
} LoginCodeBtnType;

@interface LoginCodeBtn : UIButton
@property(nonatomic,strong) NSString *phoneNumer;

// 快捷支付
@property (nonatomic , strong) NSString *payment_sn;
@property (nonatomic , strong) NSString *bindId;
@property (nonatomic , strong) NSString *isbalancepay;
@property (nonatomic , strong) NSString *dateTime;

@property (nonatomic,copy) NSInteger (^getCodeBlock)(void);
+(instancetype)initWithType:(LoginCodeBtnType)type;


/**
 手动开始倒计时
 */
-(void)startTime;

/**
 操作获取验证码
 */
-(void)startClick;

@end
