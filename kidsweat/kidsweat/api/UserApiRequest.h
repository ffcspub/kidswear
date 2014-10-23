//
//  UserApiRequest.h
//  kidsweat
//
//  Created by ilikeido on 14-10-24.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPIRequest.h"


/**
 * 登录操作
 */
@interface UserApiLoginRequest : RestBaseAPIRequest

/**
 * 用户名
 */
@property(nonatomic,strong) NSString *username;

/**
 * 密码
 */
@property(nonatomic,strong) NSString *password;

/**
 * token
 */
@property(nonatomic,strong) NSString *token;

@end
