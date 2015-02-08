//
//  CircleTrendVC.m
//  kidsweat
//
//  Created by Stephen on 15-2-1.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CircleTrendVC.h"
#import "CircleTrendCell.h"

@interface CircleTrendVC ()

@property (weak, nonatomic) IBOutlet UITableView *tvTrendList;


@end

@implementation CircleTrendVC

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
    self.title = @"动态广场";
}

#pragma mark - Function

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 193;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CircleTrendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CIRCLETRENDCELL"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CircleTrendCell" bundle:nil] forCellReuseIdentifier:@"CIRCLETRENDCELL"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CIRCLETRENDCELL"];
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
