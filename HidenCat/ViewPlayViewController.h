//
//  ViewPlayViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/6.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"
//发布内容页
@interface ViewPlayViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UISwitch *saleNoForYes;
@property (weak, nonatomic) IBOutlet UIView *saleView;
@property (weak, nonatomic) IBOutlet UIScrollView *midScrollView;

@end
