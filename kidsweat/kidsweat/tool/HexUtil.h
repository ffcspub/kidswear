//
//  NSString+StringToHexData.h
//  belang
//
//  Created by ilikeido on 14-9-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringToHexData)

- (NSData *) stringToHexData;

+(int)hexString2Int:(NSString *)hexString;

@end

@interface NSData (DataToHexString)

- (NSString *) dataToHexString;

@end