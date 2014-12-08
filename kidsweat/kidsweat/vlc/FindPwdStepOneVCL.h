//
//  FindPasswordVCL.h
//  kidsweat
//
//  Created by chenzf on 14-11-3.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindPwdStepOneVCL : CommonViewController

@property (weak, nonatomic) IBOutlet UIView *vStepOne;
@property (weak, nonatomic) IBOutlet UIView *vStepTwo;
@property (weak, nonatomic) IBOutlet UITextField *tfMail;


- (IBAction)handleNextStep:(id)sender;
- (IBAction)handelConfirm:(id)sender;

@end
