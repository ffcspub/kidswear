//
//  Good.h
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  商品
 */
@interface Good : NSObject

@property(nonatomic,strong) NSString *rec_id;

@property(nonatomic,strong) NSString *goods_id;

@property(nonatomic,strong) NSString *goods_name;

@property(nonatomic,strong) NSString *goods_attr;

@property(nonatomic,assign) float *total_price;

@property(nonatomic,assign) int goods_number;

@property(nonatomic,strong) NSString *goods_thumb;

@property(nonatomic,strong) NSString *market_price;


@end
