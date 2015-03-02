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
@interface CarGood : NSObject

@property(nonatomic,strong) NSString *rec_id;//记录id

@property(nonatomic,strong) NSString *goods_id;//商品id

@property(nonatomic,strong) NSString *goods_name;//商品名称

@property(nonatomic,strong) NSString *goods_attr;//商品属性

@property(nonatomic,assign) float *total_price;//总价格

@property(nonatomic,assign) int goods_number;//数量

@property(nonatomic,strong) NSString *goods_thumb;//商品缩略图

@property(nonatomic,strong) NSString *market_price;//市场价


@end

@interface Good : NSObject

@property(nonatomic,strong) NSString *goods_id;//商品id
@property(nonatomic,strong) NSString *goods_name;//商品名称
@property(nonatomic,strong) NSString *goods_brief;//商品简单描述
@property(nonatomic,strong) NSString *like_num;//喜欢数量
@property(nonatomic,strong) NSString *comment_num;//评论数量
@property(nonatomic,strong) NSString *market_price;//市场价格
@property(nonatomic,strong) NSString *shop_price;//价格
@property(nonatomic,strong) NSString *type;//
@property(nonatomic,strong) NSString *promote_price;//促销价格
@property(nonatomic,strong) NSString *goods_thumb;//商品缩略图
@property(nonatomic,strong) NSString *goods_img;//商品图

@end


@interface GoodDetail:Good

@property(nonatomic,strong) NSString *cat_id;//分类id
@property(nonatomic,strong) NSString *goods_sn;//商品编号
@property(nonatomic,strong) NSString *goods_name_stype;//??
@property(nonatomic,strong) NSString *click_count;//查看量
@property(nonatomic,strong) NSString *brand_id;//品牌id
@property(nonatomic,strong) NSString *provider_name;
@property(nonatomic,strong) NSString *goods_number;//商品数量
@property(nonatomic,strong) NSString *goods_weight;//商品重量
@property(nonatomic,strong) NSString *promote_start_date;//促销开始时间
@property(nonatomic,strong) NSString *promote_end_date;//促销结束时间

@end