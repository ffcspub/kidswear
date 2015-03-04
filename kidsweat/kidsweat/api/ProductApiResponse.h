//
//  ProductApiResponse.h
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

//查询商品列表返回
@interface QueryGoodsListResponse : NSObject

@property(nonatomic,strong) NSString *IsLastpage;//是否最后一页
@property(nonatomic,strong) NSArray *goods_list;//商品列表

@end
