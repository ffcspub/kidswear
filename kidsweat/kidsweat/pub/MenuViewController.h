//
//  MenuViewController.h
//  kidsweat
//
//  Created by chenzf on 14-10-30.
//  Copyright (c) 2014年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : CommonViewController

@property (weak, nonatomic) IBOutlet UIButton *btnLogout;


- (IBAction)handleUsericonClicked:(id)sender;
- (IBAction)handleLogout:(id)sender;


@end
