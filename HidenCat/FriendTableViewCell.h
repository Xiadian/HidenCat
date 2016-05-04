//
//  FriendTableViewCell.h
//  HidenCat
//
//  Created by XiaDian on 16/3/22.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *imageIcon;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@end
