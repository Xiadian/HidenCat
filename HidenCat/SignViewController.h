//
//  SignViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface SignViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UILabel *numberCount;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property(nonatomic,strong)void(^signBlock)(NSString *sign);
@property(nonatomic,strong)NSString *sign;
@end
