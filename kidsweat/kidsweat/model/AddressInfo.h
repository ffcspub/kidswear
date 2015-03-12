//
//  AddressInfo.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  收货地址
 */
@interface AddressInfo : NSObject

@property(nonatomic,strong) NSString *address_id;//ID

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
