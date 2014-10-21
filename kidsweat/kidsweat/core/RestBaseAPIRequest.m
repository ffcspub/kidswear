//
//  RestBaseAPIRequest.m
//  belang
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "RestBaseAPIRequest.h"
#import "ServerContext.h"

@implementation RestBaseAPIRequest

-(NSString *)_serverUrl{
    return URL_SERVER_BASE;
}

-(NSString *)_apiPath{
    return @"";
}

-(NSString *)_method{
    return METHOD_POST;
}

@end
