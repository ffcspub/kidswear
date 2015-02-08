//
//  CircleThemeVC.m
//  kidsweat
//
//  Created by Stephen on 15-2-1.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "CircleThemeVC.h"
#import "CircleThemeCell.h"

@interface CircleThemeVC ()

@property (weak, nonatomic) IBOutlet UITableView *tvThemeList;
@property (weak, nonatomic) IBOutlet UIButton *btnAll;
@property (weak, nonatomic) IBOutlet UIButton *btnMy;
@property (weak, nonatomic) IBOutlet UIButton *btnFriend;
@property (weak, nonatomic) IBOutlet UIButton *btnHot;



@end

@implementation CircleThemeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
    [self initView];
    [self handleFunctionBtnClicked:_btnAll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
}

- (void)initView{
    self.title = @"活动主题";
}

#pragma mark - Function

- (IBAction)handleFunctionBtnClicked:(id)sender {
    _btnAll.enabled = YES;
    _btnMy.enabled = YES;
    _btnFriend.enabled = YES;
    _btnHot.enabled = YES;
    
    UIButton *button = (UIButton *)sender;
    button.enabled = NO;
    switch (button.tag) {
        case 1:
            // 所有
            
            break;
        case 2:
            // 我参与
            break;
        case 3:
            // 好友说
            break;
        case 4:
            // 热门
            break;
            
        default:
            break;
    }
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 94;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CircleThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CIRCLETHEMECELL"];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"CircleThemeCell" bundle:nil] forCellReuseIdentifier:@"CIRCLETHEMECELL"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CIRCLETHEMECELL"];
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
