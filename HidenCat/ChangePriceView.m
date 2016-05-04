//
//  ChangePriceView.m
//  HidenCat
//
//  Created by XiaDian on 16/4/8.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "ChangePriceView.h"

@implementation ChangePriceView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)sureClick:(id)sender {
    [self.delegate srue:sender];
}
- (IBAction)chanelClick:(id)sender {
    [self.delegate chanel:sender];
}

@end
