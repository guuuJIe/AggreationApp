//
//  GoodsStautesOperationView.h
//  Aggregation
//
//  Created by chenqiang on 2018/8/21.
//  Copyright © 2018年 Aggregation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsStautesOperationView : UIView
@property (nonatomic , strong) NSMutableArray *btnModelArray;
@property (nonatomic,copy) void(^orderHandleBlock)(NSString *flag);
-(void)setOrderOption;
@end
