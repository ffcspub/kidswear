//
//  ShareValue.h
//  belang
//
//  Created by mac on 14-9-14.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareValue : NSObject

+(ShareValue *)standardShareValue;

@property(nonatomic,strong) NSString *user_id;

@property(nonatomic,strong) NSString *username;

@property(nonatomic,strong) NSString *pwd;

@end
