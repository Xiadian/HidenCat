



//
//  ChangePassWordViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/5/3.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "ChangePassWordViewController.h"

@interface ChangePassWordViewController ()
@property (weak, nonatomic) IBOutlet UIView *backView;

@end

@implementation ChangePassWordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    self.backView.backgroundColor=[[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1]colorWithAlphaComponent:0.05];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sureCilck:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
