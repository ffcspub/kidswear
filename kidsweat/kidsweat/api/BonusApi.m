//
//  BonusApi.m
//  kidsweat
//
//  Created by ilikeido on 15-3-11.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "BonusApi.h"

@implementation BonusApi


+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"GetMyBonusRequest":@"GetMyBonusApiResponse",
                     @"ActiveBonusRequest":@"RestBaseAPIResponse"
                     };
    });
    return NSClassFromString([classDic objectForKey:key]);
}

/**
 *  获取我的优惠券
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getMyBonusByRequest:(GetMyBonusRequest *)request completionBlockWithSuccess:(void(^)(GetMyBonusApiResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((GetMyBonusApiResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}


/**
 *  激活优惠券
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)activeBonusByRequest:(ActiveBonusRequest *)request completionBlockWithSuccess:(void(^)(void))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess();
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end
