//
//  RestBaseAPIResponse.h
//  belang
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "BaseAPI.h"

/**
 *  Rest请求返回基类
 *
 */
@interface RestBaseAPIResponse :NSObject <BaseAPIResponse>

/**
 *  错误码
 *
 */
@property(nonatomic,assign) int Code;

/**
 *  返回提示
 *
 */
@property(nonatomic,strong) NSString *Msg;

/**
 *  返回结果
 *
 */
@property(nonatomic,strong) NSObject *Data;

@end
