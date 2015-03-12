//
//  CommentApi.m
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CommentApi.h"

@implementation CommentApi


+(Class)responseClassByRequest:(RestBaseAPIRequest *)request{
    NSString *key = NSStringFromClass([request class]);
    static dispatch_once_t onceToken;
    static NSDictionary *classDic;
    dispatch_once(&onceToken, ^{
        classDic = @{@"QueryCommentsRequest":@"QueryCommentsResponse",
                     @"ActiveBonusRequest":@"RestBaseAPIResponse"
                     };
    });
    return NSClassFromString([classDic objectForKey:key]);
}


/**
 *  获取商品评价
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryCommentsByRequest:(QueryCommentsRequest *)request completionBlockWithSuccess:(void(^)(QueryCommentsResponse *))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess((QueryCommentsResponse *)response);
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}


/**
 *  添加商品评价
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)addCommentByRequest:(AddCommentRequest *)request completionBlockWithSuccess:(void(^)(void))sucess Fail:(void(^)(NSString *failDescript))fail{
    [self request:request completionBlockWithSuccess:^(RestBaseAPIResponse *response) {
        sucess();
    } Fail:^(NSString *failDescript) {
        fail(failDescript);
    }];
}

@end
