//
//  MyOrderViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/3/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface MyOrderViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UILabel *myBuyLB;

@property (weak, nonatomic) IBOutlet UILabel *mySaleLB;
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end
