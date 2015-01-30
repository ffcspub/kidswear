//
//  MyInfoVCL.h
//  kidsweat
//
//  Created by chenzf on 15-1-5.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageFileInfo : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *fileName;
@property(nonatomic,strong) NSString *mimeType;
@property(nonatomic,assign) long long filesize;
@property(nonatomic,strong) NSData *fileData;

-(id)initWithImage:(UIImage *)image;

@end


@interface MyInfoVCL : CommonViewController

@end
