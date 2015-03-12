//
//  BoundApiResponse.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"

/**
 * 获取优惠券结果
 */
@interface GetMyBonusApiResponse : RestBaseAPIResponse

@property(nonatomic,strong)NSArray *Data;

@end
