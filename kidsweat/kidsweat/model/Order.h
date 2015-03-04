//
//  Order.h
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  订单商品
 */
@interface OrderGood : NSObject

@property(nonatomic,strong) NSString *rec_id;//记录id

@property(nonatomic,strong) NSString *goods_id;//商品id

@property(nonatomic,strong) NSString *goods_name;//商品名称

@property(nonatomic,strong) NSString *goods_sn;//商品编号

@property(nonatomic,strong) NSString *goods_attr;//商品属性

@property(nonatomic,strong) NSString *subtotal;//总价格

@property(nonatomic,strong) NSString *goods_number;//数量

@property(nonatomic,strong) NSString *goods_thumb;//商品缩略图

@property(nonatomic,strong) NSString *market_price;//市场价


@end


/**
 *  订单
 */
@interface Order : NSObject

@property(nonatomic,strong) NSString *order_id;//  订单ID ,
@property(nonatomic,strong) NSString *order_sn;//订单号,
@property(nonatomic,strong) NSString *total_fee;//总金额，
@property(nonatomic,strong) NSString *add_time;//添加时间，
@property(nonatomic,strong) NSString *pay_status;//支付状态，
@property(nonatomic,strong) NSString *shipping_status;//配送状态
@property(nonatomic,strong) NSString *order_status;//订单状态，
@property(nonatomic,strong) NSArray *order_goodslist;//

@end
