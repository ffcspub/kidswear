//
//  MyShoppingCartCell.m
//  kidsweat
//
//  Created by chenzf on 15/2/25.
//  Copyright (c) 2015年 ilikeido. All rights reserved.
//

#import "MyShoppingCartCell.h"

@implementation MyShoppingCartCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)handleBtnSelectClicked:(id)sender {
}

- (IBAction)handleBtnChangeSizeClicked:(id)sender {
}

- (IBAction)handleBtnDelClicked:(id)sender {
}

- (IBAction)handleBtnReduceClicked:(id)sender {
}

- (IBAction)handleBtnAddClicked:(id)sender {
}

- (CGFloat)height{
    return CGRectGetHeight(self.frame);
}

- (void)setCellWithValue:(CarGood *)dataSource{
//    @property(nonatomic,strong) NSString *rec_id;//记录id
//    
//    @property(nonatomic,strong) NSString *goods_id;//商品id
//    
//    @property(nonatomic,strong) NSString *goods_name;//商品名称
//    
//    @property(nonatomic,strong) NSString *goods_attr;//商品属性
//    
//    @property(nonatomic,assign) float *total_price;//总价格
//    
//    @property(nonatomic,assign) int goods_number;//数量
//    
//    @property(nonatomic,strong) NSString *goods_thumb;//商品缩略图
//    
//    @property(nonatomic,strong) NSString *market_price;//市场价
//    if(dataSource){
//        self.btnSelect.selected = NO;
//        self.lbName.text = dataSource.goods_name;
//        self.lbPrice.text = dataSource.;
//        self.ivPhoto.image = ;
//        self.lbColorSize.text = ;
//        self.lbNumber.text = ;
//    }
    

}


@end
