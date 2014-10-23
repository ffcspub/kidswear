//
//  UserApiResponse.h
//  kidsweat
//
//  Created by ilikeido on 14-10-24.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RestBaseAPIResponse.h"
#import "UserInfo.h"


/**
 * 登录操作
 */
@interface UserApiLoginResponse : RestBaseAPIResponse

@property(nonatomic,strong) UserInfo *Data;

@end