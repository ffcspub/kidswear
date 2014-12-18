//
//  ProductApi.h
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"
#import "ProductApiRequest.h"
#import "ProductApiResponse.h"

@interface ProductApi : RestBaseAPI

/**
 *  获取购物车列表
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getCarGoodsByRequest:(GetCarGoodsApiRequest *)request completionBlockWithSuccess:(void(^)(GetCarGoodsApiResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  删除购物车商品
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)dropCarGoodsByRequest:(DropCarGoodsApiRequest *)request completionBlockWithSuccess:(void(^)(DropCarGoodsApiResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  更新购物车商品
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)updateCarGoodsByRequest:(UpdateCarApiRequest *)request completionBlockWithSuccess:(void(^)(UpdateCarApiResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

@end
