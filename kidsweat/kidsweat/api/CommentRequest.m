//
//  CommentRequest.m
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CommentRequest.h"
#import "ServerContext.h"

@implementation QueryCommentsRequest

-(NSString *)_apiPath{
    return API_QUERY_COMMENTS                                                                                                                                             ;
}

@end

@implementation AddCommentRequest

-(NSString *)_apiPath{
    return API_ADD_COMMENT                                                                                                                                             ;
}

@end