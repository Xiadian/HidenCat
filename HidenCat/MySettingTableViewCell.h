//
//  MySettingTableViewCell.h
//  HidenCat
//
//  Created by XiaDian on 16/3/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MySettingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titieLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imgHeight;
@end
