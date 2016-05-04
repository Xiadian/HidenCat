//
//  NameChangeViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface NameChangeViewController : DetailBaseViewController
@property(nonatomic,strong)void(^nameBlock)(NSString *name);
@property(nonatomic,strong)NSString *name;
@end
