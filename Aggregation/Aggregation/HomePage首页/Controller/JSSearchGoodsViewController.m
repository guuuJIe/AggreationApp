//
//  JSSearchGoodsViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/22.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSSearchGoodsViewController.h"
#import "CommsearchBar.h"
#import "JSSearchTitleView.h"
#import "HotSearchCollectionReusableView.h"
#import "GuseeYoulikeCollectionViewCell.h"
@interface JSSearchGoodsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) CommsearchBar *searchBar;
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) JSSearchTitleView *titleView;
@end

@implementation JSSearchGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNav];
    
    [self setLayout];
}

- (void)setNav
{
    
    self.navigationItem.titleView = self.searchBar;
    UIButton *button = [UIButton new];
    [button setTitle:@"取消" forState:0];
    [button setTitleColor:UIColor333 forState:0];
    [button.titleLabel setFont:UIFont14];
    [button setTitleColor:UIColor666 forState:UIControlStateSelected];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
}

- (void)setLayout
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
}


- (void)back:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GuseeYoulikeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GuseeYoulikeCollectionViewCell" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 170);
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if(kind == UICollectionElementKindSectionHeader){
        //            if(indexPath.section == 0){
        HotSearchCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HotSearchCollectionReusableView" forIndexPath:indexPath];
        
        reusableview = headView;
        
        
        //            }
    }
    if(kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionFooterViewID" forIndexPath:indexPath];
        
        footerView.backgroundColor = [UIColor clearColor];
        
        reusableview = footerView;
        
        
    }
    return reusableview;
    
}

-(JSSearchTitleView *)titleView
{
    if(!_titleView)
    {
        _titleView=[[JSSearchTitleView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        
        
    }
    return _titleView;
}
-(CommsearchBar *)searchBar
{
    if(!_searchBar)
    {
        _searchBar=[[CommsearchBar alloc]init];
        [_searchBar setFrame:CGRectMake(0, 7, ScreenWidth-120, 44)];
        [_searchBar setImage:[UIImage imageNamed:@"search"] forSearchBarIcon:UISearchBarIconSearch state:0];
        
    }
    return _searchBar;
}

- (UICollectionView *)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(ScreenWidth/3, ScreenWidth/3+30);
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 15, 0, 15);// 每一个 section 与周边的间距
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 10;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[HotSearchCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HotSearchCollectionReusableView"];
        [_collectionView registerClass:[GuseeYoulikeCollectionViewCell class] forCellWithReuseIdentifier:@"GuseeYoulikeCollectionViewCell"];
        
    }
    return _collectionView;
}
@end
