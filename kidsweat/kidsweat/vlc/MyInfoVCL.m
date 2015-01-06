//
//  MyInfoVCL.m
//  kidsweat
//
//  Created by chenzf on 15-1-5.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyInfoVCL.h"

@interface MyInfoVCL ()

@end

@implementation MyInfoVCL

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
    self.title = @"我的资料";
    [_svContain setContentSize:CGSizeMake(_svContain.frame.size.width, _btnConfirm.frame.origin.y + _btnConfirm.frame.size.height + 10)];
}

#pragma mark - Function

- (IBAction)handleItemClicked:(id)sender {
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1:{
            
        }
            break;
            
        case 2:{
            
        }
            break;
            
        case 3:{
            
        }
            break;
            
        case 4:{
            
        }
            break;
            
        case 5:{
            
        }
            break;
            
        case 6:{
            
        }
            break;
            
        default:
            break;
    }
    
    
}

- (IBAction)handleBtnConfirmClicked:(id)sender {
}


#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}

@end
