//
//  JTextField.h
//  GlassCat
//
//  Created by chenqiang on 2017/10/11.
//  Copyright © 2017年 chenqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JTextFieldTypeWithDefult,
    JTextFieldTypeWithUserName,/**< 用户名 */
    JTextFieldTypeWithLogin,/**< 登录界面 */
    JTextFieldTypeWithRegisterPageCode,/**< 验证码 */
    JTextFieldTypeWithReturnLockApply,/**< 申请退款 */
} JTextFieldType;

typedef enum : NSUInteger {
    JTextFieldBanTypeWithNone,
    JTextFieldBanTypeWithPaste,/**< 禁止粘贴 */
    JTextFieldBanTypeWithSelect,/**< 禁止选择（禁止复制） */
    JTextFieldBanTypeWithAll,/**< 禁止所有 */
} JTextFieldBanType;

static const CGFloat jTextFieldHeight = 46;
static const CGFloat textFieldHeight = 30;
@interface JTextField : UITextField


@property (nonatomic , assign) NSInteger maxLength;/**< 设置 */
@property (nonatomic , strong) UIColor *jing_placeholderColor;/**< 占位符颜色 */
@property (nonatomic , strong) UIFont *jing_placeholderFont;/**< 占位符字体 */




// 我在想,一个项目的 leftView 的宽度是不是相同的

@property (nonatomic , assign) JTextFieldBanType jTextFieldBanType;/**< 是否 禁止 粘贴 选择 */



+(instancetype)textFieldWithType:(JTextFieldType)jTextFieldTpye;
-(void)setLeftViewImage:(UIImage *)leftViewImage withWidth:(CGFloat)width;/**< 设置 JTextFieldTypeWithLogin 的左图 */


@end
