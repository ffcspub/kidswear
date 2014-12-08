//
//  LoginVCL.h
//  kidsweat
//
//  Created by chenzf on 14-11-7.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVCL : UIViewController

@property (weak, nonatomic) IBOutlet UIView *vLoginView;
@property (weak, nonatomic) IBOutlet UIView *vRegistView;
@property (weak, nonatomic) IBOutlet UIView *vBgView;
@property (weak, nonatomic) IBOutlet UITextField *tfUsernameLogin;
@property (weak, nonatomic) IBOutlet UITextField *tfPwdLogin;
@property (weak, nonatomic) IBOutlet UITextField *tfUsernameRegist;
@property (weak, nonatomic) IBOutlet UITextField *tfPwdRegist;
@property (weak, nonatomic) IBOutlet UITextField *tfPwdAgainRegist;



- (void)show;
- (void)hide;
- (IBAction)handleBackLogin:(id)sender;
- (IBAction)handleToRegist:(id)sender;
- (IBAction)handleHideView:(id)sender;
- (IBAction)handleForgetPwd:(id)sender;
- (IBAction)handleBtnLogin:(id)sender;
- (IBAction)handleSinaLogin:(id)sender;
- (IBAction)handleWxLogin:(id)sender;
- (IBAction)handleBtnRegist:(id)sender;

@end
