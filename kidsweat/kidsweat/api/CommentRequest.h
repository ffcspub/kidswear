//
//  CommentRequest.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"

/**
 *  查询商品评价列表
 */
@interface QueryCommentsRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *goods_id;

@property(nonatomic,assign) int pagesize;

@property(nonatomic,assign) int page;

@end


/**
 *  评价商品列表
 */
@interface AddCommentRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *goods_id;

@property(nonatomic,strong) NSString *contents;//评论内容

@end
