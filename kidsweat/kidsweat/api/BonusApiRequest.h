//
//  BonusApiRequest.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"

/**
 *  获取我的优惠券
 */
@interface GetMyBonusRequest : RestBaseAPIRequest

@property(nonatomic,assign) int pagesize;

@property(nonatomic,assign) int page;

@end

/**
 *  激活优惠券
 */
@interface ActiveBonusRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *bonus_sn;

@end
