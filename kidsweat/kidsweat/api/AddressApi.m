//
//  AddressApi.m
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "AddressApi.h"

@implementation AddressApi


+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"QueryAddressRequest":@"QueryAddressResponse",
                     @"DelAddressRequest":@"RestBaseAPIResponse"
                     };
    });
    return NSClassFromString([classDic objectForKey:key]);
}


/**
 *  获取地址
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryAddressByRequest:(QueryAddressRequest *)request completionBlockWithSuccess:(void(^)(QueryAddressResponse *))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((QueryAddressResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  删除地址
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)delAddressByRequest:(DelAddressRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess(response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end
