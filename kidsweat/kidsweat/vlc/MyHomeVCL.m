//
//  MyHomeVCL.m
//  kidsweat
//
//  Created by chenzf on 15-1-4.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyHomeVCL.h"

#import "SVPullToRefresh.h"

#import "MyHomeCell.h"
#import "MyInfoVCL.h"

#define HEADBG_HEIGH 170

@interface MyHomeVCL (){

}

@property (weak, nonatomic) IBOutlet UIView *vHeader;
@property (weak, nonatomic) IBOutlet UITableView *tvTrendList;

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
    
    __weak MyHomeVCL *weakSelf = self;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [_tvTrendList addPullToRefreshWithActionHandler:^{
        [weakSelf reloadDatas];
    }];
    
    // load more
    [_tvTrendList addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadMoreDatas];
    }];
    
    // set pullToRefreshView title
    [_tvTrendList.pullToRefreshView setTitle:@"松开手可以刷新" forState:SVPullToRefreshStateTriggered];
    [_tvTrendList.pullToRefreshView setTitle:@"正在刷新" forState:SVPullToRefreshStateLoading];
    [_tvTrendList.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
}


#pragma mark - Request

#pragma mark - Function

-(void)reloadDatas{
}

-(void)loadMoreDatas{
    
}

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


#pragma mark - Super Reload

-(BOOL)canBack{
    return YES;
}

@end
