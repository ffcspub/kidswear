//
//  HomePageViewController.m
//  kidsweat
//
//  Created by chenzf on 14-10-29.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import "HomePageViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface HomePageViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn_cartCount;

@property (weak, nonatomic) IBOutlet UIView *view_top;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
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

- (IBAction)handleMenu:(id)sender {
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (IBAction)handleShoppingcart:(id)sender {
    
}


@end
