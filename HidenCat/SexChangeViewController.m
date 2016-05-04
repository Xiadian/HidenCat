//
//  SexChangeViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "SexChangeViewController.h"

@interface SexChangeViewController ()

@end

@implementation SexChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"选择性别";
    //为男的值为1 则不让隐藏 取非
     self.topTureImg.hidden=!self.sex;
    self.buttonTureImg.hidden=self.sex;
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(dd)];
    btnBack.imageInsets=UIEdgeInsetsMake(8, 8, 8, 8);
    self.navigationItem.rightBarButtonItem=btnBack;
    self.view.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dd{
    NSString *sex=self.topTureImg.hidden?@"女":@"男";
    self.SexBlock(sex);
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)sexBoyClick:(UIButton *)sender {
    self.topTureImg.hidden=NO;
    self.buttonTureImg.hidden=YES;
}
- (IBAction)sexGirlClick:(UIButton *)sender {
    self.topTureImg.hidden=YES;
    self.buttonTureImg.hidden=NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
