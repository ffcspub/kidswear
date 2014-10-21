//
//  NSString+StringToHexData.m
//  belang
//
//  Created by ilikeido on 14-9-16.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "HexUtil.h"

@implementation NSString (StringToHexData)

- (NSData *) stringToHexData
{
    int len = (int)[self length] / 2;    // Target length
    unsigned char *buf = malloc(len);
    unsigned char *whole_byte = buf;
    char byte_chars[3] = {'\0','\0','\0'};
    
    int i;
    for (i=0; i < [self length] / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i*2];
        byte_chars[1] = [self characterAtIndex:i*2+1];
        *whole_byte = strtol(byte_chars, NULL, 16);
        whole_byte++;
    }
    
    NSData *data = [NSData dataWithBytes:buf length:len];
    free( buf );
    return data;
}

+(int)hexString2Int:(NSString *)hexString{
    int hexInt = 0;
    NSData *hexData = [hexString stringToHexData];
    [hexData getBytes: &hexInt length: sizeof(hexInt)];
    return hexInt;
}

@end


@implementation NSData (DataToHexString)

- (NSString *) dataToHexString
{
    NSUInteger          len = [self length];
    char *              chars = (char *)[self bytes];
    NSMutableString *   hexString = [[NSMutableString alloc] init];
    
    for(NSUInteger i = 0; i < len; i++ )
        [hexString appendString:[NSString stringWithFormat:@"%0.2hhx", chars[i]]];
    
    return hexString;
}

@end
