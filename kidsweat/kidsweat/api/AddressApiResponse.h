//
//  AddressApiResponse.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPIResponse.h"

@interface QueryAddressResponse : RestBaseAPIResponse

@property(nonatomic,strong) NSArray *Data;

@end
