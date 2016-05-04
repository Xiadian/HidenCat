//
//  AddAdressViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/22.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "AddAdressViewController.h"
#import "CitySelectPickView.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
@interface AddAdressViewController ()<CitySelectDelegate,ABPeoplePickerNavigationControllerDelegate>
@property(nonatomic,strong)UIView *CityView;
@end

@implementation AddAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=self.navaTitle;
    self.view.backgroundColor=[UIColor colorWithRed:239/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    UIBarButtonItem *btnBack=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(dd)];
    btnBack.imageInsets=UIEdgeInsetsMake(8, 8, 8, 8);
    self.navigationItem.rightBarButtonItem=btnBack;
    // Do any additional setup after loading the view from its nib.
}
-(void)dd{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)adressClick:(id)sender {
    [sender becomeFirstResponder];
    [self.getGoodTxt resignFirstResponder];
    [self.phoneTxt resignFirstResponder];
    [self.detailTxt resignFirstResponder];
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"CitySelectPickView" owner:self                 options:nil];
    CitySelectPickView *citySelectView=arr[0];
    citySelectView.delegate=self;
    self.CityView=[[UIView alloc]initWithFrame:self.view.frame];
    self.CityView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];;
    citySelectView.frame=CGRectMake(0, XDSH-250,XDSW,250);
    [self.CityView addSubview:citySelectView];
    [self.view addSubview:self.CityView];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.getGoodTxt resignFirstResponder];
    [self.phoneTxt resignFirstResponder];
    [self.detailTxt resignFirstResponder];


}
- (IBAction)addConnectPerson:(UIButton *)sender {
    ABPeoplePickerNavigationController * vc = [[ABPeoplePickerNavigationController alloc] init];
    vc.peoplePickerDelegate = self;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    ABMultiValueRef valuesRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFIndex index = ABMultiValueGetIndexForIdentifier(valuesRef,identifier);
    //电话号码
    CFStringRef telValue = ABMultiValueCopyValueAtIndex(valuesRef,index);
    //第二种方法：全名    
    [self dismissViewControllerAnimated:YES completion:^{
        self.phoneTxt.text=(__bridge NSString *)telValue;
    }];
}
-(void)surClick:(UIButton *)sender getText:(NSString *)areaText{
    [self.adressBtn setTitle:areaText forState:UIControlStateNormal];
    [self.CityView removeFromSuperview];
}
-(void)canelClick:(UIButton *)sender{
    [self.CityView removeFromSuperview];
    
}
@end
