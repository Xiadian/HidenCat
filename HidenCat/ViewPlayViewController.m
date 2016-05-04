//
//  ViewPlayViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/6.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "ViewPlayViewController.h"
@interface ViewPlayViewController ()

@end

@implementation ViewPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"发布内容";
    [self getScrollViewImg];
    [self config];
}
-(void)getScrollViewImg{
   self.midScrollView.contentSize=CGSizeMake(5+(self.midScrollView.frame.size.height-10+5)*6,self.midScrollView.bounds.size.height);
    for (int i=0; i<6;i++ ) {
        UIImageView *vv=[[UIImageView alloc]initWithFrame:CGRectMake(5+(self.midScrollView.frame.size.height-10+5)*i, 0, self.midScrollView.frame.size.height-10, self.midScrollView.frame.size.height-10)];
        [vv sd_setImageWithURL:[NSURL URLWithString:@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg"]];
        [self.midScrollView addSubview:vv];
    }
}
//基本配置
-(void)config{
    self.mainScrollView.bounces=NO;
    self.saleNoForYes.on=NO;
    self.saleView.hidden=YES;
    [self.saleNoForYes addTarget:self action:@selector(isOn:) forControlEvents:UIControlEventValueChanged];
}
-(void)isOn:(UISwitch *)sw{
    if (sw.isOn==YES) {
        self.saleView.hidden=NO;
        [self scrollsToBottomAnimated:YES];
    }
    else{
        self.saleView.hidden=YES;
    }
}
- (void)scrollsToBottomAnimated:(BOOL)animated
{
    CGFloat offset = self.mainScrollView.contentSize.height - self.mainScrollView.bounds.size.height;
    if (offset > 0)
    {
        [self.mainScrollView setContentOffset:CGPointMake(0, offset) animated:animated];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
