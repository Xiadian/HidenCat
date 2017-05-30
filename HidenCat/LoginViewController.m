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
#import "VDNetRequest.h"
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
    [self ceshiJiaMi];
//    //获取文件路径
//    NSError*error;
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"json"ofType:@"json"];
//    //根据文件路径读取数据
//    NSData *data = [[NSData alloc]initWithContentsOfFile:filePath];
//    //格式化成json数据
//    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
//    NSLog(@"%@",[jsonObject class]);
    
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
    pcV.registTitle=@"注册";
    [self.navigationController pushViewController:pcV animated:YES];
}
#pragma mark 登陆加密
-(void)ceshiJiaMi{
}
- (IBAction)loginClick:(id)sender {
//    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
//    NSString *pwd=[MD5Encryption md5by32:_keyTxt.text];
//    NSString *usrID=_phoneTxt.text;
//    NSString *str=[MyEncryption Encryption:@{@"phone":usrID,@"pwd":pwd}];
//    NSDictionary *dic=@{@"data":str,@"versions":@"1.0"};
//    [manager POST:@"http://192.168.0.112:8080/tachbang/user/login.app" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if ([responseObject allKeys].count>1) {
//            NSDictionary *dic=[MyEncryption DeEncryption:responseObject];
//            NSLog(@"%@",dic);
//            UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//            MainTabBarViewController *root = [story instantiateViewControllerWithIdentifier:@"tabbar"];
//            [self presentViewController:root animated:YES completion:nil];
//        }
//        else{
//            NSLog(@"登陆失败");
//        
//        }
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"错误%@",error);
//    }];
    /**
     *  /测试传图片
     */
//    [VDNetRequest VD_UploadImageWithURL:@"http://192.168.0.112:8080/tachbang/uploading/userPortraitImg.html" arrtribute:@{VDHTTPIMAGE:[UIImage imageNamed:@"cang_cang.jpg"]} finish:^(NSURLSessionDataTask *task, id responseObject, NSError *error) {
//        if (responseObject) {
//            NSLog(@"%@",responseObject);
//        }else{
//            NSLog(@"%@",error);
//        }
//    }];
    //http://192.168.0.112:8080/tachbang/uploading/userPortraitImg.html
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    CATransition *ca=[[CATransition alloc]init];
    ca.duration=1.5;
    ca.subtype=@"fromRight";
    ca.type=@"MoveIn";
    [self.view.window.layer addAnimation:ca forKey:nil];
    MainTabBarViewController *root = [story instantiateViewControllerWithIdentifier:@"tabbar"];
    [self presentViewController:root animated:NO completion:nil];
    //af上传
//    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://example.com/upload" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"file://path/to/image.jpg"] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
//    } error:nil];
//    
//    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//    
//    NSURLSessionUploadTask *uploadTask;
//    uploadTask = [manager
//                  uploadTaskWithStreamedRequest:request
//                  progress:^(NSProgress * _Nonnull uploadProgress) {
//                      // This is not called back on the main queue.
//                      // You are responsible for dispatching to the main queue for UI updates
//                      dispatch_async(dispatch_get_main_queue(), ^{
//                          //Update the progress view
//                         // [progressView setProgress:uploadProgress.fractionCompleted];
//                      });
//                  }
//                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//                      if (error) {
//                          NSLog(@"Error: %@", error);
//                      } else {
//                          NSLog(@"%@ %@", response, responseObject);
//                      }
//                  }];
//    
//    [uploadTask resume];
}
#pragma mark 三方登陆
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
