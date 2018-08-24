//
//  WithdrawDetailPopView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "WithdrawDetailPopView.h"
#import "WithdrawDetailTableViewCell.h"

@interface WithdrawDetailPopView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UILabel *titleLabel2;
@property (nonatomic , strong) UILabel *titleLabel3;
@property (nonatomic , strong) UITableView *listTableView;
@end

@implementation WithdrawDetailPopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    self.type = MMPopupTypeCustom;
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ScreenWidth, ScreenHeight));
    }];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = UIColorfff;
    bgView.layer.cornerRadius = 6;
    bgView.layer.masksToBounds = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(537/2*AdapterScal, 640/2*AdapterScal));
    }];
    
    UILabel *titlelabel = [UILabel new];
    titlelabel.text = @"扫二维码付款-给林授予温州打包";
    titlelabel.textColor = UIColor333;
    titlelabel.font = UIFont16;
    [bgView addSubview:titlelabel];
    [titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView).offset(40*AdapterScal);
//        make.centerX.equalTo(bgView);
        make.left.equalTo(bgView).offset(20*AdapterScal);
        make.right.equalTo(bgView).offset(-15*AdapterScal);
    }];
    
    UILabel *moneyLabel = [UILabel new];
    moneyLabel.text = @"-8.5";
    moneyLabel.textColor = UIColor333;
    moneyLabel.font = [UIFont boldSystemFontOfSize:20];
    [bgView addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titlelabel.mas_bottom).offset(20*AdapterScal);
        make.centerX.equalTo(titlelabel);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = UIColore5e5;
    [bgView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(20);
        make.right.equalTo(bgView).offset(-20);
        make.height.mas_equalTo(JLineHeight);
        make.top.equalTo(moneyLabel.mas_bottom).offset(10*AdapterScal);
    }];
    
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(line);
        make.top.equalTo(line.mas_bottom).offset(10);
        make.height.mas_equalTo(200*AdapterScal);
    }];
    
    UILabel *xLabel = [UILabel new];
    xLabel.text = @"\U0000e724";
    xLabel.textColor = UIColor666;
    xLabel.font = iconFontSize(28);
    [self addSubview:xLabel];
    [xLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(15*AdapterScal);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(28, 28));
    }];
    
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideBg)]];
}


- (void)hideBg
{
    
    [self hide];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"WithdrawDetailTableViewCell";
    WithdrawDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[WithdrawDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
   
    return cell;
}



- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.rowHeight = 35*AdapterScal;
        _listTableView.backgroundColor = [UIColor clearColor];
        _listTableView.tableFooterView = [UIView new];
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_listTableView registerClass:[WithdrawDetailTableViewCell class] forCellReuseIdentifier:@"WithdrawDetailTableViewCell"];
        _listTableView.showsVerticalScrollIndicator = NO;
        _listTableView.bounces = NO;
        [self addSubview:_listTableView];
    }
    return _listTableView;
}



@end
