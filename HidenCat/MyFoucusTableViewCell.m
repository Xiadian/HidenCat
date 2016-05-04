//
//  MyFoucusTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/4/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MyFoucusTableViewCell.h"

@implementation MyFoucusTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.foucusClick.layer.cornerRadius=15;
    self.foucusClick.clipsToBounds=YES;
    self.iconView.layer.cornerRadius=25;
    self.iconView.clipsToBounds=YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}
@end
