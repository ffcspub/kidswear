//
//  BaseAPI.h
//  belang
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求协义
 *
 *
 */
@protocol BaseAPIRequest <NSObject>

@end

/**
 *  请求返回请求
 *
 */
@protocol BaseAPIResponse <NSObject>

-(int)__errorcode;
-(NSString *)__message;
-(NSObject *)__result;

@end

/**
 *  API基类
 *
 */
@protocol BaseAPI <NSObject>

+(void)__request:(id<BaseAPIRequest>)request completionBlockWithSuccess:(void(^)(id<BaseAPIResponse> response))sucess Fail:(void(^)(NSString *failDescript))fail;

@end

