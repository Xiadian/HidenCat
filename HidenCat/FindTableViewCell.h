//
//  FindTableViewCell.h
//  HidenCat
//
//  Created by XiaDian on 16/3/23.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XDPlayView.h"
@protocol XDPlayDelegate<NSObject>
-(void)playVideoWithIN:(UITableViewCell *)cell;
-(void)pushTodetail;
-(void)focusOn:(UIButton *)btn;
@end
@interface FindTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *focusBtn;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIView *TopbackView;
@property (weak, nonatomic) IBOutlet XDPlayView *playView;
@property (weak, nonatomic) IBOutlet UIImageView *imgeView;
@property (weak, nonatomic) IBOutlet UIView *buttomView;
@property (weak, nonatomic) IBOutlet UIView *topview;
@property(nonatomic,strong)id <XDPlayDelegate>delegate;
@end
