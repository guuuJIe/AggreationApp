//
//  JSMineOrdersViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSMineOrdersViewController.h"
#import "JSShopCarDataTableViewCell.h"
#import "JSOrderHeadView.h"
#import "JSMineOrdersTableViewCell.h"
#import "JSOrderFooterView.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "JSMineOrdesSectionOneTableViewCell.h"
@interface JSMineOrdersViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) NSArray *datas;
@end

@implementation JSMineOrdersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _datas = @[@[@"",@""],@[@""]];
    [self setupNav];
    
    [self setupLayout];
}

- (void)setupNav
{
    self.naviView.title.text  =@"确认订单";
//    self.naviView.title.alpha = 0;
//    [self.naviView.backImage setTintColor:UIColorfff];
    
}

//- (void)setNav
//{
//    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgview"] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTranslucent:NO];
//}


- (void)setupLayout
{
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(SafeNavAreaTopHeight);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = self.datas[section];
    return arr.count+1;//加1表示店名
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        static NSString *Identifier = @"JSMineOrdesSectionOneTableViewCell";
        JSMineOrdesSectionOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[JSMineOrdesSectionOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        
        return cell;
    }else{
        static NSString *Identifier = @"JSMineOrdersTableViewCell";
        JSMineOrdersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[JSMineOrdersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        
        return cell;
    }
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 80;
    }else{
        return 15;
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        JSOrderHeadView *headerView = [[JSOrderHeadView alloc] initWithReuseIdentifier:@"JSOrderHeadView"];
        
        return headerView;
    }else{
        return [UIView new];
    }

   

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 100;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    JSOrderFooterView *footView = [[JSOrderFooterView alloc] initWithReuseIdentifier:@"JSOrderFooterView"];
    
    return footView;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[NSClassFromString(@"JSMineOrderDetailViewController") new]animated:YES];
}


#pragma mark ------Lazy-------


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

        [_listTableView registerClass:[JSMineOrdersTableViewCell class] forCellReuseIdentifier:@"JSMineOrdersTableViewCell"];
        [_listTableView registerClass:[JSMineOrdesSectionOneTableViewCell class] forCellReuseIdentifier:@"JSMineOrdesSectionOneTableViewCell"];
        [_listTableView registerClass:[JSOrderHeadView class] forHeaderFooterViewReuseIdentifier:@"JSOrderHeadView"];
        [_listTableView registerClass:[JSOrderFooterView class] forHeaderFooterViewReuseIdentifier:@"JSOrderFooterView"];

        _listTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_listTableView];;
    }
    return _listTableView;
}


@end
