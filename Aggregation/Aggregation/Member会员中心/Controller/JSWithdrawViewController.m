//
//  JSWithdrawViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/24.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSWithdrawViewController.h"
#import "JSWithdrawTableViewCell.h"
#import "JSWithdrawSectionTwoTableViewCell.h"
#import "WithdrawPopView.h"
#import "WithdrawDetailPopView.h"

@interface JSWithdrawViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *listTableView;
@end

@implementation JSWithdrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    [self setLayout];
}



- (void)setNav
{
    self.title = @"可提现返利";
     self.enableScrollToBottomFill=YES;
    self.navigationBar.scrollType=SL_NavigationBarScrollType_Fade;
    [self.navigationBar.btnBack setImage:[UIImage imageNamed:@"Back"] forState:0];
    [self.navigationBar.btnBack setTintColor:UIColor1919];
}

- (void)setLayout
{
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationBar.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
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
            static NSString *Identifier = @"JSWithdrawTableViewCell";
            JSWithdrawTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
            if (cell == nil) {
                cell = [[JSWithdrawTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
            }
            cell.withdrawBlock = ^{
                WithdrawPopView *popView = [[WithdrawPopView alloc] init];
                [popView show];
              
            };
            WeakSelf(self);
            cell.clickBlock = ^(NSInteger tag) {
                [weakself.listTableView reloadData];
            };
            return cell;
        }
            break;
        case 1:
        {
            static NSString *Identifier = @"JSMemberCenterSectionTwoTableViewCell";
            JSWithdrawSectionTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
            if (cell == nil) {
                cell = [[JSWithdrawSectionTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
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
    if (indexPath.section == 1) {
        WithdrawDetailPopView *popView = [[WithdrawDetailPopView alloc] init];
        [popView show];
    }
}


- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.rowHeight = UITableViewAutomaticDimension;
        _listTableView.estimatedRowHeight = 40;
        _listTableView.backgroundColor = [UIColor clearColor];
        _listTableView.tableFooterView = [UIView new];
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_listTableView registerClass:[JSWithdrawTableViewCell class] forCellReuseIdentifier:@"JSWithdrawTableViewCell"];
        [_listTableView registerClass:[JSWithdrawSectionTwoTableViewCell class] forCellReuseIdentifier:@"JSWithdrawSectionTwoTableViewCell"];
        _listTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_listTableView];
    }
    return _listTableView;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self sl_optimzeScroll:scrollView];
}
@end
