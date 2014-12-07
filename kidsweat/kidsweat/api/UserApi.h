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

+(void)loginByRequest:(UserApiLoginRequest *)request completionBlockWithSuccess:(void(^)(UserApiLoginResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;


+(void)logoutByRequest:(UserApiOutRequest *)request completionBlockWithSuccess:(void(^)(UserApiLoginResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail;



@end
