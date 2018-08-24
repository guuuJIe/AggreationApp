//
//  JTextField.m
//  GlassCat
//
//  Created by chenqiang on 2017/10/11.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

/**
 - 属性介绍 -
 
 clearButtonMode 清除按钮
 UITextFieldViewModeNever,  清空按钮永不出现
 UITextFieldViewModeUnlessEditing,  不编辑的时候出现
 UITextFieldViewModeAlways 只要输入框有内容就出现
 
 UIKeyboardType 键盘类型
 http://blog.csdn.net/crazyzhang1990/article/details/39965931
 
 secureTextEntry 是否暗文
 */

#import "JTextField.h"
#import "JTextFieldWithUserName.h"
#import "JTextFieldWithLogin.h"
//#import "JTextFieldWithReturnLock.h"



@implementation JTextField


+(instancetype)textFieldWithType:(JTextFieldType)jTextFieldTpye{
    switch (jTextFieldTpye) {
        case JTextFieldTypeWithDefult:
            return [JTextField new];
            break;
        case JTextFieldTypeWithUserName:
            return [JTextFieldWithUserName new];
            break;
        case JTextFieldTypeWithLogin:
            return [JTextFieldWithLogin new];
            break;
//        case JTextFieldTypeWithReturnLockApply:
//            return [JTextFieldWithReturnLock new];
//            break;
        default:
            return [JTextField new];
            break;
    }
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setLayoutWithDefault];
        
    }
    return self;
}

-(void)setLayoutWithDefault{
    
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    /*
     默认。
     所有的设置的是默认值
     需要自己去设置
     */
}

#pragma mark - get


#pragma mark - override

- (void)textFieldDidChange:(UITextField *)textField
{
    if(self.maxLength == 0){
        return ;
    }
    if (textField == self) {
        if (textField.text.length > self.maxLength) {
            textField.text = [textField.text substringToIndex:self.maxLength];
        }
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    
    switch (self.jTextFieldBanType) {
        case JTextFieldBanTypeWithAll:
            if (action == @selector(selectAll:))
                return NO;
            
            if (action == @selector(paste:))
                return NO;
            
            // 禁用选择功能
            if (action == @selector(select:))
                return NO;
            break;
            
        case JTextFieldBanTypeWithPaste:
            
            // 禁用粘贴功能
            if (action == @selector(paste:))
                return NO;
            
            
            
            break;
            
        case JTextFieldBanTypeWithSelect:
            
            // 禁用选择全部功能
            if (action == @selector(selectAll:))
                return NO;
            
            // 禁用选择功能
            if (action == @selector(select:))
                return NO;
            
            break;
            
        default:
            break;
    }
    
    return [super canPerformAction:action withSender:sender];
}

#pragma mark - set
-(void)setLeftViewImage:(UIImage *)leftViewImage withWidth:(CGFloat)width{
    self.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, jTextFieldHeight)];
    if(leftViewImage != nil){
        UIImageView *leftImageView = [UIImageView new];
        leftImageView.image = leftViewImage;
        leftImageView.contentMode = UIViewContentModeCenter;
        [view addSubview:leftImageView];
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
        }];
    }
    self.leftView = view;
}


-(void)setJing_placeholderFont:(UIFont *)jing_placeholderFont{
    [self setValue:jing_placeholderFont forKeyPath:@"_placeholderLabel.font"];
}
-(void)setJing_placeholderColor:(UIColor *)jing_placeholderColor{
    [self setValue:jing_placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}

@end





/**
 - 额外例子 -
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
 #关键字: UITextField 占位符 浮动
 
 [JVFloatLabeledTextField](https://github.com/jverdi/JVFloatLabeledTextField)
 这个UI库组件包括一个UITextField状语从句：
 一个UITextView子类，
 它旨在通过让占位符转换成浮动标签，
 以便在填充文本之后将其悬停在字段上方，从而改善用户体验。
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
 #关键字: UITextField 模糊查询 下拉列表
 
 https://github.com/EddyBorja/MLPAutoCompleteTextField
 输入后 有模糊查询 可选择
 这个功能可以自己实现
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
 #关键字: UITextField 占位符 左右滑动
 
 http://code.cocoachina.com/view/136103
 
 设置textfield占位符的颜色大小,开始编辑的时候可以让占位符跟着移动..
 
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 */
