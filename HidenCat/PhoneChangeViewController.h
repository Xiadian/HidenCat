//
//  PhoneChangeViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface PhoneChangeViewController : DetailBaseViewController

@property (weak, nonatomic) IBOutlet UITextField *textPhone;
@property (weak, nonatomic) IBOutlet UITextField *textDentify;
@property(nonatomic,copy)NSString *registTitle;
@end
