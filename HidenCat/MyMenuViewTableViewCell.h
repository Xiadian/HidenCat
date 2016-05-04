//
//  MyMenuViewTableViewCell.h
//  HidenCat
//
//  Created by XiaDian on 16/5/4.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyMenuViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *iconView;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;
@property (weak, nonatomic) IBOutlet UILabel *weekLab;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@end
