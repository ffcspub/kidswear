//
//  MyFavVC.m
//  kidsweat
//
//  Created by chenzf on 15/2/2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyFavVC.h"
#import "MyLikeCell.h"

@interface MyFavVC ()

@property (weak, nonatomic) IBOutlet UITableView *tvFavList;

@end

@implementation MyFavVC

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
    self.title = @"我的收藏";
}

#pragma mark - Function

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 176;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyLikeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MYLIKECELL"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"MyLikeCell" bundle:nil] forCellReuseIdentifier:@"MYLIKECELL"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"MYLIKECELL"];
    }
    
    
    cell.btnLike.hidden = YES;
    CGRect frame = cell.btnShare.frame;
    frame.origin.x = 0;
    cell.btnShare.frame = frame;
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
