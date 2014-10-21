//
//  RestBaseAPI.h
//  belang
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseAPI.h"
#import "RestBaseAPIRequest.h"
#import "RestBaseAPIResponse.h"

/**
 *  Rest请求API
 *
 */
@interface RestBaseAPI :NSObject<BaseAPI>

/**
 *  根据请求对象返回相应的返回对象类型
 *
 *  @param request 请求对象
 *  @param responseDict 返回结果
 *
 */
+(Class)responseClassByRequest:(RestBaseAPIRequest *)request;


/**
 *  向服务器发起请求
 *
 *  @param request 请求对象
 *  @param sucess 成功返回的Block
 *  @param fail 失败返回的Block
 *
 */
+(void)request:(RestBaseAPIRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

+(void)cancelRequest:(RestBaseAPIRequest *)request;


@end
