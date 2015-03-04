//
//  ProductApiResponse.m
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "ProductApiResponse.h"
#import "Good.h"

@implementation QueryGoodsListResponse

+(Class)__goods_listClass{
    return [Good class];
}

@end