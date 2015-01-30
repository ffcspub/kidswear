//
//  AlertListManagement.h
//  flowerong
//
//  Created by nd on 14-10-20.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, AlertListManagementBackgroundStyle) {
    AlertListManagementBackgroundStyleGradient = 0, //渐变
    AlertListManagementBackgroundStyleSolid, // 固定
};

typedef NS_ENUM(NSInteger, AlertListManagementTransitionStyle) {
    AlertListManagementTransitionStyleSlideFromBottom = 0,
    AlertListManagementTransitionStyleSlideFromTop,
    AlertListManagementTransitionStyleFade,
    AlertListManagementTransitionStyleBounce,
    AlertListManagementTransitionStyleDropDown
};

@class AlertListManagement;

@protocol AlertListManagementDelegate <NSObject>

@optional

-(void)dataSelected:(NSObject *)data inLevelIndex:(int)levelIndex management:(AlertListManagement *)management;
-(void)willNextLevel:(int)levelIndex management:(AlertListManagement *)management;
-(void)alertListManagementWillFinish:(AlertListManagement *)management;


@end

@interface AlertListManagement : UIView

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak,nonatomic) id <AlertListManagementDelegate> delegate;
@property (nonatomic, assign) AlertListManagementTransitionStyle transitionStyle;
@property (nonatomic, assign) AlertListManagementBackgroundStyle backgroundStyle;
@property (nonatomic, assign) int levelIndex;
@property(nonatomic,assign) int levelCount;

- (void)show;
- (void)dismissAnimated:(BOOL)animated;
-(void)setTitle:(NSString *)title levelIndex:(int)index;
- (void)setDataList:(NSArray *)data levelIndex:(int)index selectedObject:(NSObject *)selectObject;
- (void)reload;
- (NSObject *)selectedDataByLevelIndex:(int)index;

@end
