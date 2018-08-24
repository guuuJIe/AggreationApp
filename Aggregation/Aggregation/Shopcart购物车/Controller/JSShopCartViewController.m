//
//  JSShopCartViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSShopCartViewController.h"
#import "JSThemeDetailCollectionViewCell.h"
#import "JSShopCarNavView.h"
#import "ShopcarEmptyCollectionReusableView.h"
#import "JSShopCarDataTableViewCell.h"
#import "JSShopCarHeadView.h"
#import "JSShopCarFooterView.h"
#import "JSShopCarCell.h"

@interface JSShopCartViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) JSShopCarNavView *navView;
@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) NSMutableArray *dataArr;
@property (nonatomic , strong) NSArray *dataArray;
@end

@implementation JSShopCartViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[
                   @[@""],
                   @[@"",@""],
                   @[@"",@"",@""],
                   @[@"",@"",@"",@""],
                   ];
    // Do any additional setup after loading the view.

    
    [self setupLayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   self.view.backgroundColor =RGB(242, 242, 242);
}

- (void)setupLayout
{
   
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-TabBarHeight);
    }];
}

- (void)setupLayout2
{
//    self.view.backgroundColor =RGB(242, 242, 242);
//     self.listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SafeNavAreaTopHeight, ScreenWidth, ScreenHeight - TabBarHeight- SafeNavAreaTopHeight) style:UITableViewStyleGrouped];
//    self.listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
////    self.listTableView.estimatedRowHeight = 40;
////    self.listTableView.rowHeight = UITableViewAutomaticDimension;
//    // 隐藏UITableViewStyleGrouped上边多余的间隔
//    self.listTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
//    self.listTableView.sectionHeaderHeight = 0.1f;
//    self.listTableView.sectionFooterHeight = 12.0f;
//    self.listTableView.backgroundColor = [UIColor whiteColor];
//    self.listTableView.showsVerticalScrollIndicator = NO;
//    self.listTableView.delegate = self;
//    self.listTableView.dataSource = self;
//    self.listTableView.editing = NO;
//    [self.listTableView registerClass:[JSShopCarCell class] forCellReuseIdentifier:@"JSShopCarCell"];
////    [self.listTableView registerClass:[JSShopCarHeadView class] forHeaderFooterViewReuseIdentifier:@"JSShopCarHeadView"];
////    [self.listTableView registerClass:[JSShopCarFooterView class] forHeaderFooterViewReuseIdentifier:@"JSShopCarFooterView"];
//    // 分组样式需要设置
////    [self.listTableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
////    [self.listTableView setSeparatorColor:[UIColor blackColor]];
//    [self.view addSubview:self.listTableView];
//   
}

#pragma mark-----UICollectionViewDataSource--------
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JSThemeDetailCollectionViewCell *detailCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSThemeDetailCollectionViewCell" forIndexPath:indexPath];
    return detailCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    //330是无数据的高度
    NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:0];//记录全部个数
    for (int i  = 0; i<self.dataArray.count; i++) {
        NSArray *datas = self.dataArray[i];
        for (int j = 0; j<datas.count; j++) {
            [dataArr addObject:datas[j]];
        }
    }
    
    JLog(@"%lu",(unsigned long)dataArr.count);
                                        //间距                   //总个数的高度
    return CGSizeMake(ScreenWidth, 330+20*self.dataArray.count+dataArr.count*100);
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if(kind == UICollectionElementKindSectionHeader){
        //        if(indexPath.section == 0){
        ShopcarEmptyCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ShopcarEmptyCollectionReusableView" forIndexPath:indexPath];
        
        headView.dataArray = self.dataArray;
        reusableview = headView;
        
        //        }
    }
    if(kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionFooterViewID" forIndexPath:indexPath];
        
        footerView.backgroundColor = [UIColor clearColor];
        
        reusableview = footerView;
        
        
    }
    return reusableview;
    
}

#pragma mark ------UITableViewDataSource-----

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}



//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}
//
//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    WeakSelf(self);
//    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//
//        JLog(@"点击了删除");
//    }];
//    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//
//
//
//
//        JLog(@"点击了修改");
//    }];
//    editAction.backgroundColor = [UIColor colorWithHexString:@"ff9900"];
//    deleteAction.backgroundColor = [UIColor colorWithHexString:@"ff4c4c"];
//    return @[deleteAction, editAction];
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 40.0f;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    JSShopCarHeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"JSShopCarHeadView"];
//    return headView;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 30.0f;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    JSShopCarFooterView *footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"JSShopCarFooterView"];
//    return footView;
//}

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









#pragma mark ------Lazy-------


//- (UITableView *)listTableView
//{
//    if (!_listTableView) {
//        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:1];
//        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        _listTableView.tableFooterView = [UIView new];
//        _listTableView.delegate = self;
//        _listTableView.dataSource = self;
////        _listTableView.sectionHeaderHeight = 0.1f;
////        _listTableView.sectionFooterHeight = 0.1f;
//        _listTableView.tableHeaderView = [UIView new];
//        _listTableView.estimatedRowHeight = 40;
//        _listTableView.rowHeight = UITableViewAutomaticDimension;
//        _listTableView.backgroundColor = [UIColor clearColor];
////        _listTableView.layer.borderWidth = 0.5;
////        _listTableView.layer.borderColor = UIColorf4f4.CGColor;
//        [_listTableView registerClass:[JSShopCarDataTableViewCell class] forCellReuseIdentifier:@"JSShopCarDataTableViewCell"];
//        [_listTableView registerClass:[JSShopCarHeadView class] forHeaderFooterViewReuseIdentifier:@"JSShopCarHeadView"];
//        [_listTableView registerClass:[JSShopCarFooterView class] forHeaderFooterViewReuseIdentifier:@"JSShopCarFooterView"];
////        _listTableView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
////        _listTableView.layer.shadowOffset = CGSizeMake(10, -6);
////        _listTableView.layer.shadowOpacity = 0.4;
////        _listTableView.layer.shadowRadius = 4;
//        _listTableView.showsVerticalScrollIndicator = NO;
//        [self.view addSubview:_listTableView];;
//    }
//    return _listTableView;
//}


-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(320.0/2*AdapterScal, 480.0/2*AdapterScal);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);// 每一个 section 与周边的间距
        flowLayout.minimumInteritemSpacing = 15.0;
        flowLayout.minimumLineSpacing = 10.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[ShopcarEmptyCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ShopcarEmptyCollectionReusableView"];
        [_collectionView registerClass:[JSThemeDetailCollectionViewCell class] forCellWithReuseIdentifier:@"JSThemeDetailCollectionViewCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionFooterViewID"];
    }
    return _collectionView;
}

//- (NSMutableArray *)dataArr
//{
//    if (!_dataArr) {
//        _dataArr = [NSMutableArray arrayWithObjects:@"",@"",@"",@"", nil];
//
//    }
//    return _dataArr;
//}

- (JSShopCarNavView *)navView
{
    if (!_navView) {
        _navView = [JSShopCarNavView new];
        [self.view addSubview:_navView];
    }
    return _navView;
}

@end
