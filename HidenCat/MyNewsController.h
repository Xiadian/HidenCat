//
//  MyNewsController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface MyNewsController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UILabel *notification;
@property (weak, nonatomic) IBOutlet UILabel *systemNew;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end
