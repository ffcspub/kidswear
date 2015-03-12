//
//  CommentApiResponse.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"

@interface QueryCommentsResponse : RestBaseAPIResponse

@property(nonatomic,strong) NSArray *Data;

@end
