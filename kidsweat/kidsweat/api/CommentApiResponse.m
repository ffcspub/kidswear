//
//  CommentApiResponse.m
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CommentApiResponse.h"
#import "Comment.h"

@implementation QueryCommentsResponse

+(Class)__DataClass{
    return [Comment class];
}

@end
