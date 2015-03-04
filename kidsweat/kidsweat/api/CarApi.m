//
//  CarApi.m
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CarApi.h"

@implementation CarApi

+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"GetCarGoodsApiRequest":@"GetCarGoodsApiResponse",
                     @"DropCarGoodsApiRequest":@"DropCarGoodsApiResponse",
                     @"UpdateCarApiRequest":@"UpdateCarApiResponse"
                     };
    });
    return NSClassFromString([classDic objectForKey:key]);
}

/**
 *  获取购物车列表
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getCarGoodsByRequest:(GetCarGoodsApiRequest *)request completionBlockWithSuccess:(void(^)(GetCarGoodsApiResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((GetCarGoodsApiResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  删除购物车商品
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)dropCarGoodsByRequest:(DropCarGoodsApiRequest *)request completionBlockWithSuccess:(void(^)(DropCarGoodsApiResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((DropCarGoodsApiResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  更新购物车商品
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)updateCarGoodsByRequest:(UpdateCarApiRequest *)request completionBlockWithSuccess:(void(^)(UpdateCarApiResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UpdateCarApiResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end