





//
//  MyMenuViewTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/5/4.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MyMenuViewTableViewCell.h"

@implementation MyMenuViewTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconView.layer.cornerRadius=20;
    self.iconView.clipsToBounds=YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
