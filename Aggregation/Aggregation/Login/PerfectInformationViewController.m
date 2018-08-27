//
//  PerfectInformationViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/27.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "PerfectInformationViewController.h"
#import "JTextField.h"
#import "AlertPopView.h"

@interface PerfectInformationViewController ()<UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) JTextField  *nameText;
@property (nonatomic , strong) JTextField  *personText;
@property (nonatomic , strong) JTextField  *telText;
@property (nonatomic , strong) JTextField  *areaText;
@property (nonatomic , strong) JTextField  *adressText;
@property (nonatomic , strong) JTextField  *adressdetailText;


@end

@implementation PerfectInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"完善信息";
    [self setLayout];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)setLayout
{
//    self.retunKey = [[IQKeyboardReturnKeyHandler alloc] initWithViewController:self];
//    self.retunKey.lastTextFieldReturnKeyType = UIReturnKeyDone;
//    [self.retunKey addResponderFromView:self.view];
    

    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
    UILabel *telLbl = [UILabel new];
    telLbl.text = @"店铺名称";
    telLbl.font = UIFont13;
    telLbl.textColor = UIColor333;
    [self.scrollView addSubview:telLbl];
    [telLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(51*AdapterScal);
        make.left.equalTo(self.view).offset(24*AdapterScal);
    }];
    [self.nameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(telLbl.mas_bottom).offset(15*AdapterScal);
    }];
    UIView *lineview = [UIView new];
    lineview.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nameText);
        make.top.equalTo(self.nameText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    
    UILabel *connactLbl = [UILabel new];
    connactLbl.text = @"联系人";
    connactLbl.font = UIFont13;
    connactLbl.textColor = UIColor333;
    [self.scrollView addSubview:connactLbl];
    [connactLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(24*AdapterScal);
    }];
    [self.personText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(connactLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(connactLbl.mas_bottom).offset(15*AdapterScal);
    }];
    UIView *lineview2 = [UIView new];
    lineview2.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview2];
    [lineview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.nameText);
        make.top.equalTo(self.personText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
////
    UILabel *telPhoneLbl = [UILabel new];
    telPhoneLbl.text = @"联系电话";
    telPhoneLbl.font = UIFont13;
    telPhoneLbl.textColor = UIColor333;
    [self.scrollView addSubview:telPhoneLbl];
    [telPhoneLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview2.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(24*AdapterScal);
    }];
    [self.telText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(telPhoneLbl.mas_bottom).offset(15*AdapterScal);
    }];
    UIView *lineview3 = [UIView new];
    lineview3.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview3];
    [lineview3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.telText);
        make.top.equalTo(self.telText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
//
//
    UILabel *areaPhoneLbl = [UILabel new];
    areaPhoneLbl.text = @"联系店址";
    areaPhoneLbl.font = UIFont13;
    areaPhoneLbl.textColor = UIColor333;
    [self.scrollView addSubview:areaPhoneLbl];
    [areaPhoneLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview3.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(24*AdapterScal);
    }];
    [self.areaText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(areaPhoneLbl.mas_bottom).offset(15*AdapterScal);
    }];
    UIView *lineview4 = [UIView new];
    lineview4.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview4];
    [lineview4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.areaText);
        make.top.equalTo(self.areaText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
    UIButton *button = [UIButton new];
    [button setTitle:@"选择区域\U0000e6a7" forState:0];
    [button setTitleColor:UIColor999 forState:0];
    [button.titleLabel setFont:iconFontSize(15)];
    [self.scrollView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineview4);
        make.centerY.equalTo(self.areaText);
    }];
//
    UILabel *adressLbl = [UILabel new];
    adressLbl.text = @"地址";
    adressLbl.font = UIFont13;
    adressLbl.textColor = UIColor333;
    [self.scrollView addSubview:adressLbl];
    [adressLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview4.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(24*AdapterScal);
    }];
    [self.adressText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(adressLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(adressLbl.mas_bottom).offset(15*AdapterScal);
    }];
    UIView *lineview5 = [UIView new];
    lineview5.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview5];
    [lineview5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.adressText);
        make.top.equalTo(self.adressText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];
    UIButton *button2 = [UIButton new];
    [button2 setTitle:@"选择地址\U0000e6a7" forState:0];
    [button2 setTitleColor:UIColor999 forState:0];
    [button2.titleLabel setFont:iconFontSize(15)];
    [self.scrollView addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lineview4);
        make.centerY.equalTo(self.adressText);
    }];
//
//
    UILabel *adressdetailLbl = [UILabel new];
    adressdetailLbl.text = @"详细地址";
    adressdetailLbl.font = UIFont13;
    adressdetailLbl.textColor = UIColor333;
    [self.scrollView addSubview:adressdetailLbl];
    [adressdetailLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview5.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.scrollView).offset(24*AdapterScal);
    }];
    [self.adressdetailText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(adressdetailLbl);
        make.right.equalTo(self.view).offset(-25*AdapterScal);
        make.top.equalTo(adressdetailLbl.mas_bottom).offset(15*AdapterScal);
    }];

    UIView *lineview6 = [UIView new];
    lineview6.backgroundColor = UIColore5e5;
    [self.scrollView addSubview:lineview6];
    [lineview6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.adressdetailText);
        make.top.equalTo(self.adressdetailText.mas_bottom).offset(10*AdapterScal);
        make.height.mas_equalTo(JLineHeight);
    }];



    UIView *view = [UIView new];
    view.backgroundColor = UIColorfff;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.scrollView);
        make.bottom.equalTo(self.scrollView);
        make.height.mas_equalTo(44*AdapterScal+BottomAreaHeight);
    }];

    UIButton *login = [UIButton new];
    [login setTitle:@"创建" forState:0];
    [login setTitleColor:UIColorfff forState:0];
    [login setBackgroundColor:UIColor495e];
    [login addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:login];
    [login mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.scrollView);
        make.top.equalTo(view);
        make.height.mas_equalTo(44*AdapterScal);
    }];
    
    
}



- (void)clickAction:(UIButton *)button
{
    AlertPopView *popView = [[AlertPopView alloc] init];
    [popView show];
}

- (JTextField *)nameText
{
    if (!_nameText) {
        _nameText = [JTextField new];
        _nameText.placeholder = @"店铺名称";
        _nameText.textColor = UIColor999;
        _nameText.jing_placeholderFont = UIFont14;
        _nameText.font = UIFont14;
        _nameText.returnKeyType = UIReturnKeyDone;
        _nameText.delegate = self;
        [self.scrollView addSubview:_nameText];
    }
    return _nameText;
}

- (JTextField *)personText
{
    if (!_personText) {
        _personText = [JTextField new];
        _personText.placeholder = @"联系人";
        _personText.textColor = UIColor999;
        _personText.jing_placeholderFont = UIFont14;
        _personText.font = UIFont14;
        _personText.returnKeyType = UIReturnKeyDone;
        _personText.delegate = self;
        [self.scrollView addSubview:_personText];
    }
    return _personText;
}

- (JTextField *)telText
{
    if (!_telText) {
        _telText = [JTextField new];
        _telText.placeholder = @"联系电话";
        _telText.textColor = UIColor999;
        _telText.jing_placeholderFont = UIFont14;
        _telText.font = UIFont14;
        _telText.returnKeyType = UIReturnKeyDone;
        _telText.delegate = self;
        [self.scrollView addSubview:_telText];
    }
    return _telText;
}

- (JTextField *)areaText
{
    if (!_areaText) {
        _areaText = [JTextField new];
        _areaText.placeholder = @"";
        _areaText.textColor = UIColor999;
        _areaText.jing_placeholderFont = UIFont14;
        _areaText.font = UIFont14;
        _areaText.returnKeyType = UIReturnKeyDone;
        _areaText.delegate = self;
        [self.scrollView addSubview:_areaText];
    }
    return _areaText;
}

- (JTextField *)adressText
{
    if (!_adressText) {
        _adressText = [JTextField new];
        _adressText.placeholder = @"";
        _adressText.textColor = UIColor999;
        _adressText.jing_placeholderFont = UIFont14;
        _adressText.font = UIFont14;
        _adressText.returnKeyType = UIReturnKeyDone;
        _adressText.delegate = self;
        [self.scrollView addSubview:_adressText];
    }
    return _adressText;
}

- (JTextField *)adressdetailText
{
    if (!_adressdetailText) {
        _adressdetailText = [JTextField new];
        _adressdetailText.placeholder = @"";
        _adressdetailText.textColor = UIColor999;
        _adressdetailText.jing_placeholderFont = UIFont14;
        _adressdetailText.font = UIFont14;
        _adressdetailText.returnKeyType = UIReturnKeyDone;
        _adressdetailText.delegate = self;
        [self.scrollView addSubview:_adressdetailText];
    }
    return _adressdetailText;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
@end
