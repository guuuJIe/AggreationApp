//
//  JSMemberCenterViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/23.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSMemberCenterViewController.h"
#import "JSMemberCenterSectionOneTableViewCell.h"
#import "JSMemberCenterSectionTwoTableViewCell.h"
#import "ShareView.h"
@interface JSMemberCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) UIImageView *barImage;
@end

@implementation JSMemberCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    [self setupLayout];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
}

- (void)setNav
{
    self.title = @"会员中心";
    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
    self.barImage = self.navigationController.navigationBar.subviews.firstObject;
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor clearColor],
      NSFontAttributeName:[UIFont systemFontOfSize:16]};
}

- (void)setupLayout
{
   
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    AdjustsScrollViewInsetNever(self, self.listTableView);
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else{
        return 8;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            static NSString *Identifier = @"JSMemberCenterSectionOneTableViewCell";
            JSMemberCenterSectionOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
            if (cell == nil) {
                cell = [[JSMemberCenterSectionOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            }
            WeakSelf(self);
            cell.clickBlock = ^{
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSJoinViewController") new] animated:YES];
            };
            
            cell.withdrawClickBlock = ^(NSInteger tag) {
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSWithdrawViewController") new]  animated:YES];
            };
            return cell;
        }
            break;
        case 1:
        {
            static NSString *Identifier = @"JSMemberCenterSectionTwoTableViewCell";
            JSMemberCenterSectionTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
            if (cell == nil) {
                cell = [[JSMemberCenterSectionTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            }
            
            return cell;
        }
            break;
        default:
        {
            static NSString *Identifier = @"Identifier";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            }
            
            return cell;
        }
            break;
    }
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShareView *popView = [[ShareView alloc] init];
    [popView show];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y;
    if (offset>SafeNavAreaTopHeight) {
        self.barImage.backgroundColor = UIColor495e;
        self.navigationController.navigationBar.titleTextAttributes=
        @{NSForegroundColorAttributeName:UIColorfff,
          NSFontAttributeName:[UIFont systemFontOfSize:16]};
    } else {
        self.barImage.backgroundColor = [UIColor clearColor];
        self.navigationController.navigationBar.titleTextAttributes=
        @{NSForegroundColorAttributeName:[UIColor clearColor],
          NSFontAttributeName:[UIFont systemFontOfSize:16]};
    }
}


- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.estimatedRowHeight = 40;
        _listTableView.rowHeight = UITableViewAutomaticDimension;
        _listTableView.backgroundColor = [UIColor clearColor];
        _listTableView.tableFooterView = [UIView new];
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_listTableView registerClass:[JSMemberCenterSectionOneTableViewCell class] forCellReuseIdentifier:@"JSMemberCenterSectionOneTableViewCell"];
        [_listTableView registerClass:[JSMemberCenterSectionTwoTableViewCell class] forCellReuseIdentifier:@"JSMemberCenterSectionTwoTableViewCell"];
        [self.view addSubview:_listTableView];
    }
    return _listTableView;
}


@end
