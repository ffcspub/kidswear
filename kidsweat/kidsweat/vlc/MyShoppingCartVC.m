//
//  MyShoppingCartVC.m
//  kidsweat
//
//  Created by chenzf on 15/2/25.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyShoppingCartVC.h"

#import "SVPullToRefresh.h"

#import "CarApi.h"

#import "MyShoppingCartCell.h"

@interface MyShoppingCartVC (){
    NSMutableArray *_aryDataSource;
}

@property (weak, nonatomic) IBOutlet UITableView *tvCarList;

@end

@implementation MyShoppingCartVC

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
    _aryDataSource = [[NSMutableArray alloc] init];
    

}

- (void)initView{
    self.title = @"购物车";
    
    __weak MyShoppingCartVC *weakSelf = self;
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [_tvCarList addPullToRefreshWithActionHandler:^{
        [weakSelf reloadDatas];
    }];
    
    // load more
    [_tvCarList addInfiniteScrollingWithActionHandler:^{
        [weakSelf loadMoreDatas];
    }];
    
    // set pullToRefreshView title
    [_tvCarList.pullToRefreshView setTitle:@"松开手可以刷新" forState:SVPullToRefreshStateTriggered];
    [_tvCarList.pullToRefreshView setTitle:@"正在刷新" forState:SVPullToRefreshStateLoading];
    [_tvCarList.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
}

#pragma mark - Function

-(void)reloadDatas{
}

-(void)loadMoreDatas{
//    GetCarGoodsApiRequest *request = [[GetCarGoodsApiRequest alloc] init];
//    [CarApi getCarGoodsByRequest:request completionBlockWithSuccess:^(GetCarGoodsApiResponse *response) {
//        
//    } Fail:^(NSString *failDescript) {
//        
//    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyShoppingCartCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MYSHOPPINGCARTCELL"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"MyShoppingCartCell" bundle:nil] forCellReuseIdentifier:@"MYSHOPPINGCARTCELL"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MYSHOPPINGCARTCELL"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
