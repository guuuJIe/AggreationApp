//
//  JSMineOrderViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSMineOrderViewController.h"
#import "JSShopCarDataTableViewCell.h"
#import "JSOrderHeadView.h"
#import "JSMineOrdersTableViewCell.h"
#import "JSOrderFooterView.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
#import "JSMineOrdesSectionOneTableViewCell.h"
#import "UIImage+Category.h"
#import "OrderTopView.h"

@interface JSMineOrderViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) NSArray *datas;
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , assign) CGFloat offset;
@property (nonatomic , strong) UIImageView *bgImage;//红色那块背景
@property (nonatomic , strong) UIImageView *circleImage;//半圆形
@property (nonatomic , strong) UIImageView *nagationImage;
@property (nonatomic , strong) OrderTopView *topView;
@property (nonatomic , strong) UILabel *titleLabel;

@property (nonatomic , assign) CGRect headImageframe;
@end

@implementation JSMineOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _datas = @[@[@"",@""],@[@""],@[@"",@""],@[@""]];
    self.view.backgroundColor = RGB(242, 242, 242);
    [self setNav];
    [self setupLayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self setNav];
}

- (void)setNav
{
    self.title = @"我的订单";
    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
    self.nagationImage = self.navigationController.navigationBar.subviews.firstObject;

}
- (void)setupLayout
{
   

    UIImageView *bgImage = [UIImageView new];
    bgImage.image = [UIImage imageNamed:@"bgview"];
    [self.view addSubview:bgImage];
    bgImage.userInteractionEnabled = YES;
    [bgImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(SafeNavAreaTopHeight+60*AdapterScal);
    }];
    self.bgImage = bgImage;
    [self.bgImage layoutIfNeeded];
    
    UILabel *title = [UILabel new];
    title.text = @"我的订单";
    title.textColor = UIColorfff;
    title.font = [UIFont boldSystemFontOfSize:22];
    [bgImage addSubview:title];
    self.titleLabel = title;
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImage).offset((10+SafeNavAreaTopHeight)*AdapterScal);
        make.left.equalTo(bgImage).offset(14);
//        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgImage);
        make.height.mas_equalTo(50*AdapterScal);
        make.top.equalTo(self.bgImage.mas_bottom).offset(-5*AdapterScal);
    }];
    

    
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom).offset(5*AdapterScal);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];

    self.headImageframe = self.bgImage.frame;
    AdjustsScrollViewInsetNever(self, self.listTableView);
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
//    if (section == 0) {
//        return 80;
//    }else{
        return 10;
//    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    if (section == 0) {
//        JSOrderHeadView *headerView = [[JSOrderHeadView alloc] initWithReuseIdentifier:@"JSOrderHeadView"];
//
//        return headerView;
//    }else{
        return [UIView new];
//    }
    
    
    
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isEqual: self.listTableView]) {
        CGFloat contentOffset = scrollView.contentOffset.y;
        
        CGFloat  alpha = contentOffset/600*AdapterScal;
        if (alpha > 1) {
            alpha = 1;
        }else if (alpha <= 0){
            alpha = 0;
        }
        
        JLog(@"%f",alpha);
        self.nagationImage.backgroundColor =  [UIColor colorWithRed:3 green:3 blue:3 alpha:alpha];
        JLog(@"%f",contentOffset);
        if (self.listTableView.contentOffset.y > 50) {
            
            [self.navigationItem.leftBarButtonItem setTintColor:UIColor666];
//            self.titleLabel.textColor = [UIColor clearColor];

            self.navigationController.navigationBar.titleTextAttributes=
            @{NSForegroundColorAttributeName:UIColor000,
              NSFontAttributeName:[UIFont systemFontOfSize:16]};
                // 上滑
            [self.bgImage mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view);
                make.height.mas_equalTo(SafeNavAreaTopHeight);
            }];
            
            [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.bgImage.mas_bottom).offset(0*AdapterScal);
            }];

            [UIView animateWithDuration:0.5 animations:^{
                [self.view layoutIfNeeded];
            }];
            
        }else if(self.listTableView.contentOffset.y<-1){
             // 下滑
//            self.nagationImage.backgroundColor = [UIColor clearColor];
//            self.titleLabel.textColor = UIColorfff;
            [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];

            self.navigationController.navigationBar.titleTextAttributes=
            @{NSForegroundColorAttributeName:[UIColor clearColor],
              NSFontAttributeName:[UIFont systemFontOfSize:16]};
            
            [self.bgImage mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self.view);
                    make.height.mas_equalTo(SafeNavAreaTopHeight+60*AdapterScal);
            }];
                


            [self.topView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.bgImage.mas_bottom).offset(-5*AdapterScal);
            }];
            
            
            [UIView animateWithDuration:0.5 animations:^{
                [self.view layoutIfNeeded];
            }];
            


            

            
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    // 获取开始拖拽时tableview偏移量

    _offset = self.listTableView.contentOffset.y;
    JLog(@"%f",_offset);
}

#pragma mark ------Lazy-------

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
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
        
        [_listTableView registerClass:[JSMineOrdersTableViewCell class] forCellReuseIdentifier:@"JSMineOrdersTableViewCell"];
        [_listTableView registerClass:[JSMineOrdesSectionOneTableViewCell class] forCellReuseIdentifier:@"JSMineOrdesSectionOneTableViewCell"];
        [_listTableView registerClass:[JSOrderHeadView class] forHeaderFooterViewReuseIdentifier:@"JSOrderHeadView"];
        [_listTableView registerClass:[JSOrderFooterView class] forHeaderFooterViewReuseIdentifier:@"JSOrderFooterView"];
        
        _listTableView.showsVerticalScrollIndicator = NO;
        _listTableView.mj_header = [JGifHeader headerWithRefreshingBlock:^{
            [self->_listTableView.mj_header endRefreshing];
        }];
        [self.view addSubview:_listTableView];;
    }
    return _listTableView;
}

- (OrderTopView *)topView
{
    if (!_topView) {
        _topView = [[OrderTopView alloc] init];
        WeakSelf(self);
        _topView.clickBlock = ^(NSInteger tag) {
            [weakself.listTableView.mj_header beginRefreshing];
            
        };
        
    }
    return _topView;
}
@end
