//
//  MyCenterVCL.m
//  kidsweat
//
//  Created by chenzf on 15-1-4.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyCenterVCL.h"
#import "MyCenterCell.h"
#import "UIColor+External.h"
#import "MyHomeVCL.h"
#import "CircleHomeVC.h"

@interface MyCenterVCL ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyCenterVCL

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
    self.title = @"我";
    [self showLeftBarButtonItemWithImage:@"mypage_home_icon_nor" target:self action:@selector(hanleLeftBtn)];
}

#pragma mark - Function

- (void)hanleLeftBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)handleUsericonClicked:(id)sender {
    MyHomeVCL *vcl = [[MyHomeVCL alloc] init];
    [self.navigationController pushViewController:vcl animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 3;
            break;
            
        case 3:
            return 1;
            break;
            
        default:
            return 0;
            break;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = HEX_RGB(0xF5F5F5);
    
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MYCENTERCELL"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"MyCenterCell" bundle:nil] forCellReuseIdentifier:@"MYCENTERCELL"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MYCENTERCELL"];
    }
    
    switch (indexPath.section) {
        case 0:{
            if(indexPath.row == 0){
                cell.ivIcon.image = [UIImage imageNamed:@"mypage_car_icon"];
                cell.lbName.text = @"购物车";
                
            }else if(indexPath.row == 1){
                cell.ivIcon.image = [UIImage imageNamed:@"mypage_dingd_icon"];
                cell.lbName.text = @"全部订单";
                
                cell.lbLineUp.hidden = YES;
            }
        }
            
            break;
        case 1:{
            if(indexPath.row == 0){
                cell.ivIcon.image = [UIImage imageNamed:@"mypage_pingj_icon"];
                cell.lbName.text = @"待评价";
            }
        }
            break;
        case 2:{
            if(indexPath.row == 0){
                cell.ivIcon.image = [UIImage imageNamed:@"mypage_youh_icon"];
                cell.lbName.text = @"我的优惠券";
                
            }else if(indexPath.row == 1){
                cell.ivIcon.image = [UIImage imageNamed:@"mypage_love_icon"];
                cell.lbName.text = @"我的喜欢";
                
                cell.lbLineUp.hidden = YES;
                
            }else if(indexPath.row == 2){
                cell.ivIcon.image = [UIImage imageNamed:@"mypage_shouc_icon"];
                cell.lbName.text = @"我的收藏";
                
                cell.lbLineUp.hidden = YES;
            }
        }
            break;
        case 3:{
            if(indexPath.row == 0){
                cell.ivIcon.image = [UIImage imageNamed:@"mypage_zhenb_icon"];
                cell.lbName.text = @"珍宝阁";
            }
        }
            break;
            
        default:
            break;
    }
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *viewController = nil;
    switch (indexPath.section) {
        case 0:{
            if(indexPath.row == 0){
                //购物车
                
            }else if(indexPath.row == 1){
                //全部订单

            }
        }
            
            break;
        case 1:{
            if(indexPath.row == 0){
                //待评价
            }
        }
            break;
        case 2:{
            if(indexPath.row == 0){
                //我的优惠券
                
            }else if(indexPath.row == 1){
                //我的喜欢
                
            }else if(indexPath.row == 2){
                //我的收藏
            }
        }
            break;
        case 3:{
            if(indexPath.row == 0){
                //珍宝阁
                viewController = [[CircleHomeVC alloc] init];
            }
        }
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
