//
//  AlertListManagement.h
//  flowerong
//
//  Created by nd on 14-10-20.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertMultipleListManagementBackgroundStyle) {
    AlertMultipleListManagementBackgroundStyleGradient = 0, //渐变
    AlertMultipleListManagementBackgroundStyleSolid, // 固定
};

typedef NS_ENUM(NSInteger, AlertMultipleListManagementTransitionStyle) {
    AlertMultipleListManagementTransitionStyleSlideFromBottom = 0,
    AlertMultipleListManagementTransitionStyleSlideFromTop,
    AlertMultipleListManagementTransitionStyleFade,
    AlertMultipleListManagementTransitionStyleBounce,
    AlertMultipleListManagementTransitionStyleDropDown
};

@class AlertMultipleListManagement;

@protocol AlertMultipleListManagementDelegate <NSObject>

@optional

-(void)alertMultipleListManagementWillFinish:(AlertMultipleListManagement *)management selectDatas:(NSArray *)datas;

@end

@interface AlertMultipleListManagement : UIView

@property(nonatomic,strong) NSString *title;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(readonly) NSArray *selectedDatas;
@property (weak,nonatomic) id <AlertMultipleListManagementDelegate> delegate;
@property (nonatomic, assign) AlertMultipleListManagementTransitionStyle transitionStyle;
@property (nonatomic, assign) AlertMultipleListManagementBackgroundStyle backgroundStyle;

- (void)show;
- (void)dismissAnimated:(BOOL)animated;
- (void)setDataList:(NSArray *)data selectedDatas:(NSArray *)selectDatas;
- (void)reload;


@end
