//
//  JSHotGoodsViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/17.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSHotGoodsViewController.h"
#import "HotGoodsHeaderView.h"
#import "JSThemeListTableViewCell.h"

@interface JSHotGoodsViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) HotGoodsHeaderView *headView;
@end

@implementation JSHotGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.naviView.title.text = @"热门商品";
    [self.naviView.backImage setTintColor:UIColor666];
    [self setLayout];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    

}

- (void)setLayout{
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.naviView.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
}


#pragma mark -----<UITableViewDataSource>-----
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"JSThemeListTableViewCell";
    JSThemeListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[JSThemeListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HotGoodsHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"HotGoodsHeaderView"];
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[NSClassFromString(@"JSThemeListDetailViewController") new] animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    JLog(@"offsety------%f",offsetY);
    
    if(offsetY>=50)//headview的高度
    {
        self.naviView.title.alpha = 1;//上推
    }else if(offsetY<=30){
        self.naviView.title.alpha = 0;//下拉
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
        [_listTableView registerClass:[HotGoodsHeaderView class] forHeaderFooterViewReuseIdentifier:@"HotGoodsHeaderView"];
        [_listTableView registerClass:[JSThemeListTableViewCell class] forCellReuseIdentifier:@"JSThemeListTableViewCell"];
        [self.view addSubview:_listTableView];
    }
    return _listTableView;
}

@end
