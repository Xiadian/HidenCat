//
//  GetIdentifyViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/13.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "GetIdentifyViewController.h"
#import "BDImagePicker.h"
@interface GetIdentifyViewController ()

@end

@implementation GetIdentifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.identifyBackbtn.layer.cornerRadius=10;
    self.identifyBackbtn.clipsToBounds=YES;
    self.identifyFacebtn.layer.cornerRadius=10;
    self.identifyFacebtn.clipsToBounds=YES;
    self.sureBtn.layer.cornerRadius=10;
    self.sureBtn.clipsToBounds=YES;
    self.navigationItem.title=@"申请认证";
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(dd)];
    btnBack.imageInsets=UIEdgeInsetsMake(8, 8, 8, 8);
    self.navigationItem.rightBarButtonItem=btnBack;
    // Do any additional setup after loading the view from its nib.
}
-(void)dd{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)identifyFaceClick:(id)sender {
    [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
        if (image) {
            [self.identifyFacebtn setTitle:@"" forState:UIControlStateNormal];
            [self.identifyFacebtn setBackgroundImage:image forState:UIControlStateNormal];
        }
    }];

}
- (IBAction)identifyBackClick:(id)sender {
    [BDImagePicker showImagePickerFromViewController:self allowsEditing:YES finishAction:^(UIImage *image) {
        if (image) {
            [self.identifyBackbtn setTitle:@"" forState:UIControlStateNormal];
            [self.identifyBackbtn setBackgroundImage:image forState:UIControlStateNormal];
        }
    }];
}
- (IBAction)sureBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
