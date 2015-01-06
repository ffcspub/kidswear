//
//  MyHomeVCL.m
//  kidsweat
//
//  Created by chenzf on 15-1-4.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyHomeVCL.h"
#import "MyHomeCell.h"
#import "MyInfoVCL.h"

#define HEADBG_HEIGH 170

@interface MyHomeVCL (){
    UIView *_refreshBgView;
    CGFloat _expandHeight;
}

@end

@implementation MyHomeVCL

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
    self.title = @"某某的主页";
    [_tvTrendList setTableHeaderView:_vHeader];
    
    [self CreateSlideBackground];
}

-(void)CreateSlideBackground{
    
    _refreshBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, HEADBG_HEIGH)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, HEADBG_HEIGH)];
    [imageView setImage:[UIImage imageNamed:@"myindex_bg.jpg"]];
    
    //关键步骤 设置可变化背景view属性
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight| UIViewAutoresizingFlexibleWidth;
    imageView.clipsToBounds = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    
    [_refreshBgView addSubview:imageView];
    
    _expandHeight = CGRectGetHeight(_refreshBgView.frame);
    
    _tvTrendList.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [_tvTrendList insertSubview:_refreshBgView atIndex:0];
    
    _refreshBgView.contentMode= UIViewContentModeScaleAspectFill;
    _refreshBgView.clipsToBounds = YES;
    
    [_refreshBgView setFrame:CGRectMake(0, 0, CGRectGetWidth(_refreshBgView.frame), _expandHeight)];
}

#pragma mark - Function

- (IBAction)handleUsericonClicked:(id)sender {
    MyInfoVCL *vcl = [[MyInfoVCL alloc] init];
    [self.navigationController pushViewController:vcl animated:YES];
}



#pragma mark - UITableViewDataSource



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MYHOMECELL"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"MyHomeCell" bundle:nil] forCellReuseIdentifier:@"MYHOMECELL"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MYHOMECELL"];
    }
    
    if(indexPath.row == 0){
        cell.vCamera.hidden = NO;
        cell.vTrends.hidden = YES;
    }else{
        cell.vCamera.hidden = YES;
        cell.vTrends.hidden = NO;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGRect currentFrame = _refreshBgView.frame;
    currentFrame.origin.y = offsetY;
    currentFrame.size.height = _expandHeight+(-1*offsetY);
    _refreshBgView.frame = currentFrame;
}

#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}

@end
