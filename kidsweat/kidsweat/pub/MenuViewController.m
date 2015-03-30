//
//  MenuViewController.m
//  kidsweat
//
//  Created by chenzf on 14-10-30.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "MenuViewController.h"

#import "UIImageView+WebCache.h"
#import "UIViewController+MMDrawerController.h"

#import "UserInfo.h"

#import "LoginView.h"
#import "MyCenterVCL.h"

@interface MenuViewController ()<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *ivUsericon;
@property (weak, nonatomic) IBOutlet UILabel *lbNickname;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;


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
    [self setUserInfo];
}


#pragma mark - Function

- (void)setUserInfo{
    if([ShareValue standardShareValue].userInfo &&
       [ShareValue standardShareValue].userInfo.user_id.length > 0){
        UserInfo *user = [[UserInfo alloc] init];
        [_ivUsericon sd_setImageWithURL:[NSURL URLWithString:user.user_bonus]];
        _lbNickname.text = user.username;
        _btnLogout.hidden = NO;
    }else{
        _btnLogout.hidden = YES;
    }
}

- (IBAction)handleUsericonClicked:(id)sender {
    [self.mm_drawerController closeDrawerAnimated:NO completion:^(BOOL finished) {
        if([ShareValue standardShareValue].userInfo &&
           [ShareValue standardShareValue].userInfo.user_id.length > 0){
            MyCenterVCL *vcl = [[MyCenterVCL alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vcl];
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
            
        }else{
//            LoginView *loginView = [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] lastObject];
//            [loginView show];
            
            MyCenterVCL *vcl = [[MyCenterVCL alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vcl];
            [self.mm_drawerController presentViewController:nav animated:YES completion:nil];
        }
    }];
}

- (IBAction)handleLogout:(id)sender {
}


@end
