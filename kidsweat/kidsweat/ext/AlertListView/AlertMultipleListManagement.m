//
//  AlertMultipleListManagement.m
//  flowerong
//
//  Created by nd on 14-10-20.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "AlertMultipleListManagement.h"


@class AlertMultipleListManagementBackgroundWindow;

const UIWindowLevel UIWindowLevelAlertMultipleListManagement = 1997.0;  // don't overlap system's alert
const UIWindowLevel UIWindowLevelAlertMultipleListManagementBackground = 1996.0; // below the alert window


static BOOL __si_alert_animating;
static AlertMultipleListManagementBackgroundWindow *__si_alert_background_window;
static AlertMultipleListManagement *__si_alert_current_view;

@interface AlertMultipleListManagement(){
    NSMutableArray *_listDatas;
    NSMutableArray *_selectDatas;
}

@property (nonatomic, strong) UIWindow *alertWindow;
@property (nonatomic, assign, getter = isVisible) BOOL visible;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIButton *btn_next;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;

+ (BOOL)isAnimating;
+ (void)setAnimating:(BOOL)animating;

+ (void)showBackground;
+ (void)hideBackgroundAnimated:(BOOL)animated;

- (void)setup;

@end


#pragma mark - AlertMultipleListManagementBackgroundWindow

@interface AlertMultipleListManagementBackgroundWindow : UIWindow

@end

@interface AlertMultipleListManagementBackgroundWindow ()

@property (nonatomic, assign) AlertMultipleListManagementBackgroundStyle style;

@end

@implementation AlertMultipleListManagementBackgroundWindow

- (id)initWithFrame:(CGRect)frame andStyle:(AlertMultipleListManagementBackgroundStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        self.style = style;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.opaque = NO;
        self.windowLevel = UIWindowLevelAlertMultipleListManagementBackground;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (self.style) {
        case AlertMultipleListManagementBackgroundStyleGradient:
        {
            size_t locationsCount = 2;
            CGFloat locations[2] = {0.0f, 1.0f};
            CGFloat colors[8] = {0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.0f, 0.75f};
            CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
            CGGradientRef gradient = CGGradientCreateWithColorComponents(colorSpace, colors, locations, locationsCount);
            CGColorSpaceRelease(colorSpace);
            
            CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
            CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height) ;
            CGContextDrawRadialGradient (context, gradient, center, 0, center, radius, kCGGradientDrawsAfterEndLocation);
            CGGradientRelease(gradient);
            break;
        }
        case AlertMultipleListManagementBackgroundStyleSolid:
        {
            [[UIColor colorWithWhite:0 alpha:0.5] set];
            CGContextFillRect(context, self.bounds);
            break;
        }
    }
}

@end

#pragma mark - SIAlertViewController

@interface AlertMultipleListManagementController : UIViewController

@property (nonatomic, strong) AlertMultipleListManagement *alertView;

@end

@implementation AlertMultipleListManagementController

#pragma mark - View life cycle

- (void)loadView
{
    self.view = self.alertView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.alertView setup];
}

@end



@implementation AlertMultipleListManagement

-(void)awakeFromNib{
    [self initDict];
}

-(void)initDict{
    _selectDatas = [[NSMutableArray alloc]init];
    _listDatas = [[NSMutableArray alloc]init];
}

- (void)reload{
    NSString *title = _title;
    if (!title) {
        title = @"请选择";
    }
    [_lb_title setText:title];
    [_tableView reloadData];
}


- (void)setDataList:(NSArray *)data selectedDatas:(NSArray *)selectDatas{
    [_listDatas removeAllObjects];
    [_selectDatas removeAllObjects];
    [_listDatas addObjectsFromArray:data];
    if (selectDatas) {
        [_selectDatas addObjectsFromArray:selectDatas];
    }
    [_tableView reloadData];
    
}

-(void)setTitle:(NSString *)title{
    _title = title;
    [_lb_title setText:title];
}

#pragma mark - Button Action

- (IBAction)canelAction:(id)sender {
    [self dismissAnimated:YES];
}


-(IBAction)nextAction:(id)sender{
    if (_selectDatas && _delegate) {
        [_delegate alertMultipleListManagementWillFinish:self selectDatas:_selectDatas];
    }
    [self dismissAnimated:YES];
}

#pragma mark - Class methods

+ (BOOL)isAnimating
{
    return __si_alert_animating;
}

+ (void)setAnimating:(BOOL)animating
{
    __si_alert_animating = animating;
}

+ (void)showBackground
{
    if (!__si_alert_background_window) {
        __si_alert_background_window = [[AlertMultipleListManagementBackgroundWindow alloc] initWithFrame:[UIScreen mainScreen].bounds
                                                                             andStyle:__si_alert_current_view.backgroundStyle];
        [__si_alert_background_window makeKeyAndVisible];
        __si_alert_background_window.alpha = 0;
        [UIView animateWithDuration:0.3
                         animations:^{
                             __si_alert_background_window.alpha = 1;
                         }];
    }
}

+ (void)hideBackgroundAnimated:(BOOL)animated
{
    if (!animated) {
        [__si_alert_background_window removeFromSuperview];
        __si_alert_background_window = nil;
        return;
    }
    [UIView animateWithDuration:0.3
                     animations:^{
                         __si_alert_background_window.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         [__si_alert_background_window removeFromSuperview];
                         __si_alert_background_window = nil;
                     }];
}


- (void)setup{
    self.tableView.delegate = (id<UITableViewDelegate>)self;
    self.tableView.dataSource = (id<UITableViewDataSource>)self;
    
}

- (void)teardown
{
    [self.containerView removeFromSuperview];
    self.containerView = nil;
    [self.alertWindow removeFromSuperview];
    self.alertWindow = nil;
}


#pragma mark - public methods

- (void)show{
    
    if ([AlertMultipleListManagement isAnimating]) {
        return;
    };

    if (self.isVisible) {
        return;
    }
    
    if (__si_alert_current_view.isVisible) {
        [__si_alert_current_view dismissAnimated:YES];
    }
    UIImage *btnBackImage = [[UIImage imageNamed:@"cut_price_btn_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [_btn_next setBackgroundImage:btnBackImage forState:UIControlStateNormal];
    
    self.visible = YES;
    
    [AlertMultipleListManagement setAnimating:YES];
    __si_alert_current_view = self;
    
    [AlertMultipleListManagement showBackground];
    
    AlertMultipleListManagementController *viewController = [[AlertMultipleListManagementController alloc] initWithNibName:nil bundle:nil];
    viewController.alertView = self;
    
    if (!self.alertWindow) {
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        window.opaque = NO;
        window.windowLevel = UIWindowLevelAlertMultipleListManagement;
        window.rootViewController = viewController;
        self.alertWindow = window;
    }
    [self.alertWindow makeKeyAndVisible];
    [self transitionInCompletion:^{
        [AlertMultipleListManagement setAnimating:NO];
    }];
    [self setup];
    [self reload];
    
}


- (void)dismissAnimated:(BOOL)animated{
    [self dismissAnimated:animated cleanup:YES];
}

- (void)dismissAnimated:(BOOL)animated cleanup:(BOOL)cleanup
{
     BOOL isVisible = self.isVisible;
    
    void (^dismissComplete)(void) = ^{
        self.visible = NO;
        [self teardown];
        
        __si_alert_current_view  = nil;
        
        [AlertMultipleListManagement setAnimating:NO];
        
        if (!isVisible) {
            return;
        }
    };
    
    if (animated && isVisible) {
        [AlertMultipleListManagement setAnimating:YES];
        [self transitionOutCompletion:dismissComplete];
        [AlertMultipleListManagement hideBackgroundAnimated:YES];
        
    } else {
        dismissComplete();
        [AlertMultipleListManagement hideBackgroundAnimated:YES];
    }

}

#pragma mark TableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _listDatas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ALERTLISTCELL=@"ALERTLISTCELL";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ALERTLISTCELL];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ALERTLISTCELL];
    }
    NSObject *data = [_listDatas objectAtIndex:indexPath.row];
    cell.textLabel.text = data.description;
    if ([_selectDatas containsObject:data]) {
        cell.imageView.image = [UIImage imageNamed:@"round_check2"];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"round_check1"];
    }
    return cell;
}

#pragma mark TableView Delegate

//响应选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *data = [_listDatas objectAtIndex:indexPath.row];
    if ([_selectDatas containsObject:data]){
        [_selectDatas removeObject:data];
    }else{
        [_selectDatas addObject:data];
    }
    [_tableView reloadData];
}


#pragma mark - Transitions

- (void)transitionInCompletion:(void(^)(void))completion
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@(0.01), @(1.2), @(0.9), @(1)];
    animation.keyTimes = @[@(0), @(0.4), @(0.6), @(1)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.duration = 0.5;
    animation.delegate = self;
    [animation setValue:completion forKey:@"handler"];
    [self.containerView.layer addAnimation:animation forKey:@"bouce"];
}

- (void)transitionOutCompletion:(void(^)(void))completion
{
    [UIView animateWithDuration:0.25
                     animations:^{
                         self.containerView.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         if (completion) {
                             completion();
                         }
                     }];
}

@end
