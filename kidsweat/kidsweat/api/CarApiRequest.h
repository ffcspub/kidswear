//
//  CarApiRequest.h
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPIRequest.h"

/**
 *  查询购物车商品列表
 */
@interface GetCarGoodsApiRequest : RestBaseAPIRequest

@end

/**
 *  删除购物车商品列表
 */
@interface DropCarGoodsApiRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *rec_id;

@end

/**
 *  修改购物车商品列表
 */
@interface UpdateCarApiRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *rec_id;

@property(nonatomic,assign) int goods_number;

@property(nonatomic,strong) NSString * token;

@end

/**
 *  查询商品列表
 */
@interface QueryGoodsListRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSNumber *category_id;//商品类别id 女孩：43  男孩:44 围巾:57   配饰:45  包包:46
@property(nonatomic,strong) NSString *keywords;//关键字
@property(nonatomic,assign) int page;//第几页
@property(nonatomic,strong) NSNumber *brand;//品牌
@property(nonatomic,strong) NSNumber *Price_max;//最高价
@property(nonatomic,strong) NSNumber *Price_min;//最低价
@property(nonatomic,strong) NSString *sort;//排序字段，可选值有'goods_id', 'shop_price', 'last_update'
@property(nonatomic,strong) NSString *order;//排序顺序，可选值有’asc’,’desc’

@end
