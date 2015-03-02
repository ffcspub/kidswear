//
//  ProductApiRequest.m
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "ProductApiRequest.h"
#import "ServerContext.h"

@implementation GetCarGoodsApiRequest

-(NSString *)_apiPath{
    return API_GET_CARTLIST;
}

@end

@implementation DropCarGoodsApiRequest

-(NSString *)_apiPath{
    return API_DROP_CARTGOODS;
}

@end


@implementation UpdateCarApiRequest

-(NSString *)_apiPath{
    return API_UPDATE_CART                                                                                                                                             ;
}

@end

@implementation QueryGoodsListRequest

-(NSString *)_apiPath{
    return API_GET_GOOD_LIST                                                                                                                                             ;
}

@end








































































