//
//  UserApi.m
//  kidsweat
//
//  Created by ilikeido on 14-10-24.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "UserApi.h"

@implementation UserApi

+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"UserApiLoginRequest":@"UserApiLoginResponse",
                     @"UserApiLogoutRequest":@"UserApiLogoutResponse",
                     @"UserApiRegisterRequest":@"UserApiRegisterResponse",
                     @"UserApiValidateMailRequest":@"UserApiValidateMailResponse",
                     @"UserApiSendPwdToEmailRequest":@"UserApiSendPwdToEmailResponse",
                     @"UserApiOathRequest":@"UserApiOathResponse",
                     @"UserApiOathBindRequest":@"UserApiOathBindResponse",
                     @"UserApiGetUserInfoRequest":@"UserApiGetUserInfoResponse",
                     @"UserApiUpdateUserInfoRequest":@"UserApiUpdateUserInfoResponse"
                     };
    });
    
    return NSClassFromString([classDic objectForKey:key]);
    
}


+(void)loginByRequest:(UserApiLoginRequest *)request completionBlockWithSuccess:(void(^)(UserApiLoginResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiLoginResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  登出
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)logoutByRequest:(UserApiLogoutRequest *)request completionBlockWithSuccess:(void(^)(UserApiLogoutResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiLogoutResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  注册
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)registerByRequest:(UserApiRegisterRequest *)request completionBlockWithSuccess:(void(^)(UserApiRegisterResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiRegisterResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}


/**
 *  验证邮箱是否可以注册
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)validateMailByRequest:(UserApiValidateMailRequest *)request completionBlockWithSuccess:(void(^)(UserApiValidateMailResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiValidateMailResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}


/**
 *  向邮箱发送密码请求
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)sendPwdToEmailByRequest:(UserApiSendPwdToEmailRequest *)request completionBlockWithSuccess:(void(^)(UserApiSendPwdToEmailResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiSendPwdToEmailResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  第三方登录
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)oathByRequest:(UserApiOathRequest *)request completionBlockWithSuccess:(void(^)(UserApiOathResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiOathResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  第三方绑定用户
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)oathBindByRequest:(UserApiOathBindRequest *)request completionBlockWithSuccess:(void(^)(UserApiOathBindResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiOathBindResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  获取用户信息
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)getUserInfoByRequest:(UserApiGetUserInfoRequest *)request completionBlockWithSuccess:(void(^)(UserApiGetUserInfoResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiGetUserInfoResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

/**
 *  更新用户信息
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)updateUserInfoByRequest:(UserApiUpdateUserInfoRequest *)request completionBlockWithSuccess:(void(^)(UserApiUpdateUserInfoResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    [UserApi request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((UserApiUpdateUserInfoResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end
