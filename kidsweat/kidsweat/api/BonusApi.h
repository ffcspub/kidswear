//
//  BonusApi.h
//  kidsweat
//
//  Created by ilikeido on 15-3-11.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"
#import "BonusApiRequest.h"
#import "BonusApiResponse.h"

@interface BonusApi : RestBaseAPI

/**
 *  获取我的优惠券
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getMyBonusByRequest:(GetMyBonusRequest *)request completionBlockWithSuccess:(void(^)(GetMyBonusApiResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  激活优惠券
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)activeBonusByRequest:(ActiveBonusRequest *)request completionBlockWithSuccess:(void(^)(void))sucess Fail:(void(^)(NSString *failDescript))fail;

@end
