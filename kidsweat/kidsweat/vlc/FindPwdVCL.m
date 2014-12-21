//
//  FindPasswordVCL.m
//  kidsweat
//
//  Created by chenzf on 14-11-3.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "FindPwdVCL.h"
#import "LoginView.h"
#import "UINavigationBar+BarItem.h"
#import "UserApi.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Add.h"
#import "NSString+External.h"

@interface FindPwdVCL ()

@end

@implementation FindPwdVCL

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
    self.title = @"找回密码";
    
    [self showLeftBarButtonItemWithImage:@"login_return_icon_nor" target:self action:@selector(hanleLeftBtn)];
    [[UIApplication sharedApplication].delegate.window.rootViewController.view bringSubviewToFront:self.view];
    
    _vStepOne.hidden = NO;
    _vStepTwo.hidden = YES;
}

#pragma mark - Function

- (void)close{
    LoginView *loginView = [[[NSBundle mainBundle] loadNibNamed:@"LoginView" owner:nil options:nil] lastObject];
    [loginView show];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)hanleLeftBtn{
    [self close];
}

- (IBAction)handleNextStep:(id)sender {
    if(_tfMail.text.length < 1){
        [MBProgressHUD showError:@"请输入邮箱" toView:self.view];
        return;
    }
    
    if(![_tfMail.text isEmail]){
        [MBProgressHUD showError:@"邮箱格式错误" toView:self.view];
        return;
    }
    
    [self sendPwdToEmailReq:_tfMail.text];
}

- (IBAction)handelConfirm:(id)sender {
    [self close];
}

#pragma mark - Request

- (void)sendPwdToEmailReq:(NSString *)email{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    UserApiSendPwdToEmailRequest *request = [[UserApiSendPwdToEmailRequest alloc]init];
    request.email = email;
    
    [UserApi sendPwdToEmailByRequest:request completionBlockWithSuccess:^(UserApiSendPwdToEmailResponse *response) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [MBProgressHUD showSuccess:@"发送成功" toView:self.view];
        
        _vStepOne.hidden = YES;
        _vStepTwo.hidden = NO;
        
    } Fail:^(NSString *failDescript) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [MBProgressHUD showError:failDescript toView:self.view];
        
    }];
}

@end
