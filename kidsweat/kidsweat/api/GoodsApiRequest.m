//
//  ProductApiRequest.m
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "GoodsApiRequest.h"
#import "ServerContext.h"

@implementation QueryGoodsListRequest

-(NSString *)_apiPath{
    return API_GET_GOOD_LIST;
}

@end


@implementation GetGoodDetailRequest

-(NSString *)_apiPath{
    return API_GET_GOOD_DETAIL;
}

@end




































































