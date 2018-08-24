//
//  JSPurchaseOfGoodsViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/20.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSPurchaseOfGoodsViewController.h"
#import "CommSearchView.h"
#import "UIImage+Category.h"
#import "JSTopSelectView.h"
#import "JSPurchaseGoodsCollectionViewCell.h"
#import "CommsearchBar.h"
#import "JSSearchTitleView.h"
@interface JSPurchaseOfGoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) CommSearchView *searchView;
@property (nonatomic , strong) JSTopSelectView *selectView;
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , assign) BOOL Grid;
@property (nonatomic , strong) CommsearchBar *searchBar;
@property (nonatomic , strong) JSSearchTitleView *titleView;
@end

@implementation JSPurchaseOfGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:UIColorfff] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTranslucent:NO];
    self.Grid = YES;
    [self setNav];
    [self setupSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:UIColorfff] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setTranslucent:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setTranslucent:YES];
//     [self.navigationController.navigationBar setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)setNav
{
    
    self.navigationItem.titleView = self.searchBar;
    
    UIButton *searchbutton = [UIButton new];
    [self.navigationItem.titleView addSubview:searchbutton];
//    [searchbutton setBackgroundColor:UIColor495e];
    [searchbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.searchBar);
    }];
//    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.titleView.mas_right).offset(-7);
//        make.height.equalTo(@(30));
//        make.left.equalTo(self.titleView).offset(7);
//        make.centerY.equalTo(self.titleView);
//    }];
    UIButton *button = [UIButton new];
    [button setTitle:@"\U0000e73f" forState:0];
    [button setTitle:@"\U0000e742" forState:UIControlStateSelected];
   
    [button setTitleColor:UIColor666 forState:0];
    [button.titleLabel setFont:iconFontSize(20)];
    [button setTitleColor:UIColor666 forState:UIControlStateSelected];
    [button addTarget:self action:@selector(changeLayout:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

- (void)changeLayout:(UIButton *)button
{
    button.selected = !button.selected;
    self.Grid = !self.Grid;
    [self.collectionView reloadData];
}

- (void)setupSubviews{

    
    [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(SafeNavAreaTopHeight);
        make.height.mas_equalTo(45*AdapterScal);
    }];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.selectView.mas_bottom).offset(15);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JSPurchaseGoodsCollectionViewCell *purchaseGoodsCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSPurchaseGoodsCollectionViewCell" forIndexPath:indexPath];
    purchaseGoodsCell.isGrid = self.Grid;
    return purchaseGoodsCell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.Grid)
    {
        return CGSizeMake(320.0/2*AdapterScal, 480.0/2*AdapterScal);
    }else
    {
        return CGSizeMake(ScreenWidth, 100*AdapterScal);
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(self.Grid)
    {
        return UIEdgeInsetsMake(0, 15, 0,15);
    }else
    {
        return UIEdgeInsetsMake(0, 0, 0, 0);
    }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if(self.Grid)
    {
        return 10;
    }else
    {
        return 15;
    }
}
#pragma mark -get
-(JSSearchTitleView *)titleView
{
    if(!_titleView)
    {
        _titleView=[[JSSearchTitleView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        
        
    }
    return _titleView;
}

- (CommSearchView *)searchView
{
    if (!_searchView) {
        _searchView = [[CommSearchView alloc] initWithClickType:true andFrame:CGRectMake(0, 0, 692.0/2, 40)];
        
        _searchView.backgroundColor = UIColorf4f4;
        _searchView.placeholder = @"搜索商品";
        
    }
    return _searchView;
}

-(CommsearchBar *)searchBar
{
    if(!_searchBar)
    {
        _searchBar=[[CommsearchBar alloc]init];
        [_searchBar setFrame:CGRectMake(0, 7, ScreenWidth-120, 30)];
//        _searchBar.delegate=self;
//        _searchBar.backgroundColor = UIColorf4f4;
        [_searchBar setImage:[UIImage imageNamed:@"search"] forSearchBarIcon:UISearchBarIconSearch state:0];
        
    }
    return _searchBar;
}



- (JSTopSelectView *)selectView
{
    if (!_selectView) {
        _selectView = [[JSTopSelectView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 45*AdapterScal)];
    
        [self.view addSubview:_selectView];
    }
    return _selectView;
}

-(UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(320.0/2*AdapterScal, 480.0/2*AdapterScal);
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);// 每一个 section 与周边的间距
        flowLayout.minimumInteritemSpacing = 15.0;
        flowLayout.minimumLineSpacing = 10.0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[JSPurchaseGoodsCollectionViewCell class] forCellWithReuseIdentifier:@"JSPurchaseGoodsCollectionViewCell"];
       
    }
    return _collectionView;
}

@end
