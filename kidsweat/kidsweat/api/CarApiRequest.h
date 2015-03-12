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

