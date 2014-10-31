//
//  UIView+Animation.m
//  kidsweat
//
//  Created by chenzf on 14-10-31.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView(animation)

// 弹出动画
- (void)popupAnimation:(void(^)(void))finish{
    [UIView animateWithDuration:0.2 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.1f, 1.1f);
     }completion:^(BOOL finished){
         [UIView animateWithDuration:0.1 animations:^(void){
             self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.9, 0.9);
         }completion:^(BOOL finished){
             [UIView animateWithDuration:0.1 animations:^(void){
                 self.transform = CGAffineTransformScale(CGAffineTransformIdentity,1, 1);
                 finish();
             }];
         }];
     }];
}

// 逐渐变小消失动画
- (void)dribbleAwayAnimation:(void(^)(void))finish{
    [UIView animateWithDuration:0.2 animations:
     ^(void){
         self.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.1f, 0.1f);
         self.alpha = 0;
     }completion:^(BOOL finished){
         finish();
     }];
}



@end
