//
//  ProductApi.m
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "GoodsApi.h"

@implementation GoodsApi

+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"QueryGoodsListRequest":@"QueryGoodsListResponse",
                     @"GetGoodDetailRequest":@"GoodDetail"
                     };
    });
    return NSClassFromString([classDic objectForKey:key]);
}

/**
 *  查询商品列表
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryGoodListByRequest:(QueryGoodsListRequest *)request completionBlockWithSuccess:(void(^)(QueryGoodsListResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((QueryGoodsListResponse *)response.Data);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}


/**
 *  获取商品详情
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getGoodDetailByRequest:(GetGoodDetailRequest *)request completionBlockWithSuccess:(void(^)(GoodDetail *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((GoodDetail *)response.Data);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end