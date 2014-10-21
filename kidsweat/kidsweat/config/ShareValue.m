//
//  ShareValue.m
//  belang
//
//  Created by mac on 14-9-14.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "ShareValue.h"
#import <LKDBHelper.h>

#define KEY_USERID @"KEY_USERID"
#define KEY_USERNAME @"KEY_USERNAME"
#define KEY_PWD @"KEY_PWD"

@implementation ShareValue

+(ShareValue *)standardShareValue{
    static ShareValue *_signleInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _signleInstance = [[ShareValue alloc]init];
    });
    return _signleInstance;
}


-(void)setUser_id:(NSString *)user_id{
    [[NSUserDefaults standardUserDefaults]setObject:user_id forKey:KEY_USERID];
}

-(NSString *)user_id{
    return [[NSUserDefaults standardUserDefaults]objectForKey:KEY_USERID];
}


-(void)setUsername:(NSString *)username{
    [[NSUserDefaults standardUserDefaults]setObject:username forKey:KEY_USERNAME];
}

-(NSString *)username{
    return [[NSUserDefaults standardUserDefaults]objectForKey:KEY_USERNAME];
}

-(void)setPwd:(NSString *)pwd{
    [[NSUserDefaults standardUserDefaults]setObject:pwd forKey:KEY_PWD];
}

-(NSString *)pwd{
    return [[NSUserDefaults standardUserDefaults]objectForKey:KEY_PWD];
}


@end
