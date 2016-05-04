//
//  OneRecordViewConroller.m
//  HidenCat
//
//  Created by XiaDian on 16/4/26.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "OneRecordViewConroller.h"

@interface OneRecordViewConroller ()

@end

@implementation OneRecordViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"记录";
    self.view.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];

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
