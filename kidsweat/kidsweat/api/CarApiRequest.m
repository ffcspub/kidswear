//
//  CarApiRequest.m
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CarApiRequest.h"

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


