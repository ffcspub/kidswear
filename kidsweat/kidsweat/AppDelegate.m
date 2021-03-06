//
//  AppDelegate.m
//  kidsweat
//
//  Created by ilikeido on 14-10-21.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "AppDelegate.h"
#import "UserApi.h"
#import "MMDrawerController.h"
#import "HomePageViewController.h"
#import "MenuViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController * centerViewController = [[HomePageViewController alloc] initWithNibName:@"HomePageViewController"];
    UIViewController * leftSideDrawerViewController = [[MenuViewController alloc] initWithNibName:@"MenuViewController"];
    
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
    navigationController.navigationBarHidden = YES;
    MMDrawerController * drawerController = [[MMDrawerController alloc]
                                             initWithCenterViewController:navigationController
                                             leftDrawerViewController:leftSideDrawerViewController
                                             rightDrawerViewController:nil];
    [drawerController setMaximumLeftDrawerWidth:243.0];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [drawerController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {

     }];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = drawerController;
    [self.window makeKeyAndVisible];
    
    
    
//    UserApiLoginRequest *request = [[UserApiLoginRequest alloc]init];
//    request.username = @"iwangzhi";
//    request.password = @"123456";
//    request.token = @"tongzhuang";
//    [UserApi loginByRequest:request completionBlockWithSuccess:^(UserApiLoginResponse *response) {
//        NSLog(@"success,UserName:%@",response.Data.user_name);
//    } Fail:^(NSString *failDescript) {
//        NSLog(@"fail:%@",failDescript);
//    }];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
