//
//  Comment.h
//  kidsweat
//
//  Created by ilikeido on 15-3-12.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Comment : NSObject

@property(nonatomic,strong) NSString *comment_id;//评论ID
@property(nonatomic,strong) NSString *email; //用户邮箱
@property(nonatomic,strong) NSString *user_name;//用户名
@property(nonatomic,strong) NSString *content;//评论内容（回复内容）
@property(nonatomic,strong) NSString *add_time;//发表时间
@property(nonatomic,strong) NSString *ip_address;//发表IP

@property(nonatomic,strong) NSString *parent_id;// 对应回复的评论ID  （非0表示管理员回复 ）
@property(nonatomic,strong) NSString *user_id;//用户ID
@property(nonatomic,strong) NSString *reply_content;//回复内容
@property(nonatomic,strong) NSString *reply_time;//回复时间

@end
