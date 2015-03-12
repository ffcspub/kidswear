//
//  AddressApi.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"
#import "AddressApiRequest.h"
#import "AddressApiResponse.h"

@interface AddressApi : RestBaseAPI

/**
 *  获取地址
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryAddressByRequest:(QueryAddressRequest *)request completionBlockWithSuccess:(void(^)(QueryAddressResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  删除地址
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)delAddressByRequest:(DelAddressRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;


@end
