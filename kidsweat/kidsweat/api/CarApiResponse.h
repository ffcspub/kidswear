//
//  CarApiResponse.h
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPIResponse.h"

/**
 *  查询购物车商品列表
 */
@interface GetCarGoodsApiResponse : NSObject

@property(nonatomic,assign) int Total;

@property(nonatomic,assign) float * Total_price;

@property(nonatomic,strong) NSArray *Goods_list;

@end


/**
 *  删除购物车商品列表
 */
@interface DropCarGoodsApiResponse : NSObject

@property(nonatomic,strong) NSString *rec_id;

@end

/**
 *  修改购物车商品列表
 */
@interface UpdateCarApiResponse : NSObject

@property(nonatomic,strong) NSString *rec_id;

@property(nonatomic,assign) int goods_number;

@property(nonatomic,strong) NSString * token;

@end



