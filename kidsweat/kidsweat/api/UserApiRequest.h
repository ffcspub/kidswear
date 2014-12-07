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


/**
 * 登录操作
 */
@interface UserApiLogoutRequest : RestBaseAPIRequest

/**
 * 用户名
 */
@property(nonatomic,strong) NSString *user_id;

/**
 * token
 */
@property(nonatomic,strong) NSString *token;

@end

/**
 * 注册操作
 */
@interface UserApiRegiterRequest : RestBaseAPIRequest

/**
 * 邮箱
 */
@property(nonatomic,strong) NSString *username;

/**
 * 密码
 */
@property(nonatomic,strong) NSString *password;


@end

/**
 * 验证邮箱是否可以注册
 */
@interface UserApiValidateMailRegiterRequest : RestBaseAPIRequest

/**
 * 邮箱
 */
@property(nonatomic,strong) NSString *username;

/**
 * token
 */
@property(nonatomic,strong) NSString *token;

@end


/**
 * 忘记密码
 */
@interface UserApiSendPwdToEmailRequest : RestBaseAPIRequest
/**
 * 邮箱
 */
@property(nonatomic,strong) NSString *email;

@end

/**
 * 第三方登录
 */
@interface UserApiOathRequest : RestBaseAPIRequest

/**
 * 第三方平台id
 */
@property(nonatomic,strong) NSString *openid;

/**
 * 平台类型
 */
@property(nonatomic,strong) NSString *type;

@end

/**
 * 第三方数据绑定
 */
@interface UserApiOathBindRequest : RestBaseAPIRequest

/**
 * 第三方平台id
 */
@property(nonatomic,strong) NSString *openid;

/**
 * 平台类型
 */
@property(nonatomic,strong) NSString *type;

/**
 * 电子邮箱
 */
@property(nonatomic,strong) NSString *email;

/**
 * 昵称
 */
@property(nonatomic,strong) NSString *nickname;

/**
 * 头像
 */
@property(nonatomic,strong) NSString *avatar;

@end

/**
 * 获取用户信息
 */
@interface UserApiGetUserInfoRequest : RestBaseAPIRequest

/**
 * 用户id
 */
@property(nonatomic,strong) NSString *user_id;

/**
 * token
 */
@property(nonatomic,strong) NSString *token;

@end



/**
 * 更新用户信息
 */
@interface UserApiUpdateUserInfoRequest : RestBaseAPIRequest

/**
 * 用户id
 */
@property(nonatomic,strong) NSString *user_id;

/**
 * token
 */
@property(nonatomic,strong) NSString *token;

@end
