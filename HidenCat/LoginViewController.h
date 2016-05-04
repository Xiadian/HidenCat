//
//  LoginViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/19.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *phoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *keyTxt;
@property (weak, nonatomic) IBOutlet UIView *midView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midViewBottum;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *midViewTop;
@property (weak, nonatomic) IBOutlet UIView *buttomView;
@end
