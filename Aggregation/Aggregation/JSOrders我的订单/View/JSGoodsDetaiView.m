//
//  JSGoodsDetaiView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSGoodsDetaiView.h"
#import "JSGoodsStatusHeadeView.h"
#import "JSGoodsStatusTableViewCell.h"
@interface JSGoodsDetaiView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *listTableView;
@end

@implementation JSGoodsDetaiView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(0);
        make.left.right.equalTo(self);
        make.height.mas_equalTo((50+100*2*AdapterScal)*2);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UIColore5e5;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.right.equalTo(self).offset(-12);
        make.top.equalTo(self.listTableView.mas_bottom).offset(1);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"付款方式";
    titleLabel.textColor = UIColor333;
    titleLabel.font = UIFont14;
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.top.equalTo(lineView.mas_bottom).offset(16);
    }];
    
    UILabel *titleLabel2 = [UILabel new];
    titleLabel2.text = @"货到付款";
    titleLabel2.textColor = UIColor333;
    titleLabel2.font = UIFont14;
    [self addSubview:titleLabel2];
    [titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(titleLabel);
    }];
    
    UILabel *stateLabel = [UILabel new];
    stateLabel.text = @"商家留言";
    stateLabel.textColor = UIColor333;
    stateLabel.font = UIFont14;
    [self addSubview:stateLabel];
    [stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLabel).offset(0);
        make.top.equalTo(titleLabel.mas_bottom).offset(16);
    }];
    
    UILabel *stateLabel2 = [UILabel new];
    stateLabel2.text = @"需要包装";
    stateLabel2.textColor = UIColor333;
    stateLabel2.font = UIFont14;
    [self addSubview:stateLabel2];
    [stateLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(stateLabel);
    }];
 
    JLog(@"%.2f",stateLabel.frame.size.height);
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth - 50, 1)];
    [self drawLineByUIView:image];
    [self addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stateLabel.mas_bottom).offset(16);
        make.left.equalTo(stateLabel);
        make.right.equalTo(self).offset(-14);
        make.height.mas_equalTo(JLineHeight);
    }];
    
    UILabel *jiner = [UILabel new];
    jiner.text = @"商家金额";
    jiner.textColor = UIColor333;
    jiner.font = UIFont14;
    [self addSubview:jiner];
    [jiner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(stateLabel).offset(0);
        make.top.equalTo(image.mas_bottom).offset(16);
    }];
    
    UILabel *jinerValue = [UILabel new];
    jinerValue.text = @"¥599.00";
    jinerValue.textColor = UIColor333;
    jinerValue.font = UIFont14;
    [self addSubview:jinerValue];
    [jinerValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(jiner);
    }];
    
    UILabel *yunfei = [UILabel new];
    yunfei.text = @"运费";
    yunfei.textColor = UIColor333;
    yunfei.font = UIFont14;
    [self addSubview:yunfei];
    [yunfei mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(stateLabel).offset(0);
        make.top.equalTo(jiner.mas_bottom).offset(16);
    }];
    
    UILabel *yunfeiValue = [UILabel new];
    yunfeiValue.text = @"¥599.00";
    yunfeiValue.textColor = UIColor333;
    yunfeiValue.font = UIFont14;
    [self addSubview:yunfeiValue];
    [yunfeiValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(yunfei);
    }];
    
    UILabel *zhifu = [UILabel new];
    zhifu.text = @"实际支付";
    zhifu.textColor = UIColor333;
    zhifu.font = UIFont14;
    [self addSubview:zhifu];
    [zhifu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(stateLabel).offset(0);
        make.top.equalTo(yunfei.mas_bottom).offset(16);
    }];
    
    UILabel *zhifuValue = [UILabel new];
    zhifuValue.text = @"¥599.00";
    zhifuValue.textColor = UIColor333;
    zhifuValue.font = UIFont14;
    [self addSubview:zhifuValue];
    [zhifuValue mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-12);
        make.centerY.equalTo(zhifu);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"JSMineOrdersTableViewCell";
    JSGoodsStatusTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[JSGoodsStatusTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    JSGoodsStatusHeadeView *headerView = [[JSGoodsStatusHeadeView alloc] initWithReuseIdentifier:@"JSGoodsStatusHeadeView"];
    
    return headerView;
    
}


- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView.tableFooterView = [UIView new];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.sectionHeaderHeight = 0.1f;
        _listTableView.sectionFooterHeight = 0.1f;
        _listTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.01)];
        _listTableView.estimatedRowHeight = 40;
        _listTableView.rowHeight = UITableViewAutomaticDimension;
        _listTableView.backgroundColor = [UIColor clearColor];
        
        [_listTableView registerClass:[JSGoodsStatusTableViewCell class] forCellReuseIdentifier:@"JSGoodsStatusTableViewCell"];
        [_listTableView registerClass:[JSGoodsStatusHeadeView class] forHeaderFooterViewReuseIdentifier:@"JSGoodsStatusHeadeView"];
       
        _listTableView.showsVerticalScrollIndicator = NO;
        [self addSubview:_listTableView];;
    }
    return _listTableView;
}

- (void)drawLineByUIView:(UIImageView *)imageView
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:imageView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(imageView.frame) / 2, CGRectGetHeight(imageView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:UIColor999.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(imageView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:4], [NSNumber numberWithInt:1], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(imageView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [imageView.layer addSublayer:shapeLayer];
}
@end
