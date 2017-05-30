//
//  ViewPlayViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/6.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "ViewPlayViewController.h"
@interface ViewPlayViewController ()<UITextViewDelegate,UITextFieldDelegate>

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
    self.mainScrollView.delegate=self;
   self.midScrollView.contentSize=CGSizeMake(5+(self.midScrollView.frame.size.height-10+5)*6,self.midScrollView.bounds.size.height);
    for (int i=0; i<6;i++ ) {
        UIImageView *vv=[[UIImageView alloc]initWithFrame:CGRectMake(5+(self.midScrollView.frame.size.height-10+5)*i, 0, self.midScrollView.frame.size.height-10, self.midScrollView.frame.size.height-10)];
        vv.image=self.img;
//  [vv sd_setImageWithURL:[NSURL URLWithString:@"https://img.alicdn.com/bao/uploaded/i2/TB1OgyxJVXXXXaWXFXXXXXXXXXX_!!0-item_pic.jpg_430x430q90.jpg"]];
        [self.midScrollView addSubview:vv];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.view endEditing:YES];
}
//基本配置
-(void)config{
    self.mainScrollView.bounces=NO;
    self.saleNoForYes.on=NO;
    self.saleView.hidden=YES;
    self.titleText.delegate=self;
    self.titleText.returnKeyType=UIReturnKeyDone;
    [self.saleNoForYes addTarget:self action:@selector(isOn:) forControlEvents:UIControlEventValueChanged];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}
-(void)isOn:(UISwitch *)sw{
    [self.titleText resignFirstResponder
     ];
    [self.contentText resignFirstResponder];
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@",@"按了");
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
