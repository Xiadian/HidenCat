//
//  TalkPriceView.m
//  HidenCat
//
//  Created by XiaDian on 16/4/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "TalkPriceView.h"

@implementation TalkPriceView
- (IBAction)sureClick:(UIButton *)sender {
     [self.delegate srue:sender];
}
- (IBAction)canelClick:(UIButton *)sender {
     [self.delegate chanel:sender];
}

@end
