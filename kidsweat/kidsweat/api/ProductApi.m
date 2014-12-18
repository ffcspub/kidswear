//
//  ProductApi.m
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "ProductApi.h"

@implementation ProductApi

+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"GetCarGoodsApiRequest":@"GetCarGoodsApiResponse"
                     };
    });
    
    return NSClassFromString([classDic objectForKey:key]);
}


/**
 *  删除购物车商品
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)dropCarGoodsByRequest:(DropCarGoodsApiRequest *)request completionBlockWithSuccess:(void(^)(DropCarGoodsApiResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [ProductApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
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
    [ProductApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UpdateCarApiResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end
