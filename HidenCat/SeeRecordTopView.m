//
//  SeeRecordTopView.m
//  HidenCat
//
//  Created by XiaDian on 16/4/6.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "SeeRecordTopView.h"

@implementation SeeRecordTopView


// Only override drawRect: if you perform custom drawing.
 //An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.iconBtn.layer.cornerRadius=25;
    self.iconBtn.clipsToBounds=YES;
    [self.iconBtn setBackgroundImage:[UIImage imageNamed:@"find_headeimg"] forState:UIControlStateNormal];
}


@end
