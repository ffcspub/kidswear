//
//  CommonViewController.m
//  kidsweat
//
//  Created by chenzf on 14-10-30.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()

@end

@implementation CommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 0000
    if (IOS7_OR_LATER) {
        self.navigationController.navigationBar.translucent = NO;
    }
#endif
    
    // Do any additional setup after loading the view.
    //[self showLeftBarButtonItemWithImage:@"btn_back" target:self action:@selector(backAction)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil{
    NSString *strNibName = nibNameOrNil;
    if(!IOS7_OR_LATER){
        strNibName = [NSString stringWithFormat:@"%@_IOS6",nibNameOrNil];
    }
    return [self initWithNibName:strNibName bundle:nil];
}

- (IBAction)backAction{
    if (self.navigationController.viewControllers.count == 1) {
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

@end
