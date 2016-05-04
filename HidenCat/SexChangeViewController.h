//
//  SexChangeViewController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface SexChangeViewController : DetailBaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *topTureImg;
@property (weak, nonatomic) IBOutlet UIImageView *buttonTureImg;
@property(nonatomic,strong)void(^SexBlock)(NSString *sex);
@property(nonatomic,assign)BOOL sex;
@end
