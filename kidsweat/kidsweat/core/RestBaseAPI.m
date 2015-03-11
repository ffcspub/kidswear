//
//  RestBaseAPI.m
//  belang
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "RestBaseAPI.h"
#import "RestBaseAPIRequest.h"
#import "RestBaseAPIResponse.h"
#import <AFNetworking.h>
#import <TouchJSON/CJSONDeserializer.h>
#import "ServerContext.h"
#import "LK_NSDictionary2Object.h"
#import "NSString+External.h"

#define TIMEOUT_DEFAULT 30

#define TESTMODE 0

#define SUCCESS_CODE 1

@interface RestBaseAPI (p)
+(AFHTTPClient *)client;
@end

@implementation RestBaseAPI

+(AFHTTPClient *)client{
    static dispatch_once_t onceToken;
    static AFHTTPClient *_client;
    dispatch_once(&onceToken, ^{
        _client = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:URL_SERVER_BASE]];
    });
    return _client;
}


+(void)cancelRequest:(RestBaseAPIRequest *)request{
    AFHTTPClient *client = [RestBaseAPI client];
    [client cancelAllHTTPOperationsWithMethod:request._method path:request._apiPath];
}

+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *className = NSStringFromClass(request.class);
    NSDictionary *dict = [self requestAndResponseMap];
    NSString *responseClassName = [dict objectForKey:className];
    if (responseClassName) {
        return NSClassFromString(responseClassName);
    }
    return [RestBaseAPIResponse class];
}

+(NSDictionary *)requestAndResponseMap{
    return @{};
}

+(NSString *)getFailDescriptByErrorCode:(int)errorCode{
    NSString *failDescription = @"";
    switch (errorCode) {
        case 100:
            failDescription = @"密码错误";
            break;
        case 101:
            failDescription = @"用户已存在";
            break;
        default:
            break;
    }
    return failDescription;
}


+(AFHTTPClient *)clientByRequest:(RestBaseAPIRequest *)request{
    if ([request._serverUrl isEqual:URL_SERVER_BASE]) {
        return [RestBaseAPI client];
    }
    return [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:request._serverUrl]];
}

+(BOOL)isTestMode{
    return NO;
}

+(BOOL)isCookiesVaildata{
    BOOL flag = NO;
    NSHTTPCookieStorage *cooieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [cooieJar cookies]) {
        if ([cookie.name isEqual:@"ndcloudcookie"]) {
            flag = YES;
            break;
        }
    }
    return flag;
}

+(id)objectByClass:(Class)clazz filePath:(NSString *)path{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:path ofType:@"txt" ];
    if(!filePath){
        return nil;
    }
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];
    id response = [dict objectByClass:clazz];
    return response;
}

+(void)request:(RestBaseAPIRequest *)request completionBlockWithSuccess:(void(^)(RestBaseAPIResponse *response))sucess Fail:(void(^)(NSString *failDescript))fail{
    if([self isTestMode]){
        Class clazz = [self responseClassByRequest:request];
        NSString *resultFilePath = NSStringFromClass(clazz);
        id result = [self objectByClass:clazz filePath:resultFilePath];
        if(result){
            sucess(result);
            return;
        }
    }
    AFHTTPClient *client = [RestBaseAPI clientByRequest:request];
//    client.parameterEncoding = AFFormURLParameterEncoding;
    [AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"text/html"]];
    client.allowsInvalidSSLCertificate = YES;
    NSDictionary *dict = request.lkDictionary;
    NSURLRequest *urlRequest = [client requestWithMethod:request._method path:request._apiPath  parameters:dict];
    AFHTTPRequestOperation *operation =
    [client HTTPRequestOperationWithRequest:urlRequest success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if(responseObject){
            NSData *responseData = (NSData *)responseObject;
            NSString *responseString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
            NSLog(@"url:%@|response:%@",urlRequest.URL,responseString);
            NSError *error = nil;
            NSDictionary *dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:responseData error:&error];
            RestBaseAPIResponse *response =  nil;
            if (dict) {
                Class clazz = [self responseClassByRequest:request];
                if ([clazz isSubclassOfClass:[RestBaseAPIResponse class]]) {
                    response = [dict objectByClass:[self responseClassByRequest:request]];
                }else{
                    response = [dict objectByClass:[RestBaseAPIRequest class]];
                    NSDictionary *dict = (NSDictionary *)response.Data;
                    NSObject *obj = [dict objectByClass:clazz];
                    response.Data = obj;
                }
                if (response.Code != SUCCESS_CODE) {
                    NSString *errorMessage = [self getFailDescriptByErrorCode:response.__errorcode];
                    if (errorMessage.length == 0) {
                        errorMessage = response.__message;
                    }
                    dispatch_async(dispatch_get_main_queue(), ^{
                        fail(errorMessage);
                    });
                    [[NSNotificationCenter defaultCenter]postNotificationName:NOTIFCATION_ERROR object:nil userInfo:@{ERROR_CODE:[NSString stringWithFormat:@"%d",response.__errorcode],ERROR_DESCRIPTION:errorMessage}];
                    return;
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    sucess(response);
                });
            }else{
                dispatch_async(dispatch_get_main_queue(), ^{
                    fail(@"服务器异常");
                });
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"url:%@,fail:%@",urlRequest.URL,[error localizedDescription]);
        dispatch_async(dispatch_get_main_queue(), ^{
            fail(@"网络不给力");
        });
    }];
    [client enqueueHTTPRequestOperation:operation];
}

+(void)__request:(id<BaseAPIRequest>)request completionBlockWithSuccess:(void(^)(id<BaseAPIResponse> response))sucess Fail:(void(^)(NSString *failDescript))fail{
    if ([request isKindOfClass:[RestBaseAPIRequest class]]) {
        RestBaseAPIRequest *restBaseAPIRequest = (RestBaseAPIRequest *)request;
        [self request:restBaseAPIRequest completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
            sucess(response);
        } Fail:^(NSString *failDescript) {
            fail(failDescript);
        }];
    }else{
        assert(@"is not a RestBaseApiRequest");
    }
}

@end
