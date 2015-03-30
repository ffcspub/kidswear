//
//  CircleHomeVC.m
//  kidsweat
//
//  Created by chenzf on 15/1/30.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CircleHomeVC.h"

#import "UIColor+External.h"

#import "CircleTrendVC.h"
#import "CircleThemeVC.h"
#import "CircleAddNewVC.h"
#import "MyLikeVC.h"
#import "MyFavVC.h"

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
    UIButton *button= [UIButton buttonWithType:UIButtonTypeCustom];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.backgroundColor = [UIColor clearColor];
    button.frame = CGRectMake(0, 0, 50, 30);
    [button setTitleColor:HEX_RGB(0x92c200) forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button setTitle:@"发表" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleRightButtom) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    _lbThemeNewCount.text = @"115";
    [self adjustRemainViewWithBg:_ivThemeNew CountLabel:_lbThemeNewCount];
    
    _lbMsgNewCount.text = @"25";
    [self adjustRemainViewWithBg:_ivMsgNew CountLabel:_lbMsgNewCount];
}

#pragma mark - Tool

- (void)adjustRemainViewWithBg:(UIImageView *)ivBg CountLabel:(UILabel *)lbCount{

    CGFloat labelW = [lbCount.text sizeWithFont:lbCount.font constrainedToSize:CGSizeMake(300, lbCount.frame.size.height) lineBreakMode:NSLineBreakByCharWrapping].width+2;
    if(labelW < 12)
    {
        labelW = 12;
    }
    
    lbCount.frame = CGRectMake(lbCount.frame.origin.x , lbCount.frame.origin.y, labelW, lbCount.frame.size.height);
    ivBg.frame = CGRectMake(lbCount.frame.origin.x , lbCount.frame.origin.y, labelW, ivBg.frame.size.height);
}

#pragma mark - Function

- (void)handleRightButtom{
    CircleAddNewVC *vcl = [[CircleAddNewVC alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vcl];
    [self presentViewController:nav animated:YES completion:nil];
}

- (IBAction)handleFunctionClicked:(id)sender {
    UIViewController *viewController = nil;
    UIButton *button = (UIButton *)sender;
    switch (button.tag) {
        case 1:{
            // 动态广场
            viewController = [[CircleTrendVC alloc] init];
        }
            
            break;
            
        case 2:{
            // 喜欢的
            viewController = [[MyLikeVC alloc] init];
        }
            
            break;
            
        case 3:{
            // 收藏的
            viewController = [[MyFavVC alloc] init];
        }
            
            break;
            
        case 4:{
            // 活动主题
            viewController = [[CircleThemeVC alloc] init];
        }
            
            break;
            
        default:
            break;
    }
    
    if(viewController){
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}


@end
