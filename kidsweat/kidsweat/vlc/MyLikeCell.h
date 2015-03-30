//
//  MyLikeCell.h
//  kidsweat
//
//  Created by chenzf on 15/2/2.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyLikeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ivPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbNewPrice;
@property (weak, nonatomic) IBOutlet UILabel *lbOldPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnLike;
@property (weak, nonatomic) IBOutlet UIButton *btnShare;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;




@end
