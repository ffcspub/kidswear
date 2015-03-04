//
//  Good.m
//  kidsweat
//
//  Created by ilikeido on 14-12-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "Good.h"

@implementation CarGood

@end


@implementation Good

@end


@implementation GoodPropertieValue

@end

@implementation GoodPropertie

+(Class)__valuesClass{
    return [GoodPropertieValue class];
}

@end

@implementation GoodDetail

+(Class)__propertiesClass{
    return [GoodPropertie class];
}

@end