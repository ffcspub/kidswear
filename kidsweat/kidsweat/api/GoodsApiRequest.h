//
//  ProductApiRequest.h
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"

//查询商品列表返回
@interface QueryGoodsListRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *category_id;//商品类别 对应ID：女孩:43  男孩:44  围巾:57  配饰:45  包包:46

@property(nonatomic,strong) NSString *keywords;//关键字

@property(nonatomic,assign) int page;

@property(nonatomic,strong) NSString *brand;//品牌

@property(nonatomic,strong) NSString *Price_max;//最高价

@property(nonatomic,strong) NSString *Price_min;//最低价

@property(nonatomic,strong) NSString *sort;//排序字段，可选值有'goods_id', 'shop_price', 'last_update'

@property(nonatomic,strong) NSString *order;//排序顺序，可选值有’asc’,’desc’

@end

@interface GetGoodDetailRequest  : RestBaseAPIRequest

@property(nonatomic,strong) NSString *goods_id;

@end