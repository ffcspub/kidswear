//
//  UserApiRequest.m
//  kidsweat
//
//  Created by ilikeido on 14-10-24.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "UserApiRequest.h"
#import "ServerContext.h"

@implementation UserApiLoginRequest


-(id)init{
    self = [super init];
    if (self) {
        self.token = nil;
    }
    return self;
}

-(NSString *)_apiPath{
    return API_LOGIN;
}

@end

@implementation UserApiLogoutRequest

-(NSString *)_apiPath{
    return API_LOGOUT;
}

@end

@implementation UserApiRegisterRequest

-(NSString *)_apiPath{
    return API_REGSITER;
}

@end

@implementation UserApiValidateMailRequest

-(NSString *)_apiPath{
    return API_VALIDATE_EMAIL;
}

@end


@implementation UserApiSendPwdToEmailRequest

-(NSString *)_apiPath{
    return API_SENDPWDTOEMAIL;
}

@end

@implementation UserApiOathRequest

-(NSString *)_apiPath{
    return API_OATH;
}

-(id)init{
    self = [super init];
    if (self) {
        self.token = nil;
    }
    return self;
}

@end

@implementation UserApiOathBindRequest

-(NSString *)_apiPath{
    return API_OATHBIND;
}

@end

@implementation UserApiGetUserInfoRequest

-(NSString *)_apiPath{
    return API_GET_USERINFO;
}

@end

@implementation UserApiUpdateUserInfoRequest

-(NSString *)_apiPath{
    return API_EDIT_USERINFO;
}

@end


