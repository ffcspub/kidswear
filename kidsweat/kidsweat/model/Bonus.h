//
//  Bonus.h
//  kidsweat
//
//  Created by ilikeido on 15-3-5.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  优惠券
 */
@interface Bonus : NSObject

@property(nonatomic,strong) NSString * bonus_id;//ID
@property(nonatomic,strong) NSString * bonus_type_id;//优惠券类型
@property(nonatomic,strong) NSString * bonus_sn;//优惠券编码
@property(nonatomic,strong) NSString * user_id;//用户id
@property(nonatomic,strong) NSString * used_time;//使用时间
@property(nonatomic,strong) NSString * order_id;//订单id
@property(nonatomic,strong) NSString * emailed;//是否已邮件通知
@property(nonatomic,strong) NSString * user_name;//用户名
@property(nonatomic,strong) NSString * email;//邮箱地址
@property(nonatomic,strong) NSString * order_sn;//订单编码
@property(nonatomic,strong) NSString * type_name;//类型名称

@end
