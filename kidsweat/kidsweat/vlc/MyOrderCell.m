//
//  MyOrderCell.m
//  kidsweat
//
//  Created by chenzf on 15/2/26.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyOrderCell.h"

@implementation MyOrderCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)heightByValue:(id)value{
    return 5;
}

- (void)setCellWithValue:(id)value{
    
}

- (IBAction)handleBtnActionClicked:(id)sender {
}

@end
