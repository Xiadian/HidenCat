//
//  BuyHeadView.m
//  HidenCat
//
//  Created by XiaDian on 16/4/8.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "BuyHeadView.h"

@implementation BuyHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
- (IBAction)buyClick:(id)sender {
    [self.delegate buyClick:sender];
}

@end
