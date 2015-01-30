//
//  CircleHomeVC.m
//  kidsweat
//
//  Created by chenzf on 15/1/30.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CircleHomeVC.h"

@interface CircleHomeVC ()

@property (weak, nonatomic) IBOutlet UIView *vUsericonNew;
@property (weak, nonatomic) IBOutlet UIImageView *ivUsericonNew;
@property (weak, nonatomic) IBOutlet UIImageView *ivMsgNew;
@property (weak, nonatomic) IBOutlet UILabel *lbMsgNewCount;
@property (weak, nonatomic) IBOutlet UIImageView *ivThemeNew;
@property (weak, nonatomic) IBOutlet UILabel *lbThemeNewCount;





@end

@implementation CircleHomeVC

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
    self.title = @"珍宝阁";
    
    _lbThemeNewCount.text = @"512";
    _lbThemeNewCount.frame = CGRectMake(200, 10, 30, 30);
    
    //[self adjustRemainViewWithBg:_ivThemeNew CountLabel:_lbThemeNewCount];
}

#pragma mark - Tool

- (void)adjustRemainViewWithBg:(UIImageView *)ivBg CountLabel:(UILabel *)lbCount{

    CGFloat labelW = [lbCount.text sizeWithFont:lbCount.font constrainedToSize:CGSizeMake(300, lbCount.frame.size.height) lineBreakMode:NSLineBreakByCharWrapping].width + 10;
    if(labelW < 12)
    {
        labelW = 12;
    }
    
    lbCount.frame = CGRectMake(lbCount.frame.origin.x , lbCount.frame.origin.y, labelW, labelW);
    ivBg.frame = lbCount.frame;
}

#pragma mark - Function

- (IBAction)handleFunctionClicked:(id)sender {
}

#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}


@end
