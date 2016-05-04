//
//  MySendTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/4/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MySendTableViewCell.h"
#import "ViewPlayViewController.h"
@implementation MySendTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (IBAction)MySendClick:(id)sender {
    [self.delegate edite:sender];
}
- (IBAction)reSendClick:(id)sender {
    [self.delegate resend:sender];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
