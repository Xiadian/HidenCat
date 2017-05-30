
//
//  FindTableViewCell.m
//  HidenCat
//
//  Created by XiaDian on 16/3/23.
//  Copyright © 2016年 vdchina. All rights reserved.
//
#import "FindTableViewCell.h"
@implementation FindTableViewCell
- (void)awakeFromNib {
    // Initialization code
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(play)];
    UITapGestureRecognizer *tat=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(detail)];
    UITapGestureRecognizer *tab=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(detail)];
    [self.buttomView addGestureRecognizer:tab];
    [self.topview addGestureRecognizer:tat];
    [self.imgeView addGestureRecognizer:tap];
    self.focusBtn.layer.cornerRadius=15;
    self.focusBtn.clipsToBounds=YES;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (IBAction)focus:(id)sender {
    [self.delegate focusOn:sender];
}
-(void)detail{
    [self.delegate pushTodetail];
}
-(void)play{
   [self.delegate playVideoWithIN:self];
}
- (IBAction)PlayClick:(UIButton *)sender {
   [self.delegate playVideoWithIN:self];
}
@end
