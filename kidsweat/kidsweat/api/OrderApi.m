//
//  OrderApi.m
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "OrderApi.h"

@implementation OrderApi

+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"QueryOrderListRequest":@"QueryOrderListResponse",
                     @"OrderDelRequest":@"RestBaseAPIResponse",
                     @"OrderCreateRequest":@"RestBaseAPIResponse",
                     @"OrderAddressUpdateRequest":@"RestBaseAPIResponse",
                     @"OrderSureOrCancelRequest":@"RestBaseAPIResponse"
                     };
    });
    return NSClassFromString([classDic objectForKey:key]);
}


/**
 *  获取订单列表
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryOrderListByRequest:(QueryOrderListRequest *)request completionBlockWithSuccess:(void(^)(QueryOrderListResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((QueryOrderListResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  删除订单
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)delOrderByRequest:(OrderDelRequest *)request completionBlockWithSuccess:(void(^)(void))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess();
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  新增订单
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)createOrderByRequest:(OrderCreateRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess(response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  更新订单收货人信息
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)updateOrderAddressByRequest:(OrderAddressUpdateRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess(response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}


/**
 *  订单确定或取消订单
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)sureOrCancelOrderByRequest:(OrderSureOrCancelRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess(response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end
