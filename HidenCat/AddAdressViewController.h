//
//  AddAdressViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/22.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface AddAdressViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *getGoodTxt;
@property (weak, nonatomic) IBOutlet UITextField *phoneTxt;
@property(nonatomic,strong)NSString *navaTitle;
@property (weak, nonatomic) IBOutlet UITextField *detailTxt;
@property (weak, nonatomic) IBOutlet UIButton *adressBtn;
@end
