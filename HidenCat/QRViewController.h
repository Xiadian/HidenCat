//
//  QRViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/22.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface QRViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@property (weak, nonatomic) IBOutlet UIButton *saveLocBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareQRBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UISwitch *selectBtn;
@end
