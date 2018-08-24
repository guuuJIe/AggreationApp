//
//  JSHomePageViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/16.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSHomePageViewController.h"
#import "JSHomePageSectionOneCollectionViewCell.h"
#import "JSHomePageSectionTwoCollectionViewCell.h"
#import "JSHeadBannerCollectionReusableView.h"
#import "JSHomePageSectionThreeCollectionViewCell.h"
#import "JSHomePageThemeCollectionViewCell.h"
#import "JSCHomeCommpanyRecommendCollectionViewCell.h"
#import "CommSearchView.h"
#import "JSHotGoodsViewController.h"
@interface JSHomePageViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic , strong) UICollectionView *collectionView;
@end

@implementation JSHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupLayout];
}

- (void)setupLayout
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-TabBarHeight);
    }];
    AdjustsScrollViewInsetNever(self, self.collectionView);
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            JSHomePageSectionOneCollectionViewCell *sectionOneCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSHomePageSectionOneCollectionViewCell" forIndexPath:indexPath];
            return sectionOneCell;
        }
            break;
        case 1:
        {
            JSHomePageSectionTwoCollectionViewCell *sectionTwoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSHomePageSectionTwoCollectionViewCell" forIndexPath:indexPath];
            WeakSelf(self);
            sectionTwoCell.clickBlock = ^(NSInteger index) {
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSPurchaseOfGoodsViewController") new] animated:YES];
            };
            return sectionTwoCell;
        }
            break;
        case 2:
        {
            JSHomePageSectionThreeCollectionViewCell *thirdSectionCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSHomePageSectionThreeCollectionViewCell" forIndexPath:indexPath];
            WeakSelf(self);
            thirdSectionCell.clickBlock = ^(NSInteger index) {
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSGoodsDetailViewController") new] animated:YES];
            };
            return thirdSectionCell;
        }
            break;
        case 3:
        {
            JSHomePageThemeCollectionViewCell *ThemeCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSHomePageThemeCollectionViewCell" forIndexPath:indexPath];
            WeakSelf(self);
            ThemeCell.clickBlock = ^(NSInteger index) {
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSHotGoodsViewController") new] animated:YES];
            };
            return ThemeCell;
        }
            break;
        case 4:
        {
            JSCHomeCommpanyRecommendCollectionViewCell *commpanyCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JSCHomeCommpanyRecommendCollectionViewCell" forIndexPath:indexPath];
            WeakSelf(self);
            commpanyCell.clickBlock = ^(NSInteger index) {
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSCompayDetailViewController") new] animated:YES];
            };
            return commpanyCell;
        }
            break;
        default:
        {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            cell.backgroundColor = [UIColor clearColor];
            return cell;
        }
            break;
    }
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
        {
            return CGSizeMake(ScreenWidth, 80);
        }
            break;
        case 1:
        {
            return CGSizeMake(ScreenWidth, 521.0/2*AdapterScal);
        }
            break;
        case 2:
        {
            return CGSizeMake(ScreenWidth, 550*AdapterScal);
        }
            break;
            
        case 3:
        {
            return CGSizeMake(ScreenWidth, (580)/2*AdapterScal);
        }
            break;
        case 4:
        {
            return CGSizeMake(ScreenWidth, (140+80+100)/2*AdapterScal);
        }
            break;
            
            //            case 2:
            //        {
            
            //            NSInteger countIn = model.goods.count/2;//一行显示几个item
            //
            //            CGFloat coutF = countIn + (model.goods.count%2);//当数目为基数的时候出现 例如5个
            //
            //            CGFloat lineHeight = coutF * 10;//然后把这些高度加起来
            
            //cell本来想自适应 但是因为 一个cell上面可能要加其他控件 就算了手动自己算吧
            //        }
        default:
            return CGSizeZero;
            break;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGSize zerosize = CGSizeMake(ScreenWidth, 0);
    CGSize size = CGSizeMake(ScreenWidth, 10);
    
    switch (section)
    {
        case 0:
            return zerosize;
            break;
        case 1:
            return zerosize;
            break;
        case 2:
            return zerosize;
            break;
        case 3:
            return zerosize;
            break;
            
        case 4:
            return zerosize;
            break;
        default:
            return zerosize;
            break;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
        CGSize size = CGSizeMake(ScreenWidth, 10);
    CGSize zerosize = CGSizeMake(ScreenWidth, 0);
    
    switch (section) {
        case 0:
        {
            CGFloat height = 615.0/2.0 - 384.0/2  + 384.0/2.0*AdapterScal;
            return CGSizeMake(ScreenWidth, height);
            
        }
            break;
        case 1:
        {
            return zerosize;
            
        }
            break;
        case 2:
        {
            return zerosize;
            
        }
            break;
        case 3:
        {
            return zerosize;
            
        }
            break;
        case 4:
        {
            return zerosize;
            
        }
            break;
        default:
            return zerosize;
            break;
    }
    
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if(kind == UICollectionElementKindSectionHeader){
        if(indexPath.section == 0){
            JSHeadBannerCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JSHeadBannerCollectionReusableView" forIndexPath:indexPath];
            
            reusableview = headView;
            
            WeakSelf(self);
            headView.clickBlock = ^{
                [weakself.navigationController pushViewController:[NSClassFromString(@"JSSearchGoodsViewController") new] animated:YES];
            };
        }
    }
    if(kind == UICollectionElementKindSectionFooter){
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionFooterViewID" forIndexPath:indexPath];
        
        footerView.backgroundColor = [UIColor clearColor];
        
        reusableview = footerView;
        
        
    }
    return reusableview;
    
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    switch (section)
    {
        case 0:
            return 0;
            break;
            
        default:
            return 0;
            break;
    }
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    switch (section)
    {
        case 0:
            return 0;
            break;
            
        default:
            return 0;
            break;
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsZero;
}

- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(340/2*AdapterScal, 140/2*AdapterScal);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[JSHomePageSectionOneCollectionViewCell class] forCellWithReuseIdentifier:@"JSHomePageSectionOneCollectionViewCell"];
        [_collectionView registerClass:[JSHomePageSectionTwoCollectionViewCell class] forCellWithReuseIdentifier:@"JSHomePageSectionTwoCollectionViewCell"];//限时抢购
        [_collectionView registerClass:[JSHeadBannerCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JSHeadBannerCollectionReusableView"];
        [_collectionView registerClass:[JSHomePageSectionThreeCollectionViewCell class] forCellWithReuseIdentifier:@"JSHomePageSectionThreeCollectionViewCell"];//热门商品
        [_collectionView registerClass:[JSHomePageThemeCollectionViewCell class] forCellWithReuseIdentifier:@"JSHomePageThemeCollectionViewCell"];//主题推荐
        [_collectionView registerClass:[JSCHomeCommpanyRecommendCollectionViewCell class] forCellWithReuseIdentifier:@"JSCHomeCommpanyRecommendCollectionViewCell"];//推荐企业
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionFooterViewID"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.mj_header = [JGifHeader headerWithRefreshingBlock:^{
            [self.collectionView.mj_header endRefreshing];
        }];
        
    }
    return _collectionView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
