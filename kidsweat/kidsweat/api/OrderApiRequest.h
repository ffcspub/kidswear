//
//  OrderApiRequest.h
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueryOrderListResponse : NSObject

@property(nonatomic,strong) NSString *Pagesize;//每页多少条
@property(nonatomic,strong) NSString *Page;//当前条几页
@property(nonatomic,strong) NSString *Total;//总订单数量
@property(nonatomic,strong) NSString *IsLastpage;//是否最后一页
@property(nonatomic,strong) NSArray *order_list;//订单列表

@end