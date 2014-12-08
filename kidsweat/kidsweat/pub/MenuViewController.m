//
//  MenuViewController.m
//  kidsweat
//
//  Created by chenzf on 14-10-30.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "MenuViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "LoginView.h"


@interface MenuViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
    
}

- (void)initView{
    
}


#pragma mark - Function

- (IBAction)handleShowLoginView:(id)sender {
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        LoginView *loginView = [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] lastObject];
        [loginView show];
    }];
}

- (IBAction)handleLogout:(id)sender {
}
@end
