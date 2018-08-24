//
//  JSGoodsDetailViewController.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/18.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSGoodsDetailViewController.h"
#import "SDCycleScrollView.h"
#import "JSGoodsDetailView.h"
#import "JSAddInCarView.h"
@interface JSGoodsDetailViewController ()<UIScrollViewDelegate,SDCycleScrollViewDelegate>
@property (nonatomic , strong) UIScrollView *scrollView;
@property (nonatomic , strong) SDCycleScrollView *focusHeadView;
@property (nonatomic , strong) JSGoodsDetailView *detailView;
@property (nonatomic , strong) UIImageView *goodsImage;
@property (nonatomic , strong) UIView *descView;

@property (nonatomic , strong) UIView *bgview;
@property (nonatomic , strong) JSAddInCarView *addIncarView;
@end

@implementation JSGoodsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.backBarButtonItem = nil;
    [self setlayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.backBarButtonItem = nil;
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
}



- (void)setlayout
{
    
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
    UIView *bgview = [[UIView alloc] init];
    bgview.backgroundColor = [UIColor whiteColor];
    [self.scrollView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.scrollView);
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    [bgview addSubview:self.focusHeadView];
    [self.focusHeadView setFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
    
    [bgview addSubview:self.detailView];
//    [self.detailView setFrame:CGRectMake(0, CGRectGetMaxY(self.focusHeadView.frame)-40*AdapterScal, ScreenHeight, 0)];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.focusHeadView.mas_bottom).offset(-40*AdapterScal);
        make.left.right.equalTo(bgview);
    }];
    
    [self.view layoutIfNeeded];//得到frame
    
    
    [bgview addSubview:self.goodsImage];
    JLog(@"高度啊 啊啊啊 %.2f",self.detailView.frame.size.width);
    [self.goodsImage setFrame:CGRectMake(0, CGRectGetMaxY(self.detailView.frame), ScreenWidth, 300)];
    self.goodsImage.backgroundColor = [UIColor redColor];
    
    [bgview addSubview:self.descView];
    [self.descView setFrame:CGRectMake(0, CGRectGetMaxY(self.detailView.frame), ScreenWidth, 500)];
    
    self.descView.backgroundColor = [UIColor whiteColor];
    
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.goodsImage.mas_bottom).offset(50*AdapterScal);
//        make.bottom.equalTo(self.addIncarView.mas_top);
    }];
    
    self.bgview = bgview;
    
    [self.addIncarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(50*AdapterScal+BottomAreaHeight);
        make.bottom.equalTo(self.view).offset(0);
    }];
//    AdjustsScrollViewInsetNever(self, self.scrollView);
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
    
}

-(SDCycleScrollView *)focusHeadView{
    if (!_focusHeadView) {
        _focusHeadView = [SDCycleScrollView new];
        _focusHeadView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _focusHeadView.currentPageDotColor = ThemeColor;
        _focusHeadView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
        _focusHeadView.placeholderImage = [UIImage new];
        _focusHeadView.tag = 200;
        _focusHeadView.delegate = self;
#ifdef DEBUG
        
        [_focusHeadView setImageURLStringsGroup:@[@"http://cdnimg.jsojs.com/goods_item1/300085/icon.jpg@!414",@"http://cdnimg.jsojs.com/goods_item1/300085/icon06.jpg@!414"]];
        #else
        
#endif
        
        
    }
    return _focusHeadView;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.alwaysBounceVertical = YES;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (JSGoodsDetailView *)detailView
{
    if (!_detailView) {
        _detailView = [JSGoodsDetailView new];
        WeakSelf(self);
        _detailView.clickBlock = ^(NSInteger tag) {
            if (tag == 200) {
                weakself.goodsImage.hidden = NO;
                weakself.descView.hidden = YES;
                [weakself.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(weakself.goodsImage).offset(50*AdapterScal);
                }];
                JLog(@"%.2f",CGRectGetMaxY(weakself.goodsImage.frame));
                [weakself.scrollView setContentSize:CGSizeMake(ScreenWidth, CGRectGetMaxY(weakself.goodsImage.frame)+50)];
            }else{
                weakself.goodsImage.hidden = YES;
                weakself.descView.hidden = NO;
                [weakself.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(weakself.descView).offset(50*AdapterScal);
                }];
                JLog(@"%.2f",CGRectGetMaxY(weakself.descView.frame));
                [weakself.scrollView setContentSize:CGSizeMake(ScreenWidth, CGRectGetMaxY(weakself.descView.frame))];
            }

        };
    }
    return _detailView;
}

-(UIView *)descView{
    if(!_descView){
        _descView = [UIView new];
        _descView.hidden = YES;
        
    }
    return _descView;
}

-(UIImageView *)goodsImage{
    if(!_goodsImage){
        _goodsImage = [UIImageView new];
        _goodsImage.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _goodsImage;
}

- (JSAddInCarView *)addIncarView
{
    if (!_addIncarView) {
        _addIncarView = [JSAddInCarView new];
        [self.view addSubview:_addIncarView];
    }
    return _addIncarView;
}
@end
