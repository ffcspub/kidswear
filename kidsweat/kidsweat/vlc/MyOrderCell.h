//
//  MyOrderCell.h
//  kidsweat
//
//  Created by chenzf on 15/2/26.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lbOrderState;
@property (weak, nonatomic) IBOutlet UIView *vTotalCount;
@property (weak, nonatomic) IBOutlet UILabel *lbTotalCount;
@property (weak, nonatomic) IBOutlet UIButton *btnAction;

+ (CGFloat)heightByValue:(id)value;
- (void)setCellWithValue:(id)value;
- (IBAction)handleBtnActionClicked:(id)sender;


@end
