//
//  OrderApiRequest.m
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "OrderApiRequest.h"
#import "ServerContext.h"

@implementation QueryOrderListRequest

-(NSString *)_apiPath{
    return API_GET_ORDER_LIST;
}

@end


@implementation OrderDelRequest

-(NSString *)_apiPath{
    return API_GET_ORDER_UPDATE;
}

@end

@implementation OrderAddressUpdateRequest

-(NSString *)_apiPath{
    return API_GET_ORDER_LIST;
}

@end