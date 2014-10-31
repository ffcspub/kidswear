//
//  UIView+Animation.h
//  kidsweat
//
//  Created by chenzf on 14-10-31.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(animation)

// 弹出动画
- (void)popupAnimation:(void(^)(void))finish;

// 逐渐变小消失动画
- (void)dribbleAwayAnimation:(void(^)(void))finish;

@end
