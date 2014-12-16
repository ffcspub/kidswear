//
//  UserApi.h
//  kidsweat
//
//  Created by ilikeido on 14-10-24.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"
#import "UserApiRequest.h"
#import "UserApiResponse.h"

@interface UserApi :RestBaseAPI

/**
 *  登录
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)loginByRequest:(UserApiLoginRequest *)request completionBlockWithSuccess:(void(^)(UserApiLoginResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  登出
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)logoutByRequest:(UserApiLogoutRequest *)request completionBlockWithSuccess:(void(^)(UserApiLogoutResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  注册
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)registerByRequest:(UserApiRegisterRequest *)request completionBlockWithSuccess:(void(^)(UserApiRegisterResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  验证邮箱是否可以注册
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)validateMailByRequest:(UserApiValidateMailRequest *)request completionBlockWithSuccess:(void(^)(UserApiValidateMailResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  向邮箱发送密码请求
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)sendPwdToEmailByRequest:(UserApiSendPwdToEmailRequest *)request completionBlockWithSuccess:(void(^)(UserApiSendPwdToEmailResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;


/**
 *  第三方登录
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)oathByRequest:(UserApiOathRequest *)request completionBlockWithSuccess:(void(^)(UserApiOathResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  第三方绑定用户
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)oathBindByRequest:(UserApiOathBindRequest *)request completionBlockWithSuccess:(void(^)(UserApiOathBindResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  获取用户信息
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getUserInfoByRequest:(UserApiGetUserInfoRequest *)request completionBlockWithSuccess:(void(^)(UserApiGetUserInfoResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;


/**
 *  更新用户信息
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)updateUserInfoByRequest:(UserApiUpdateUserInfoRequest *)request completionBlockWithSuccess:(void(^)(UserApiUpdateUserInfoResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;

@end
