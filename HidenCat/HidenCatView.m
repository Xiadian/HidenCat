//
//  HidenCatView.m
//  HidenCat
//
//  Created by XiaDian on 16/4/5.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "HidenCatView.h"
@implementation HidenCatView
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.saveBtn addTarget:self action:@selector(btnLong:) forControlEvents:UIControlEventTouchDown];
    [self.saveBtn addTarget:self action:@selector(endMove:) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside];
    [self.saveBtn setBackgroundImage:[UIImage imageNamed:@"shoot_1"] forState:UIControlStateHighlighted];
}
-(void)endMove:(UIButton *)btn{
    [self.delegate saveEnd:btn];
      [self.saveBtn setBackgroundImage:[UIImage imageNamed:@"shoot_2"] forState:UIControlStateNormal];
}
-(void)btnLong:(UILongPressGestureRecognizer *)lon{
    NSLog(@"长按");
     [self.saveBtn setBackgroundImage:[UIImage imageNamed:@"shoot_1"] forState:UIControlStateNormal];
     [self.delegate play];
}
@end
