//
//  ShopcarEmptyCollectionReusableView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "ShopcarEmptyCollectionReusableView.h"
#import "JSShopCarCell.h"
#import "JSShopCarNavView.h"
@interface ShopcarEmptyCollectionReusableView()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
@property (nonatomic , strong) UIImageView *emptyView;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) UITableView *listTableView;

@end

@implementation ShopcarEmptyCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        _dataArray = @[
//                       @[@""],
//                       @[@"",@""],
//                       @[@"",@"",@""],
////                       @[@"",@"",@"",@""],
//                       ];
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout
{
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10+StauesBarHeight);
        make.left.equalTo(self).offset(14);
       
    }];
    
    self.listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    self.listTableView.estimatedRowHeight = 40;
    //    self.listTableView.rowHeight = UITableViewAutomaticDimension;
    // 隐藏UITableViewStyleGrouped上边多余的间隔
    self.listTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
    self.listTableView.sectionHeaderHeight = 0.1f;
    self.listTableView.sectionFooterHeight = 12.0f;
    self.listTableView.backgroundColor = [UIColor whiteColor];
    self.listTableView.showsVerticalScrollIndicator = NO;
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    self.listTableView.emptyDataSetSource = self;
    self.listTableView.emptyDataSetDelegate = self;
    self.listTableView.bounces = NO;
    [self.listTableView registerClass:[JSShopCarCell class] forCellReuseIdentifier:@"JSShopCarCell"];
    [self addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10*AdapterScal);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-30);
    }];
    
    UILabel *likelabel =[UILabel new];
    likelabel.text = @"猜你喜欢";
    likelabel.font = UIFont16;
    likelabel.textColor = UIColor333;
    [self addSubview:likelabel];
    [likelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(14);
        make.top.equalTo(self.listTableView.mas_bottom);
    }];
}



- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self.listTableView reloadData];
}

#pragma mark ----UITableViewEmptyDataSource--------
- (UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView
{
    JSShopCarNavView *empty = [[JSShopCarNavView alloc] init];
    return empty;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view
{
    NSLog(@"我点击了");
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return -SafeNavAreaTopHeight;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *Identifier = @"JSShopCarCell";
    JSShopCarCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[JSShopCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    [cell setupData:self.dataArray[indexPath.section]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = _dataArray[indexPath.section];
    JLog(@"%lu",(unsigned long)arr.count);
    return 50.0f+(arr.count*92*AdapterScal);
    
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"购物车";
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}




@end
