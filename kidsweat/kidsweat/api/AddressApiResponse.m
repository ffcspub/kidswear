//
//  AddressApiResponse.m
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "AddressApiResponse.h"
#import "AddressInfo.h"

@implementation QueryAddressResponse

+(Class)__DataClass{
    return [AddressInfo class];
}

@end
