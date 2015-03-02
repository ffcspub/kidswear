//
//  RestBaseAPIRequest.h
//  belang
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseAPI.h"

/**
 *  Rest请求基类
 *
 */
@interface RestBaseAPIRequest :NSObject<BaseAPIRequest>

/**
 * token
 */
@property(nonatomic,strong) NSString *token;

/**
 *  服务端地址
 *
 */
-(NSString *)_serverUrl;

/**
 *  相应API路径
 *
 */
-(NSString *)_apiPath;

/**
 *  请求方法
 *
 */
-(NSString *)_method;


@end
