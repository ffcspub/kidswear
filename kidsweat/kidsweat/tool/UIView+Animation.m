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
    self.center = self.superview.center;
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         
     }completion:^(BOOL finished){
         [UIView animateWithDuration:0.3 animations:^(void){
             self.center = self.superview.center;
             self.layer.transform = CATransform3DMakeScale(1.1, 1.1, 1.0f);
             
         }completion:^(BOOL finished){
             [UIView animateWithDuration:0.2 animations:^(void){
                 self.layer.transform = CATransform3DMakeScale(0.9f, 0.9f, 1.0f);
                 self.center = self.superview.center;
    
             }completion:^(BOOL finished) {
                 [UIView animateWithDuration:0.1 animations:^(void){
                     self.center = self.superview.center;
                     self.layer.transform = CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
                     
                 }completion:^(BOOL finished){
                     finish();
                 }];
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

// 落下动画
- (void)dropdownAnimation:(void(^)(void))finish{
    CGRect frame = self.frame;
    frame.origin.y = 0 - frame.size.height;
    self.frame = frame;
    
    [UIView animateWithDuration:0.5 animations:
     ^(void){
         self.center = CGPointMake(self.superview.center.x, self.superview.center.y + 30);
         
         [UIView animateWithDuration:0.3 animations:^(void){
             self.layer.transform = CATransform3DMakeScale(1.0, 1.2, 1.0f);
             
         }completion:^(BOOL finished){
             [UIView animateWithDuration:0.2 animations:^(void){
                 self.layer.transform = CATransform3DMakeScale(1.0, 0.9f, 1.0f);
                 self.center = self.superview.center;
                 
             }completion:^(BOOL finished) {
                 [UIView animateWithDuration:0.1 animations:^(void){
                     self.center = self.superview.center;
                     self.layer.transform = CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
                     
                 }completion:^(BOOL finished){
                     finish();
                 }];
             }];
         }];
     }completion:^(BOOL finished){
         
     }];
}

// 上升收回动画
- (void)pullupAnimation:(void(^)(void))finish{
    [UIView animateWithDuration:0.3 animations:^(void){
        CGRect frame = self.frame;
        frame.origin.y = 0 - frame.size.height;
        self.frame = frame;
        
        self.layer.transform = CATransform3DMakeScale(1.0f, 0.6f, 1.0f);
        
    }completion:^(BOOL finished){
        self.layer.transform = CATransform3DMakeScale(1.0f, 1.0f, 1.0f);
        finish();
    }];
}

@end
