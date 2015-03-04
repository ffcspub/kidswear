//
//  LoginView.m
//  kidsweat
//
//  Created by chenzf on 14-10-30.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "LoginView.h"
#import "UIView+Animation.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Add.h"
#import "FindPwdVCL.h"
#import "UserApi.h"

@implementation LoginView

- (void)awakeFromNib{
    CGRect frame = self.frame;
    frame.size.height = [UIScreen mainScreen].bounds.size.height;
    self.frame = frame;
    self.vLoginView.center = self.center;
    self.vRegistView.center = self.center;
    self.vRegistView.hidden = YES;
    
    UITapGestureRecognizer *singleGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapBg)];
    singleGesture.numberOfTapsRequired = 1;
    self.vBgView.userInteractionEnabled = YES;
    [self.vBgView addGestureRecognizer:singleGesture];
    
}

- (void)show{
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    [self.vLoginView dropdownAnimation:^{
    }];
}

- (void)hide{
    if(!self.vLoginView.hidden){
        [self.vLoginView pullupAnimation:^{
            [self removeFromSuperview];
        }];
    }else{
        [self.vRegistView pullupAnimation:^{
            [self removeFromSuperview];
        }];
    }
}

- (IBAction)handleHideView:(id)sender {
    [self hide];
}

- (void)handleTapBg{
    [self hide];
}


#pragma mark - login

- (IBAction)handleToRegist:(id)sender {
    [UIView transitionWithView:self.vLoginView duration:0.3 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
        self.vLoginView.alpha = 0;
    } completion:^(BOOL finished) {
        self.vLoginView.hidden = YES;
        self.vLoginView.alpha = 1;
        self.vRegistView.hidden = NO;
    }];
    
}

- (IBAction)handleForgetPwd:(id)sender {
    [self hide];
    
    FindPwdVCL *vcl = [[FindPwdVCL alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vcl];
    [[UIApplication sharedApplication].delegate.window.rootViewController presentViewController:nav animated:YES completion:nil];
}

- (IBAction)handleBtnLogin:(id)sender {
    [_tfUsernameLogin resignFirstResponder];
    [_tfPwdLogin resignFirstResponder];
    
    if(_tfUsernameLogin.text.length < 1){
        [MBProgressHUD showError:@"请输入用户名" toView:ShareAppDelegate.window];
        return;
    }
    
    if(_tfPwdLogin.text.length < 1){
        [MBProgressHUD showError:@"请输入密码" toView:ShareAppDelegate.window];
        return;
    }
    
    [self sendLoginReq:_tfUsernameLogin.text Password:_tfPwdLogin.text];
}

- (IBAction)handleSinaLogin:(id)sender {
}

- (IBAction)handleWxLogin:(id)sender {
}

#pragma mark - regist

- (IBAction)handleBackLogin:(id)sender {
    [UIView transitionWithView:self.vRegistView duration:0.3 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        self.vRegistView.alpha = 0;
    } completion:^(BOOL finished) {
        self.vRegistView.hidden = YES;
        self.vRegistView.alpha = 1;
        self.vLoginView.hidden = NO;
    }];
}

- (IBAction)handleBtnRegist:(id)sender {
    [_tfUsernameRegist resignFirstResponder];
    [_tfPwdRegist resignFirstResponder];
    [_tfPwdAgainRegist resignFirstResponder];
    
    if(_tfUsernameRegist.text.length < 1){
        [MBProgressHUD showError:@"请输入用户名" toView:ShareAppDelegate.window];
        return;
    }
    
    if(_tfPwdRegist.text.length < 1){
        [MBProgressHUD showError:@"请输入密码" toView:ShareAppDelegate.window];
        return;
    }
    
    if(_tfPwdAgainRegist.text.length < 1){
        [MBProgressHUD showError:@"请再次输入密码" toView:ShareAppDelegate.window];
        return;
    }
    
    if(![_tfPwdAgainRegist.text isEqualToString:_tfPwdRegist.text]){
        [MBProgressHUD showError:@"两次密码不同" toView:ShareAppDelegate.window];
        return;
    }
    
    [self sendRegistReq:_tfUsernameRegist.text Password:_tfPwdRegist.text];
}

#pragma mark - Request

- (void)sendRegistReq:(NSString *)username Password:(NSString *)password{
    [MBProgressHUD showHUDAddedTo:self animated:YES];
    
    UserApiRegisterRequest *request = [[UserApiRegisterRequest alloc]init];
    request.username = username;
    request.password = password;
    
    
    [UserApi registerByRequest:request completionBlockWithSuccess:^(UserApiRegisterResponse *response) {
        [MBProgressHUD hideHUDForView:self animated:YES];
        [MBProgressHUD showSuccess:@"注册成功" toView:ShareAppDelegate.window];
        
        [self handleBackLogin:nil];
        
    } Fail:^(NSString *failDescript) {
        [MBProgressHUD hideHUDForView:self animated:YES];
        [MBProgressHUD showError:failDescript toView:ShareAppDelegate.window];
        
    }];

}

- (void)sendLoginReq:(NSString *)username Password:(NSString *)password{
    [MBProgressHUD showHUDAddedTo:self animated:YES];
    
    UserApiLoginRequest *request = [[UserApiLoginRequest alloc]init];
    request.username = username;
    request.password = password;
    // chenzftodo: token是什么
    [UserApi loginByRequest:request completionBlockWithSuccess:^(UserApiLoginResponse *response) {
        [MBProgressHUD hideHUDForView:self animated:YES];
        [MBProgressHUD showSuccess:@"登录成功" toView:ShareAppDelegate.window];
        
        [self hide];
    } Fail:^(NSString *failDescript) {
        [MBProgressHUD hideHUDForView:self animated:YES];
        [MBProgressHUD showError:failDescript toView:ShareAppDelegate.window];
    }];
}


@end
