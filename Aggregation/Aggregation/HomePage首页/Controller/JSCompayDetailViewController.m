//
//  JSCompayDetailViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSCompayDetailViewController.h"
#import "JSCompanyDetailHeadView.h"
#import "JSCompanyDetailTableViewCell.h"

@interface JSCompayDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *listTableView;
@end

@implementation JSCompayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    [self setLayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self setNav];
}

- (void)setNav
{
    self.title = @"酒商酒汇";
    [self.navigationController.navigationBar setTranslucent:NO];
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:UIColorfff,
      NSFontAttributeName:[UIFont systemFontOfSize:18]};
}

- (void)setLayout
{
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"JSCompanyDetailTableViewCell";
    JSCompanyDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[JSCompanyDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
  
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    JSCompanyDetailHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"JSCompanyDetailHeadView"];
    return headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 140.0f;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y>SafeNavAreaTopHeight) {
        self.navigationController.navigationBar.titleTextAttributes=
        @{NSForegroundColorAttributeName:UIColor000,
          NSFontAttributeName:[UIFont systemFontOfSize:18]};
    }else{
        self.navigationController.navigationBar.titleTextAttributes=
        @{NSForegroundColorAttributeName:UIColorfff,
          NSFontAttributeName:[UIFont systemFontOfSize:18]};
    }
}

- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.tableFooterView = [UIView new];
        _listTableView.rowHeight = UITableViewAutomaticDimension;
        _listTableView.estimatedRowHeight = 40;
        _listTableView.backgroundColor = [UIColor clearColor];
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_listTableView registerClass:[JSCompanyDetailHeadView class] forHeaderFooterViewReuseIdentifier:@"JSCompanyDetailHeadView"];
        [_listTableView registerClass:[JSCompanyDetailTableViewCell class] forCellReuseIdentifier:@"JSCompanyDetailTableViewCell"];
        _listTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_listTableView];
    }
    return _listTableView;
}

@end
