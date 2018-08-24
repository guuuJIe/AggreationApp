


//
//  LoginCodeBtn.m
//  jsjhb2b
//
//  Created by qiangchen on 16/6/27.
//  Copyright © 2016年 com.jsojs.b2b.app. All rights reserved.
//

#import "LoginCodeBtn.h"
#import "UIImage+Category.h"
//#import "CodeBtnApiManager.h"

@interface LoginCodeBtn()
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)NSInteger count;
@property (nonatomic , assign) LoginCodeBtnType type;
//@property (nonatomic , strong) CodeBtnApiManager *apiManager;
@end

@implementation LoginCodeBtn

+(instancetype)initWithType:(LoginCodeBtnType)type{
    LoginCodeBtn *btn = [LoginCodeBtn new];
    btn.type = type;
    return btn;
}

-(instancetype)init
{
    self=[super init];
    if (self) {
        self.count=60;
        [self.titleLabel setText:@"获取验证码"];
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.layer.masksToBounds = YES;
        [self addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
        self.layer.cornerRadius = LoginCodeBtnCornerRadius;
        self.titleLabel.font = LoginCodeBtnFont;
        self.backgroundColor = [UIColor clearColor];
        
        
        [self setTitleColor:LoginTitleColorNormal forState:UIControlStateNormal];
        
        
        [self setBackgroundImage:[UIImage createImageWithColor:UIColor495e] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage createImageWithColor:UIColorccc] forState:UIControlStateDisabled];

//        self.layer.borderColor = JSCGlobalThemeColor.CGColor;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        self.count=60;
        [self.titleLabel setText:@"获取验证码"];
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.layer.masksToBounds = YES;
        [self addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
        self.layer.cornerRadius = LoginCodeBtnCornerRadius;
        self.titleLabel.font = LoginCodeBtnFont;
        self.backgroundColor = [UIColor clearColor];
        
        
        [self setTitleColor:LoginTitleColorNormal forState:UIControlStateNormal];

        
        [self setBackgroundImage:[UIImage createImageWithColor:UIColor49b8ff] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage createImageWithColor:UIColorccc] forState:UIControlStateDisabled];
        
        
    }
    return self;
}

-(void)startTime{
    self.enabled = NO;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeRun:) userInfo:nil repeats:YES];
    [self.timer fire];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

-(void)startClick
{
    self.enabled = NO;
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeRun:) userInfo:nil repeats:YES];
    [self.timer fire];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
//    NSInteger isOk = self.getCodeBlock();
    
//    if(isOk == 1){
//
//        [JSMBManager showLoading];
//        if(self.type == LoginCodeBtnTypeWithGetPabCode){
//
//            NSMutableDictionary *param = [JSCUtil tokenParam];
//            [param setValue:self.payment_sn forKey:@"payment_sn"];
//            [param setValue:self.bindId forKey:@"bindId"];
//
//            [self.apiManager getPabCodeWithparameters:param withCompletionHandler:^(NSError *error, MessageBody *result) {
//                [JSMBManager hideAlert];
//                if (result.code!=1) {
//                    [JSMBManager showBriefAlert:result.message];
//                    return ;
//                }else{
//                    NSDictionary *dic = result.result;
//                    JSLog(@"%@",dic);
//                    self.dateTime = dic[@"dateTime"];
//                    self.enabled = NO;
//                    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeRun:) userInfo:nil repeats:YES];
//                    [self.timer fire];
//                    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
//                }
//            }];
//        }else{
//            NSDictionary *dic = @{@"mobile":self.phoneNumer,@"type":[NSString stringWithFormat:@"%lu",(unsigned long)self.type]};;
//            [self.apiManager getCodeWithparameters:dic withCompletionHandler:^(NSError *error, MessageBody *result) {
//                [JSMBManager hideAlert];
//                if (result.code!=200) {
//                    [JSMBManager showBriefAlert:result.message];
//                    return ;
//                }else{
//                    self.enabled = NO;
//                    self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeRun:) userInfo:nil repeats:YES];
//                    [self.timer fire];
//                    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
//                }
//            }];
//        }
//
//    }
    
}

-(void)timeRun:(NSTimer *)timer
{
    self.count--;
    
    [self setTitle:[NSString stringWithFormat:@"%ld秒",(long)self.count] forState:UIControlStateNormal];
    if (self.count==0) {
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.timer invalidate];
        self.timer=nil;
        self.count=60;
//        [self setUserInteractionEnabled:YES];
self.enabled = YES;

    }
    
}

-(void)dealloc
{
    
    [self.timer invalidate];
    self.timer=nil;
}

//-(CodeBtnApiManager *)apiManager
//{
//    if(!_apiManager)
//    {
//        _apiManager=[CodeBtnApiManager  new];
//    }
//    return _apiManager;
//}

@end
