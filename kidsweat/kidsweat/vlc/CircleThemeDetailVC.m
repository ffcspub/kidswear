//
//  CircleThemeDetailVC.m
//  kidsweat
//
//  Created by chenzf on 15/3/16.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CircleThemeDetailVC.h"

#import "SVPullToRefresh.h"
#import "UIImageView+WebCache.h"

@interface CircleThemeDetailVC ()

@property (weak, nonatomic) IBOutlet UITableView *tvContain;
@property (strong, nonatomic) IBOutlet UIView *vHeader;
@property (weak, nonatomic) IBOutlet UIImageView *ivMainPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbContent;
@property (weak, nonatomic) IBOutlet UIView *vLike;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;



@end

@implementation CircleThemeDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
    [self initView];
    [self resetHeaderView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
    
}

- (void)initView{
    __weak CircleThemeDetailVC *weakSelf = self;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [_tvContain addPullToRefreshWithActionHandler:^{
        [weakSelf reloadDatas];
    }];
    
    // load more
    [_tvContain addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadMoreDatas];
    }];
    
    // set pullToRefreshView title
    [_tvContain.pullToRefreshView setTitle:@"松开手可以刷新" forState:SVPullToRefreshStateTriggered];
    [_tvContain.pullToRefreshView setTitle:@"正在刷新" forState:SVPullToRefreshStateLoading];
    [_tvContain.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
}

#pragma mark - Function

-(void)reloadDatas{
}

-(void)loadMoreDatas{
    
}

- (void)resetHeaderView{
    //todo: 设置头部属性
    [_tvContain setTableHeaderView:_vHeader];
}

- (IBAction)handleBtnLikeClicked:(id)sender {
}

- (IBAction)handleBtnReplyClicked:(id)sender {
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 176;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    MyLikeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MYLIKECELL"];
//    if (!cell) {
//        [tableView registerNib:[UINib nibWithNibName:@"MyLikeCell" bundle:nil] forCellReuseIdentifier:@"MYLIKECELL"];
//        cell = [tableView dequeueReusableCellWithIdentifier:@"MYLIKECELL"];
//    }
//    
//    
//    cell.btnLike.hidden = YES;
//    CGRect frame = cell.btnShare.frame;
//    frame.origin.x = 0;
//    cell.btnShare.frame = frame;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
    
    return nil;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
