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
    // Do any additional setup after loading the view.
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

@end
