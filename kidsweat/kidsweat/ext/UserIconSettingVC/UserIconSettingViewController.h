//
//  UserIconSettingViewController.h
//  flowerong
//
//  Created by chenzf on 14-6-27.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UserIconSettingDelegate;

@interface UserIconSettingViewController : UIViewController

@property(nonatomic,weak)UIImage *selectedImg;
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, assign) id<UserIconSettingDelegate> delegate;
@property (nonatomic, assign) CGRect cropFrame;

- (id)initWithImage:(UIImage *)originalImage cropFrame:(CGRect)cropFrame limitScaleRatio:(NSInteger)limitRatio;

@end


@protocol UserIconSettingDelegate <NSObject>

- (void)imageCropper:(UserIconSettingViewController *)userIconSettingViewController didFinished:(UIImage *)editedImage;
- (void)imageCropperDidCancel:(UserIconSettingViewController *)userIconSettingViewController;

@end


