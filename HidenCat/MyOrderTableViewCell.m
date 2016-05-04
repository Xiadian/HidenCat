
//
//  MyOrderTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/3/29.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MyOrderTableViewCell.h"

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
    self.sendGoods.layer.cornerRadius=10;
    self.sendGoods.clipsToBounds=YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
