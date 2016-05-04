



//
//  BaseViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "BaseViewController.h"
#import "MyNewsController.h"
#import "SearchViewController.h"
@interface BaseViewController ()
@end
@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self deleteLine];
    [self addBtn];
    // Do any additional setup after loading the view.
}
-(void)deleteLine{
    for (UIView *view in self.tabBarController.tabBar.subviews) {
        if ([view isKindOfClass:[UIImageView class]] && view.bounds.size.height <= 1) {
            UIImageView *ima = (UIImageView *)view;
            ima.hidden = YES;
        }
    }
}
-(void)addBtn{
    UIBarButtonItem *btn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"seach_s"] style:UIBarButtonItemStylePlain target:self action:@selector(SearchClick:)];
    btn.imageInsets=UIEdgeInsetsMake(7, 7, 7, 7);
    self.navigationItem.rightBarButtonItem=btn;
    UIBarButtonItem *btnLeft=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"my01_30"] style:UIBarButtonItemStylePlain target:self action:@selector(MyNews:)];
    btnLeft.imageInsets=UIEdgeInsetsMake(15,0,15,30);
    self.navigationItem.leftBarButtonItem=btnLeft;
    self.navigationController.navigationBar.tintColor=[UIColor whiteColor];
}
-(void)MyNews:(UIBarButtonItem *)btn{
    MyNewsController *mn=[[MyNewsController alloc]init];
    mn.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:mn animated:YES];
}
-(void)SearchClick:(UIBarButtonItem *)btn{
    SearchViewController *mn=[[SearchViewController alloc]init];
    mn.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:mn animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
