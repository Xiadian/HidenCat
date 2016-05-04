//
//  MySettingTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/3/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MySettingTableViewCell.h"

@implementation MySettingTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.detailLB.adjustsFontSizeToFitWidth=YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end
