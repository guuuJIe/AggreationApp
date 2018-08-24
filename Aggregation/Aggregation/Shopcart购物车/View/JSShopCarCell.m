//
//  JSShopCarCell.m
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import "JSShopCarCell.h"
#import "JSShopCarDataTableViewCell.h"
#import "JSShopCarHeadView.h"
#import "JSShopCarFooterView.h"
#import "UIView+Category.h"
@interface JSShopCarCell()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *listTableView;
@property (nonatomic , strong) NSArray *dataArr;
@end

@implementation JSShopCarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        [self InsertSubiews];
    }
    
    return self;
}



- (void)InsertSubiews
{
    [self.contentView addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(12);
        make.left.mas_equalTo(self.contentView).offset(12);
        make.right.mas_equalTo(self.contentView).offset(-12);
        make.bottom.mas_equalTo(self.contentView);
    }];
    [self.listTableView layoutIfNeeded];
    [self.listTableView setCornerRadius:8 withShadow:YES withOpacity:0.6];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

- (void)setupData:(NSArray *)datas
{
    _dataArr = datas;
    [self.listTableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JLog(@"%lu",(unsigned long)self.dataArr.count);
    return self.dataArr.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
 
    static NSString *Identifier = @"JSShopCarCell";
    JSShopCarDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[JSShopCarDataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    cell.tag = indexPath.row +100;
    return cell;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.listTableView == tableView) {
        return YES;
    }else{
        return NO;
    }
    
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{

     WeakSelf(self);
    if (tableView == self.listTableView) {
       
        UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
            
            JLog(@"点击了删除");
        }];
        //    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"修改" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        //
        //
        //
        //
        //        JLog(@"点击了修改");
        //    }];
        //    editAction.backgroundColor = [UIColor colorWithHexString:@"ff9900"];
        deleteAction.backgroundColor = [UIColor colorWithHexString:@"ff4c4c"];
        return @[deleteAction];
    }
    
    return @[];
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat cornerRadius = 8.f;
    cell.backgroundColor = UIColor.clearColor;
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init];
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGRect bounds = cell.bounds;
    
    NSInteger numberOfRows = 0;
   
    numberOfRows = cell.tag - 100;

    
    BOOL needSeparator = NO;
    
    if (indexPath.row == 0 && numberOfRows == 1) {
        CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
    }else if (indexPath.row == 0) {
        // 初始起点为cell的左下角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
        
        needSeparator = YES;
        
    } else if (indexPath.row == numberOfRows -1) {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
    } else {
        CGPathAddRect(pathRef, nil, bounds);
        needSeparator = YES;
    }
    
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    CFRelease(pathRef);
    layer.fillColor = [UIColor whiteColor].CGColor;
    
    //    if (self.showSeparator && needSeparator) {
    //        CALayer *lineLayer = [[CALayer alloc] init];
    //        CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
    //        lineLayer.frame = CGRectMake(self.separatorInset.left, bounds.size.height - lineHeight, bounds.size.width - (self.separatorInset.left + self.separatorInset.right), lineHeight);
    //        lineLayer.backgroundColor = self.tableView.separatorColor.CGColor;
    //        [layer addSublayer:lineLayer];
    //    }
    
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    cell.backgroundView = roundView;
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    backgroundLayer.fillColor = [UIColor groupTableViewBackgroundColor].CGColor;
    [selectedBackgroundView.layer insertSublayer:backgroundLayer below:cell.layer];
    selectedBackgroundView.backgroundColor = UIColor.clearColor;
    cell.selectedBackgroundView = selectedBackgroundView;
}




- (UITableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _listTableView.tableFooterView = [UIView new];
        _listTableView.delegate = self;
        _listTableView.dataSource = self;
        _listTableView.tableHeaderView = [UIView new];
        _listTableView.estimatedRowHeight = 40;
        _listTableView.rowHeight = UITableViewAutomaticDimension;
        _listTableView.backgroundColor = [UIColor whiteColor];
        [_listTableView registerClass:[JSShopCarDataTableViewCell class] forCellReuseIdentifier:@"JSShopCarDataTableViewCell"];
        _listTableView.showsVerticalScrollIndicator = NO;
        _listTableView.bounces = NO;
        [self.contentView addSubview:_listTableView];;
    }
    return _listTableView;
}




@end
