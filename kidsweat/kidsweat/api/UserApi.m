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
        classDic = @{@"UserApiLoginRequest":@"UserApiLoginResponse"};
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

@end
