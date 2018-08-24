//
//  JSHeadBannerCollectionReusableView.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/10.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSHeadBannerCollectionReusableView.h"
#import "TYCyclePagerView.h"
#import "NewHomeTRView.h"
#import "CommSearchView.h"
#import "TYPageControl.h"

@interface JSHeadBannerCollectionReusableView()<TYCyclePagerViewDelegate,TYCyclePagerViewDataSource>

@property (nonatomic , strong) TYCyclePagerView *pageFlowView;
@property (nonatomic , strong) UILabel *titleLabel;
@property (nonatomic , strong) CommSearchView *searchView;
@property (nonatomic , strong) TYPageControl *pageControl;
@property (nonatomic , strong) NSArray *datas;
@end

@implementation JSHeadBannerCollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _datas = @[@"",@"",@""];
        [self setupLayout];
        [self addPagerView];
        [self addPageControl];
        [self loadData];
    }
    return self;
}

- (void)setupLayout
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(16+StauesBarHeight);
        make.left.equalTo(self).offset(14);
    }];

    [self.searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(16*AdapterScal);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self).offset(-14);
    }];
    
    UIButton *button = [UIButton new];
    [self addSubview:button];
    [button addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.searchView);
    }];
}

- (void)search:(UIButton *)button
{
    if (self.clickBlock) {
        self.clickBlock();
    }
}

- (void)addPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
    pagerView.isInfiniteLoop = YES;
    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    // registerClass or registerNib
    [pagerView registerClass:[NewHomeTRView class] forCellWithReuseIdentifier:@"NewHomeTRView"];
    [self addSubview:pagerView];
    _pageFlowView = pagerView;
}

- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    pageControl.currentPageIndicatorSize = CGSizeMake(20, 6);
    pageControl.pageIndicatorSize = CGSizeMake(10, 6);
    pageControl.currentPageIndicatorTintColor = UIColor1f13;
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
   
    [_pageFlowView addSubview:pageControl];
    _pageControl = pageControl;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _pageFlowView.frame = CGRectMake(0, CGRectGetMaxY(self.searchView.frame), CGRectGetWidth(self.frame), 190*AdapterScal);
    _pageControl.frame = CGRectMake(0, CGRectGetHeight(_pageFlowView.frame) - 20*AdapterScal, CGRectGetWidth(_pageFlowView.frame), 26);
}

- (void)loadData
{
    _pageControl.numberOfPages = _datas.count;
    [_pageFlowView reloadData];
}
#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return _datas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    NewHomeTRView *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"NewHomeTRView" forIndex:index];
   
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame)*0.8, CGRectGetHeight(pageView.frame)*0.8);
    layout.itemSpacing = 15;
    layout.layoutType = 1;
  
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
 
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:24];
        _titleLabel.textColor = UIColor000;
        _titleLabel.text = @"首页";
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}


- (CommSearchView *)searchView
{
    if (!_searchView) {
        _searchView = [[CommSearchView alloc] initWithClickType:true andFrame:CGRectMake(0, 0, 692.0/2*AdapterScal, 32*AdapterHeightScal)];
        [self addSubview:_searchView];
        _searchView.backgroundColor = UIColorf4f4;
        
        _searchView.placeholder = @"搜索商品";
    }
    return _searchView;
}
@end
