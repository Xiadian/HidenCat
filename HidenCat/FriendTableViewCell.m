
//
//  FriendTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/3/22.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

- (void)awakeFromNib {
    self.iconButton.layer.cornerRadius=30;
    self.iconButton.clipsToBounds=YES;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
