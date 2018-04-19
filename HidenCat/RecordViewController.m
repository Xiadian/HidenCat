
//
//  RecordViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/31.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "RecordViewController.h"
#import "NewPlayViewController.h"
@interface RecordViewController ()
@end
@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title=@"我的发布";
}
- (IBAction)newPlay:(UIButton *)sender {
    NewPlayViewController *nv=[[NewPlayViewController alloc]init];
    [self.navigationController pushViewController:nv animated:YES];
    
}
@end
