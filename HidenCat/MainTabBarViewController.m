//
//  MainTabBarViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/3/21.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HidenCatViewController.h"
@interface MainTabBarViewController ()
@property(nonatomic,assign)BOOL first;
@end
@implementation MainTabBarViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.first=YES;
    self.btnClick=NO;
    [self config];
   
}
-(void)config{
    if (self.first) {
    NSDictionary * textTabOne = @{
                                      NSFontAttributeName : [UIFont systemFontOfSize:14],
                                      NSForegroundColorAttributeName : [UIColor lightGrayColor]
                                    };
    NSDictionary * textTabTwo = @{
                                      NSFontAttributeName : [UIFont systemFontOfSize:14],
                                      NSForegroundColorAttributeName : [UIColor colorWithRed:255/255.0 green:75/255.0 blue:76/255.0 alpha:1]
                                      
                                      };
        // Do any additional setup after loading the view.
        for (UITabBarItem *item in self.tabBar.items) {
            item.imageInsets=UIEdgeInsetsMake(-4, 0, 4, 0);
            [item setTitlePositionAdjustment:UIOffsetMake(0, -4)];
        }
        self.tabBar.layer.shadowColor=[UIColor lightGrayColor].CGColor;
        self.tabBar.layer.shadowRadius=10;
        self.tabBar.layer.shadowOpacity=1;
    [[UITabBarItem appearance] setTitleTextAttributes:textTabOne forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:textTabTwo forState:UIControlStateSelected];
    UIButton *btn=[[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:@"centerOne"] forState:UIControlStateNormal];
    btn.center=CGPointMake([UIScreen mainScreen].bounds.size.width/2.0,19);
    btn.bounds=CGRectMake(0,0,60,60);
    [self.tabBar addSubview:btn];
    self.tabBar.tintColor=[UIColor colorWithRed:255/255.0 green:75/255.0 blue:76/255.0 alpha:1];
    [btn addTarget:self action:@selector(CenterButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    self.first=0;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)CenterButtonClick:(UIButton*)sender{
    
    if (self.btnClick==0) {
    [UIView animateWithDuration:0.3 animations:^{
        CATransform3D t=sender.layer.transform;
        sender.layer.transform=CATransform3DRotate(t, M_PI_2, 0, 0, 1);
    } completion:^(BOOL finished) {
        [sender setBackgroundImage:[UIImage imageNamed:@"centerTwo"] forState:UIControlStateNormal];
         self.originNumber=self.selectedIndex;
         self.selectedIndex=2;
        self.btnClick=1;
     
    }];
    }
    else{
        self.selectedIndex=self.originNumber;
        self.btnClick=0;
    }
}
@end
