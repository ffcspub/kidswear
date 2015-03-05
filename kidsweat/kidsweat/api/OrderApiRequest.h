//
//  OrderApiRequest.h
//  kidsweat
//
//  Created by ilikeido on 15-3-2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestBaseAPI.h"

@interface QueryOrderListRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *Pagesize;//每页多少条
@property(nonatomic,strong) NSString *Page;//当前条几页
@property(nonatomic,strong) NSString *Is_goods;//是否获取对应订单，商品列表  0、 不获取 （默认）1、表示获取

@end

@interface OrderDelRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *order_id;//每页多少条

@property(nonatomic,strong) NSString *order_sn;//订单编号

@property(nonatomic,strong) NSString *Is_goods;//是否获取对应订单商品列表   0、 不获取(默认)  1、表示获取

@end

@interface OrderCreateRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *rec_id;//购物车id

@property(nonatomic,strong) NSString *address_id;//收件人地址id

@end

/**
 *  12、	更新订单收货人信息
 */
@interface OrderAddressUpdateRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *address_id;//ID ｛更新是必须要有｝
@property(nonatomic,strong) NSString *consignee;//收件人姓名
@property(nonatomic,strong) NSString *email;//邮箱
@property(nonatomic,strong) NSString *country;//国家ID
@property(nonatomic,strong) NSString *province;//省份ID
@property(nonatomic,strong) NSString *city;//城市ID
@property(nonatomic,strong) NSString *district;//区域ID
@property(nonatomic,strong) NSString *address;//详细地址
@property(nonatomic,strong) NSString *tel;//电话
@property(nonatomic,strong) NSString *mobile;//手机
@property(nonatomic,strong) NSString *sign_building;//标志性建筑
@property(nonatomic,strong) NSString *best_time;//最佳送货时间
@property(nonatomic,strong) NSString *zipcode;//邮编

@end

/**
 *  13、	订单确定收货，取消订单
 */
@interface OrderSureOrCancelRequest : RestBaseAPIRequest

@property(nonatomic,strong) NSString *order_id;//详单id
@property(nonatomic,strong) NSString *type;// 0:确定收货  1:取消订单

@end


