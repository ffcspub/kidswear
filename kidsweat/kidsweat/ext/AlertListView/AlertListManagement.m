//
//  AlertListManagement.m
//  flowerong
//
//  Created by nd on 14-10-20.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "AlertListManagement.h"


@class AlertListManagementBackgroundWindow;

const UIWindowLevel UIWindowLevelAlertListManagement = 1997.0;  // don't overlap system's alert
const UIWindowLevel UIWindowLevelAlertListManagementBackground = 1996.0; // below the alert window


static BOOL __si_alert_animating;
static AlertListManagementBackgroundWindow *__si_alert_background_window;
static AlertListManagement *__si_alert_current_view;

@interface AlertListManagement(){
    NSMutableDictionary *_listDatasDict;
    NSMutableDictionary *_selectDataDict;
    NSMutableDictionary *_titleDict;
}

@property (nonatomic, strong) UIWindow *alertWindow;
@property (nonatomic, assign, getter = isVisible) BOOL visible;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) IBOutlet UIButton *btn_nextFirst;
@property (weak, nonatomic) IBOutlet UIButton *btn_forward;
@property (weak, nonatomic) IBOutlet UIButton *btn_next;
@property (weak, nonatomic) IBOutlet UILabel *lb_title;

+ (BOOL)isAnimating;
+ (void)setAnimating:(BOOL)animating;

+ (void)showBackground;
+ (void)hideBackgroundAnimated:(BOOL)animated;

- (void)setup;

@end


#pragma mark - AlertListManagementBackgroundWindow

@interface AlertListManagementBackgroundWindow : UIWindow

@end

@interface AlertListManagementBackgroundWindow ()

@property (nonatomic, assign) AlertListManagementBackgroundStyle style;

@end

@implementation AlertListManagementBackgroundWindow

- (id)initWithFrame:(CGRect)frame andStyle:(AlertListManagementBackgroundStyle)style
{
    self = [super initWithFrame:frame];
    if (self) {
        self.style = style;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.opaque = NO;
        self.windowLevel = UIWindowLevelAlertListManagementBackground;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (self.style) {
        case AlertListManagementBackgroundStyleGradient:
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
        case AlertListManagementBackgroundStyleSolid:
        {
            [[UIColor colorWithWhite:0 alpha:0.5] set];
            CGContextFillRect(context, self.bounds);
            break;
        }
    }
}

@end

#pragma mark - SIAlertViewController

@interface AlertListManagementController : UIViewController

@property (nonatomic, strong) AlertListManagement *alertView;

@end

@implementation AlertListManagementController

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



@implementation AlertListManagement

- (void)awakeFromNib{
    [self initDict];
}

-(void)initDict{
    _selectDataDict = [[NSMutableDictionary alloc]init];
    _listDatasDict = [[NSMutableDictionary alloc]init];
    _titleDict = [[NSMutableDictionary alloc]init];
}

-(BOOL)isLastIndex{
    return self.levelIndex == (self.levelCount-1);
}

-(BOOL)isFirstIndex{
    return self.levelIndex == 0;
}

-(void)reloadData{
    if(_delegate && [_delegate respondsToSelector:@selector(willNextLevel:management:)]){
        [_delegate willNextLevel:_levelIndex management:self];
    }
}

- (void)reload{
    if ([self isFirstIndex]) {
        [_btn_forward setHidden:YES];
        [_btn_nextFirst setHidden:YES];
        if ([self isLastIndex]) {
            [_btn_nextFirst setTitle:@"完成" forState:UIControlStateNormal];
        }else{
            [_btn_nextFirst setTitle:@"下一步" forState:UIControlStateNormal];
        }
        [_btn_next setHidden:NO];
    }else{
        [_btn_forward setHidden:NO];
        [_btn_nextFirst setHidden:NO];
        [_btn_next setHidden:YES];
        if([self isLastIndex]){
            [_btn_nextFirst setTitle:@"完成" forState:UIControlStateNormal];
        }else{
            [_btn_nextFirst setTitle:@"下一步" forState:UIControlStateNormal];
        }
    }
    NSString *title = [_titleDict objectForKey:[NSNumber numberWithInt:_levelIndex]];
    if (!title) {
        title = @"请选择";
    }
    [_lb_title setText:title];
    [_tableView reloadData];
}

- (NSObject *)selectedDataByLevelIndex:(int)index{
    return [_selectDataDict objectForKey:[NSNumber numberWithInt:index]];
}

- (void)setDataList:(NSArray *)data levelIndex:(int)index selectedObject:(NSObject *)selectObject{
    [_listDatasDict setObject:data forKey:[NSNumber numberWithInt:index]];
    if (!selectObject) {
        [_selectDataDict setObject:data.firstObject forKey:[NSNumber numberWithInt:index]];
//        if(_delegate && [_delegate respondsToSelector:@selector(dataSelected:inLevelIndex:management:)]){
//            [_delegate dataSelected:data.firstObject inLevelIndex:_levelIndex management:self];
//        }
    
    }else{
        [_selectDataDict setObject:selectObject forKey:[NSNumber numberWithInt:index]];
//        if(_delegate && [_delegate respondsToSelector:@selector(dataSelected:inLevelIndex:management:)]){
//            [_delegate dataSelected:selectObject inLevelIndex:_levelIndex management:self];
//        }
        
    }
    
}

-(void)setTitle:(NSString *)title levelIndex:(int)index{
    [_titleDict setObject:title forKey:[NSNumber numberWithInt:index]];
}

#pragma mark - Button Action

- (IBAction)canelAction:(id)sender {
    [self dismissAnimated:YES];
}

- (IBAction)nextAction:(id)sender {
    if (![self isLastIndex]) {
        if(_delegate && [_delegate respondsToSelector:@selector(willNextLevel:management:)]){
            [_delegate willNextLevel:_levelIndex+1 management:self];
        }
        
    }else{
        if(_delegate && [_delegate respondsToSelector:@selector(alertListManagementWillFinish:)]){
            [_delegate alertListManagementWillFinish:self];
        }
        
        [self dismissAnimated:YES];
    }
}

- (IBAction)forwardAction:(id)sender {
    for (int i= _levelIndex; i<_levelCount; i++) {
        [_selectDataDict removeObjectForKey:[NSNumber numberWithInt:i]];
        if(_delegate && [_delegate respondsToSelector:@selector(dataSelected:inLevelIndex:management:)]){
            [_delegate dataSelected:nil inLevelIndex:i management:self];
        }
    }
    _levelIndex --;
    [self reload];
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
        __si_alert_background_window = [[AlertListManagementBackgroundWindow alloc] initWithFrame:[UIScreen mainScreen].bounds
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
    
    if ([AlertListManagement isAnimating]) {
        return;
    };

    if (self.isVisible) {
        return;
    }
    
    if (__si_alert_current_view.isVisible) {
        [__si_alert_current_view dismissAnimated:YES];
    }
    UIImage *btnBackImage = [[UIImage imageNamed:@"cut_price_btn_bg"]resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [_btn_forward setBackgroundImage:btnBackImage forState:UIControlStateNormal];
    [_btn_next setBackgroundImage:btnBackImage forState:UIControlStateNormal];
    [_btn_nextFirst setBackgroundImage:btnBackImage forState:UIControlStateNormal];
    
    self.visible = YES;
    
    [AlertListManagement setAnimating:YES];
    __si_alert_current_view = self;
    
    [AlertListManagement showBackground];
    
    AlertListManagementController *viewController = [[AlertListManagementController alloc] initWithNibName:nil bundle:nil];
    viewController.alertView = self;
    
    if (!self.alertWindow) {
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        window.opaque = NO;
        window.windowLevel = UIWindowLevelAlertListManagement;
        window.rootViewController = viewController;
        self.alertWindow = window;
    }
    [self.alertWindow makeKeyAndVisible];
    [self transitionInCompletion:^{
        [AlertListManagement setAnimating:NO];
    }];
    [self setup];
    [self reload];
    [self reloadData];
    
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
        
        [AlertListManagement setAnimating:NO];
        
        if (!isVisible) {
            return;
        }
    };
    
    if (animated && isVisible) {
        [AlertListManagement setAnimating:YES];
        [self transitionOutCompletion:dismissComplete];
        [AlertListManagement hideBackgroundAnimated:YES];
        
    } else {
        dismissComplete();
        [AlertListManagement hideBackgroundAnimated:YES];
    }

}

#pragma mark TableView DataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *datas = [_listDatasDict objectForKey:[NSNumber numberWithInt:_levelIndex]];
    return datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ALERTLISTCELL=@"ALERTLISTCELL";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ALERTLISTCELL];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ALERTLISTCELL];
    }
    NSArray *datas = [_listDatasDict objectForKey:[NSNumber numberWithInt:_levelIndex]];
    NSObject *data = [datas objectAtIndex:indexPath.row];
    cell.textLabel.text = data.description;
    if (data == [_selectDataDict objectForKey:[NSNumber numberWithInt:_levelIndex]]) {
        cell.imageView.image = [UIImage imageNamed:@"round_check2"];
    }else{
        cell.imageView.image = [UIImage imageNamed:@"round_check1"];
    }
    return cell;
}

#pragma mark TableView Delegate

//响应选中事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_delegate) {
       NSArray *datas = [_listDatasDict objectForKey:[NSNumber numberWithInt:_levelIndex]];
        NSObject *object = [datas objectAtIndex:indexPath.row];
        [_selectDataDict setObject:object forKey:[NSNumber numberWithInt:_levelIndex]];
        if(_delegate && [_delegate respondsToSelector:@selector(dataSelected:inLevelIndex:management:)]){
            [_delegate dataSelected:object inLevelIndex:_levelIndex management:self];
        }
        
        if (_levelIndex < _levelCount-1) {
            for (int i=(_levelIndex+1); i<_levelCount; i++) {
                [_selectDataDict removeObjectForKey:[NSNumber numberWithInt:i]];
                if(_delegate && [_delegate respondsToSelector:@selector(dataSelected:inLevelIndex:management:)]){
                    [_delegate dataSelected:nil inLevelIndex:i management:self];
                }
                
            }
        }
        if (![self isLastIndex]) {
            if(_delegate && [_delegate respondsToSelector:@selector(willNextLevel:management:)]){
                [_delegate willNextLevel:_levelIndex+1 management:self];
            }
            
            [tableView reloadData];
        }else{
            if(_delegate && [_delegate respondsToSelector:@selector(alertListManagementWillFinish:)]){
                [_delegate alertListManagementWillFinish:self ];
            }

            [self dismissAnimated:YES];
        }
        
        
    }
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
