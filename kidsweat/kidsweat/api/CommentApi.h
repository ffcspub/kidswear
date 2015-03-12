//
//  CommentApi.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"
#import "CommentRequest.h"
#import "CommentApiResponse.h"

@interface CommentApi : RestBaseAPI

/**
 *  获取商品评价
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)queryCommentsByRequest:(QueryCommentsRequest *)request completionBlockWithSuccess:(void(^)(QueryCommentsResponse *))sucess Fail:(void(^)(NSString *failDescript))fail;

/**
 *  添加商品评价
 *
 *  @param request 请求
 *  @param sucess  成功block
 *  @param fail    失败block
 */
+(void)addCommentByRequest:(AddCommentRequest *)request completionBlockWithSuccess:(void(^)(void))sucess Fail:(void(^)(NSString *failDescript))fail;

@end
