
//
//  NameChangeViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "NameChangeViewController.h"

@interface NameChangeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation NameChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"修改昵称";
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(dd)];
    btnBack.imageInsets=UIEdgeInsetsMake(8, 8, 8, 8);
    self.navigationItem.rightBarButtonItem=btnBack;
    self.view.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    self.textField.text=self.name;
}
-(void)dd{
     self.nameBlock(self.textField.text);
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
