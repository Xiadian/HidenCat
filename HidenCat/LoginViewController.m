//
//  LoginViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/19.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "LoginViewController.h"
#import "MainTabBarViewController.h"
#import <ShareSDK/ShareSDK.h>
#import "PhoneChangeViewController.h"
@interface LoginViewController ()
@property (strong, nonatomic) UIView *midFrontView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getMidView];
    [self keyBoard];
}
-(void)keyBoard{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardShow:) name:UIKeyboardWillShowNotification  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardhide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark-keyboard
-(void)keyBoardhide:(NSNotification *)noti{
    CGFloat duration=[[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        self.midViewTop.constant=-20.0f;
        [self.view layoutIfNeeded];
    } completion:nil];
}
-(void)keyBoardShow:(NSNotification *)noti{
    if (self.midViewTop.constant<-20) {
    }
    else{
    CGFloat height=[[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    CGFloat  duration=[[noti.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:duration animations:^{
        self.midViewTop.constant-=height-self.buttomView.bounds.size.height;
        [self.view layoutIfNeeded];
    } completion:nil];
    }
}
-(void)getMidView{
    self.midFrontView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XDSW+10,self.midView.bounds.size.height )];
    self.midFrontView.backgroundColor=[UIColor whiteColor];
    
    UIButton *getLogin=[[UIButton alloc]initWithFrame:CGRectMake(0, 0,XDSW+10,self.midFrontView.bounds.size.height/3.0)];
    getLogin.backgroundColor=XDREDColor;
    [getLogin setImage:[UIImage imageNamed:@"user"] forState:UIControlStateNormal];
    [getLogin setTitle:@"已有账号登陆" forState:UIControlStateNormal];
    [getLogin addTarget:self action:@selector(removeMe:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *registerLogin=[[UIButton alloc]initWithFrame:CGRectMake(0, self.midFrontView.bounds.size.height/3.0,XDSW+10, self.midFrontView.bounds.size.height/3.0)];
    registerLogin.backgroundColor=[XDREDColor colorWithAlphaComponent:0.8];
    [registerLogin setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    [registerLogin setTitle:@"手机号注册" forState:UIControlStateNormal];
    [registerLogin addTarget:self action:@selector(resigster:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.midFrontView addSubview:getLogin];
    [self.midFrontView addSubview:registerLogin];
    [self.midView addSubview:self.midFrontView];
    [self.midView bringSubviewToFront:self.midFrontView];
}
-(void)removeMe:(UIButton *)btn{
    [self.midFrontView removeFromSuperview];
}
-(void)resigster:(UIButton *)btn{
    PhoneChangeViewController *pcV=[[PhoneChangeViewController alloc]init];
    [self.navigationController pushViewController:pcV animated:YES];
}
- (IBAction)loginClick:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //由storyboard根据myView的storyBoardID来获取我们要切换的视图
    CATransition *ca=[[CATransition alloc]init];
    ca.type=@"rippleEffect";
    ca.duration=1.5;
    [self.view.window.layer addAnimation:ca forKey:nil];
    MainTabBarViewController *root = [story instantiateViewControllerWithIdentifier:@"tabbar"];
    [self presentViewController:root animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.phoneTxt resignFirstResponder];
    [self.keyTxt resignFirstResponder];

}
- (IBAction)weiboLogin:(id)sender {
    [ShareSDK getUserInfo:SSDKPlatformTypeSinaWeibo
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
             //由storyboard根据myView的storyBoardID来获取我们要切换的视图
             CATransition *ca=[[CATransition alloc]init];
             ca.type=@"rippleEffect";
             ca.duration=1.5;
             [self.view.window.layer addAnimation:ca forKey:nil];
             MainTabBarViewController *root = [story instantiateViewControllerWithIdentifier:@"tabbar"];
             [self presentViewController:root animated:YES completion:nil];
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
    
}
- (IBAction)weixinLogin:(id)sender {
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
             //由storyboard根据myView的storyBoardID来获取我们要切换的视图
             CATransition *ca=[[CATransition alloc]init];
             ca.type=@"rippleEffect";
             ca.duration=1.5;
             [self.view.window.layer addAnimation:ca forKey:nil];
             MainTabBarViewController *root = [story instantiateViewControllerWithIdentifier:@"tabbar"];
             [self presentViewController:root animated:YES completion:nil];
         }
         
         else
         {
             NSLog(@"%@",error);
         }
         
     }];
}
- (IBAction)qqLogin:(id)sender {
    [ShareSDK getUserInfo:SSDKPlatformTypeQQ
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
             //由storyboard根据myView的storyBoardID来获取我们要切换的视图
             CATransition *ca=[[CATransition alloc]init];
             ca.type=@"rippleEffect";
             ca.duration=1.5;
             [self.view.window.layer addAnimation:ca forKey:nil];
             MainTabBarViewController *root = [story instantiateViewControllerWithIdentifier:@"tabbar"];
             [self presentViewController:root animated:YES completion:nil];
         }
         else
         {
             NSLog(@"%@",error);
         }
     }];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
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
