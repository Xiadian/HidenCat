//
//  AddressGetTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/4/13.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "AddressGetTableViewCell.h"

@implementation AddressGetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)edictClick:(UIButton *)sender {
    [self.delegate edict:sender];
}

@end
