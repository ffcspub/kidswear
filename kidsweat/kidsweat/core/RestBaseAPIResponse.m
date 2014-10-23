//
//  RestBaseAPIResponse.m
//  belang
//
//  Created by mac on 14-9-12.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "RestBaseAPIResponse.h"

@implementation RestBaseAPIResponse

-(int)__errorcode{
    return _Code;
}

-(NSString *)__message{
    return _Msg;
}

-(NSObject *)__result{
    return _Data;
}

@end
