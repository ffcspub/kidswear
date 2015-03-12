//
//  AddressApiRequest.m
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "AddressApiRequest.h"
#import "ServerContext.h"

@implementation QueryAddressRequest

-(NSString *)_apiPath{
    return API_QUERY_ADDRESS                                                                                                                                             ;
}

@end

@implementation DelAddressRequest


-(NSString *)_apiPath{
    return API_DEL_ADDRESS                                                                                                                                             ;
}

@end
