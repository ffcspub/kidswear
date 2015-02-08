//
//  CircleTrendCell.h
//  kidsweat
//
//  Created by Stephen on 15-2-1.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleTrendCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *vSubContent;
@property (weak, nonatomic) IBOutlet UIImageView *ivUsericon;
@property (weak, nonatomic) IBOutlet UILabel *lbNickname;
@property (weak, nonatomic) IBOutlet UILabel *lbTime;
@property (weak, nonatomic) IBOutlet UILabel *lbContent;
@property (weak, nonatomic) IBOutlet UIView *vImgContent;
@property (weak, nonatomic) IBOutlet UIImageView *ivPhoto1;
@property (weak, nonatomic) IBOutlet UIImageView *ivPhoto2;
@property (weak, nonatomic) IBOutlet UIImageView *ivPhoto3;


@end
