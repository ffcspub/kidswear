//
//  MyShoppingCartCell.h
//  kidsweat
//
//  Created by chenzf on 15/2/25.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Good.h"

@interface MyShoppingCartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btnSelect;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbPrice;
@property (weak, nonatomic) IBOutlet UIImageView *ivPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lbColorSize;
@property (weak, nonatomic) IBOutlet UILabel *lbNumber;

- (IBAction)handleBtnSelectClicked:(id)sender;
- (IBAction)handleBtnChangeSizeClicked:(id)sender;
- (IBAction)handleBtnDelClicked:(id)sender;
- (IBAction)handleBtnReduceClicked:(id)sender;
- (IBAction)handleBtnAddClicked:(id)sender;

- (CGFloat)height;
- (void)setCellWithValue:(CarGood *)dataSource;

@end
