//
//  JSConfirmOrderViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSConfirmOrderViewController.h"
#import "JSConfirmOrderHeadView.h"
#import "ConfirmOrderTableViewCell.h"
#import "ConfirmOrderSecitonOneTableViewCell.h"
#import "ConfirmOrderSectionThreeTableViewCell.h"
#import "ConfirmOrderSectionFourTableViewCell.h"
#import "SubmitOrderView.h"
#import "UIView+Category.h"
#import "AlertPopView.h"

@interface JSConfirmOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UIImageView *barImage;
@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) NSArray *dataArr;
@property (nonatomic , strong) SubmitOrderView *orderView;
@end

@implementation JSConfirmOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr = @[@[@"",@""],
                 @[@""],
                 @[@"",@"",@""]
                 ];
    // Do any additional setup after loading the view.
  
    [self setNav];
    [self setlayout];

}

- (void)setNav
{
    self.barImage = self.navigationController.navigationBar.subviews.firstObject;
    [self.navigationItem.leftBarButtonItem setTintColor:UIColorfff];
    self.title = @"确认订单";
    self.navigationController.navigationBar.titleTextAttributes=
    @{NSForegroundColorAttributeName:[UIColor clearColor],
      NSFontAttributeName:[UIFont systemFontOfSize:16]};
    
}
- (void)setlayout
{
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.orderView.mas_top);
    }];
    AdjustsScrollViewInsetNever(self, self.listTableView);
    [self.orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50+BottomAreaHeight);
        make.bottom.equalTo(self.view);
    }];
    
    [self.orderView layoutIfNeeded];
    [self.orderView setCornerRadius:0 withShadow:YES withOpacity:0.3];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    

    NSArray *arr = self.dataArr[section];
    return arr.count+3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    NSArray *arr = self.dataArr[section];
    
    
    if (row == 0){//店铺名cell
        static NSString *Identifier = @"ConfirmOrderSecitonOneTableViewCell";
        ConfirmOrderSecitonOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[ConfirmOrderSecitonOneTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        return cell;
        
    }else if (row == arr.count+1) {//倒数第2个即付款方式
        
        static NSString *Identifier = @"ConfirmOrderSectionThreeTableViewCell";
        ConfirmOrderSectionThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[ConfirmOrderSectionThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        return cell;
        
    }else if (row == (arr.count+2)){//倒数最后一个即商品金额
        
        static NSString *Identifier = @"ConfirmOrderSectionFourTableViewCell";
        ConfirmOrderSectionFourTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[ConfirmOrderSectionFourTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        return cell;
    }else{//商品cell
        
        static NSString *Identifier = @"ConfirmOrderTableViewCell";
        ConfirmOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        if (cell == nil) {
            cell = [[ConfirmOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        }
        return cell;
        
        
    }
    

  
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 250;
    }else{
        return 0.01f;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        JSConfirmOrderHeadView *headview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"JSConfirmOrderHeadView"];
        return headview;
    }else{
        return [UIView new];
    }
    
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
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:1];
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView.tableFooterView = [UIView new];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.showsVerticalScrollIndicator = NO;
        _listTableView.sectionHeaderHeight = 0.1f;
        _listTableView.sectionFooterHeight = 0.1f;
         _listTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.01)];
       
        _listTableView.estimatedRowHeight = 40;
        _listTableView.rowHeight = UITableViewAutomaticDimension;
        _listTableView.backgroundColor = [UIColor clearColor];
        [_listTableView registerClass:[ConfirmOrderTableViewCell class] forCellReuseIdentifier:@"ConfirmOrderTableViewCell"];
        [_listTableView registerClass:[JSConfirmOrderHeadView class] forHeaderFooterViewReuseIdentifier:@"JSConfirmOrderHeadView"];
        [_listTableView registerClass:[ConfirmOrderSecitonOneTableViewCell class] forCellReuseIdentifier:@"ConfirmOrderSecitonOneTableViewCell"];
        [_listTableView registerClass:[ConfirmOrderSectionThreeTableViewCell class] forCellReuseIdentifier:@"ConfirmOrderSectionThreeTableViewCell"];
        [_listTableView registerClass:[ConfirmOrderSectionFourTableViewCell class] forCellReuseIdentifier:@"ConfirmOrderSectionFourTableViewCell"];
        
        [self.view addSubview:_listTableView];;
    }
    return _listTableView;
}

- (SubmitOrderView *)orderView
{
    if (!_orderView) {
        _orderView = [[SubmitOrderView alloc] init];
        WeakSelf(self);
        _orderView.clickBlock = ^{
            AlertPopView *popView = [[AlertPopView alloc] init];
            [popView show];
        };
        [self.view addSubview:_orderView];
    }
    return _orderView;
}
@end
