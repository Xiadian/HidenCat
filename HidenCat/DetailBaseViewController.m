//
//  DetailBaseViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/25.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "DetailBaseViewController.h"

@interface DetailBaseViewController ()

@end

@implementation DetailBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
    self.view.backgroundColor=[UIColor whiteColor];
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"fanhui"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    btnBack.imageInsets=UIEdgeInsetsMake(8,-5,8,21);
    self.navigationItem.leftBarButtonItem=btnBack;
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            UIImageView *ima = (UIImageView *)view;
            ima.hidden = YES;
        }
    }
    NSArray *list=self.navigationController.navigationBar.subviews;
    for (id obj in list) {
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imageView=(UIImageView *)obj;
            NSArray *list2=imageView.subviews;
            for (id obj2 in list2) {
                if ([obj2 isKindOfClass:[UIImageView class]]) {
                    UIImageView *imageView2=(UIImageView *)obj2;
                    imageView2.hidden=YES;
                }
            }
        }
    }
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
    
    for (UIView *view in self.navigationController.navigationBar.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            UIImageView *ima = (UIImageView *)view;
            ima.hidden = YES;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
