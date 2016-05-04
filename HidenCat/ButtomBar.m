

//
//  ButtomBar.m
//  HidenCat
//
//  Created by XiaDian on 16/3/31.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "ButtomBar.h"

@implementation ButtomBar


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    self.favoriteClickState=NO;
//    self.zanClickState=NO;
}
- (IBAction)changePrice:(UIButton *)sender {
    [self.delegate changePrice:sender];
}
- (IBAction)Buy:(UIButton *)sender {
    [self.delegate Buy:sender];
}
- (IBAction)favoriteClick:(UIButton *)sender {
    [self.delegate favoriteClick:sender];
//    UIImage *img=self.favoriteClickState?[UIImage imageNamed:@"cang_cang"]:[UIImage imageNamed:@"cang_cang_1"];
//    [sender setBackgroundImage:img forState:UIControlStateNormal];
//    self.favoriteClickState=!self.favoriteClickState;
}
- (IBAction)shareClick:(id)sender{
    [self.delegate shareClick:sender];
}
- (IBAction)comment:(id)sender {
    [self.delegate comment:sender];
}
- (IBAction)zanClick:(UIButton *)sender {
    [self.delegate zanClick:sender];
//    UIImage *img=self.zanClickState?[UIImage imageNamed:@"cang_zan"]:[UIImage imageNamed:@"cang_zan_1"];
//    [sender setBackgroundImage:img forState:UIControlStateNormal];
//    self.zanClickState=!self.zanClickState;
}


@end
