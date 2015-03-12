//
//  ProductApi.h
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"
#import "GoodsApiRequest.h"
#import "GoodsApiResponse.h"
#import "Good.h"

@interface GoodsApi : RestBaseAPI


/**
 *  查询商品列表
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryGoodListByRequest:(QueryGoodsListRequest *)request completionBlockWithSuccess:(void(^)(QueryGoodsListResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;


/**
 *  查询商品详情
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getGoodDetailByRequest:(GetGoodDetailRequest *)request completionBlockWithSuccess:(void(^)(GoodDetail *response))sucess Fail:(void(^)(NSString *failDescript))fail;

@end
