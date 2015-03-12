//
//  OrderApi.h
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OrderApiRequest.h"
#import "OrderApiResponse.h"
#import "RestBaseAPI.h"

@interface OrderApi : RestBaseAPI

/**
 *  获取订单列表
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryOrderListByRequest:(QueryOrderListRequest *)request completionBlockWithSuccess:(void(^)(QueryOrderListResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  删除订单
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)delOrderByRequest:(OrderDelRequest *)request completionBlockWithSuccess:(void(^)(void))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  新增订单
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)createOrderByRequest:(OrderCreateRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  更新订单收货人信息
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)updateOrderAddressByRequest:(OrderAddressUpdateRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;


/**
 *  订单确定或取消订单
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)sureOrCancelOrderByRequest:(OrderSureOrCancelRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;


@end
