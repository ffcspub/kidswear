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

/**
 * 登出操作
 */
@interface UserApiLogoutResponse : RestBaseAPIResponse

@property(nonatomic,strong) UserInfo *Data;

@end


/**
 * 注册操作
 */
@interface UserApiRegisterResponse : RestBaseAPIResponse

@property(nonatomic,strong) UserInfo *Data;

@end

/**
 * 第三方登录
 */
@interface UserApiOathResponse : RestBaseAPIResponse

@property(nonatomic,strong) UserInfo *Data;

@end

/**
 * 第三方注册
 */
@interface UserApiOathBindResponse : RestBaseAPIResponse

@property(nonatomic,strong) UserInfo *Data;

@end

/**
 * 获取用户信息
 */
@interface UserApiGetUserInfoResponse : RestBaseAPIResponse

@property(nonatomic,strong) UserInfo *Data;

@end

/**
 * 更新用户信息
 */
@interface UserApiUpdateUserInfoResponse : RestBaseAPIResponse

@property(nonatomic,strong) UserInfo *Data;

@end
