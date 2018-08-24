//
//  JSThemeListDetailViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSThemeListDetailViewController.h"
#import "JSThemeDetailCollectionViewCell.h"
#import "JSThemeDetailCollectionReusableView.h"
@interface JSThemeListDetailViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) UIImageView *barImage;
@end

@implementation JSThemeListDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setlayout];
    self.barImage = self.navigationController.navigationBar.subviews.firstObject;
}


- (void)setlayout
{
  
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"主题详情";
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    AdjustsScrollViewInsetNever(self, self.collectionView);
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    JSThemeDetailCollectionViewCell *detailCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSThemeDetailCollectionViewCell" forIndexPath:indexPath];
    return detailCell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 480);
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if(kind == UICollectionElementKindSectionHeader){
        //        if(indexPath.section == 0){
        JSThemeDetailCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JSThemeDetailCollectionReusableView" forIndexPath:indexPath];
        
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    CGFloat minAlphaOffset = - SafeNavAreaTopHeight;
//    CGFloat maxAlphaOffset = 200;
//    CGFloat offset = scrollView.contentOffset.y;
//    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    CGFloat  alpha = scrollView.contentOffset.y/600;
    if (alpha > 1) {
        alpha = 1;
    }
   
    JLog(@"%f",alpha);
    self.barImage.backgroundColor =  [UIColor colorWithRed:4 green:4 blue:4 alpha:alpha];
//    self.barImage.alpha = alpha;
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
        [_collectionView registerClass:[JSThemeDetailCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JSThemeDetailCollectionReusableView"];
        [_collectionView registerClass:[JSThemeDetailCollectionViewCell class] forCellWithReuseIdentifier:@"JSThemeDetailCollectionViewCell"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionFooterViewID"];
    }
    return _collectionView;
}

@end
