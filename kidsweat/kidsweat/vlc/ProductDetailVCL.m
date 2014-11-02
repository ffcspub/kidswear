//
//  ProductDetailVCL.m
//  kidsweat
//
//  Created by ilikeido on 14-11-1.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "ProductDetailVCL.h"

@interface ProductDetailVCL (){
    
}

@property (weak, nonatomic) IBOutlet UIButton *btn_nav_left;

@property (weak, nonatomic) IBOutlet UIButton *btn_nav_right;

@property (weak, nonatomic) IBOutlet UIButton *btn_nav_tag;

@property (weak, nonatomic) IBOutlet UILabel *lb_nav_title;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIScrollView *sv_image;

@property (weak, nonatomic) IBOutlet UIButton *btn_love;

@property (weak, nonatomic) IBOutlet UIButton *btn_lovecount;

@property (weak, nonatomic) IBOutlet UIPageControl *pc_page;

@property (weak, nonatomic) IBOutlet UILabel *lb_productname;


@property (weak, nonatomic) IBOutlet UILabel *lb_price;

@property (weak, nonatomic) IBOutlet UILabel *lb_oldprice;

@property (weak, nonatomic) IBOutlet UIButton *btn_share;

@property (weak, nonatomic) IBOutlet UIButton *btn_fav;

@property (weak, nonatomic) IBOutlet UIButton *btn_addcar;

@property (weak, nonatomic) IBOutlet UIImageView *iv_thumbnail;

@property (weak, nonatomic) IBOutlet UILabel *lb_design_title;

@property (weak, nonatomic) IBOutlet UILabel *lb_lovecount;

@property (weak, nonatomic) IBOutlet UIButton *btn_design;

@property (weak, nonatomic) IBOutlet UIButton *btn_red;

@property (weak, nonatomic) IBOutlet UIButton *btn_yellow;

@property (weak, nonatomic) IBOutlet UIButton *btn_white;

@property (weak, nonatomic) IBOutlet UIButton *btn_s;

@property (weak, nonatomic) IBOutlet UIButton *btn_m;

@property (weak, nonatomic) IBOutlet UIButton *btn_l;

@property (weak, nonatomic) IBOutlet UIButton *btn_xl;

@property (weak, nonatomic) IBOutlet UIButton *btn_rule;

@property (strong, nonatomic) IBOutlet UIView *vi_tool;

@property (weak, nonatomic) IBOutlet UIButton *btn_comment;

@property (weak, nonatomic) IBOutlet UIButton *btn_recommend;

@property (weak, nonatomic) IBOutlet UIButton *btn_record;

@property (weak, nonatomic) IBOutlet UIView *vi_splite;


@end

@implementation ProductDetailVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setTableHeaderView:_topView];
    self.tableView.userInteractionEnabled = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"CommentCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"XXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45.0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 45.0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return _vi_tool;
    }
    return nil;
}


@end
