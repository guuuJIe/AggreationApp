//
//  MineInfoViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "MineInfoViewController.h"
#import "MineInfoSectionOneTableViewCell.h"
#import "MineInfoSectionTwoTableViewCell.h"

@interface MineInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) NSArray *datas;
@end

@implementation MineInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupLayout];
}


- (void)setupLayout
{
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-TabBarHeight);
    }];
    AdjustsScrollViewInsetNever(self, self.listTableView);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        default:
            break;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            static NSString *identifier = @"MineInfoSectionOneTableViewCell";
            MineInfoSectionOneTableViewCell *sectionOneCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (sectionOneCell == nil) {
                sectionOneCell = [[MineInfoSectionOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            WeakSelf(self);
            sectionOneCell.clickBlock = ^(NSInteger tag) {
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSMineOrderViewController") new] animated:YES];
            };
            sectionOneCell.setClickBlock = ^{
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSMemberCenterViewController") new] animated:YES];
            };
            return sectionOneCell;

        }
            break;
        case 1:
        {
            static NSString *identifier = @"MineInfoSectionTwoTableViewCell";
            MineInfoSectionTwoTableViewCell *sectionTwoCell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (sectionTwoCell == nil) {
                sectionTwoCell = [[MineInfoSectionTwoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            [sectionTwoCell setupData:self.datas[indexPath.row]];
            if (indexPath.row == self.datas.count - 1) {
                sectionTwoCell.rightLabel.text = @"400-877-9199";
            }
            return sectionTwoCell;
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

- (NSArray *)datas
{
    if (!_datas) {
        _datas = @[@{@"image":@"icon_mine5",@"leftText":@"收货地址"},@{@"image":@"icon_mine7",@"leftText":@"会员中心"},@{@"image":@"icon_mine8",@"leftText":@"联系客服"}];
    }
    return _datas;
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
        [_listTableView registerClass:[MineInfoSectionOneTableViewCell class] forCellReuseIdentifier:@"MineInfoSectionOneTableViewCell"];
        [_listTableView registerClass:[MineInfoSectionTwoTableViewCell class] forCellReuseIdentifier:@"MineInfoSectionTwoTableViewCell"];
        [self.view addSubview:_listTableView];
    }
    return _listTableView;
}

@end
