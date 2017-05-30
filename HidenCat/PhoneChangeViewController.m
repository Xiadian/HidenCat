

//
//  PhoneChangeViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/7.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "PhoneChangeViewController.h"

@interface PhoneChangeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *getNumber;
@property(strong,nonatomic)NSTimer *timer;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property(nonatomic,assign)NSInteger secend;
@end
@implementation PhoneChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.secend=60;
    self.navigationItem.title=self.registTitle;
    self.getNumber.layer.cornerRadius=5;
    self.getNumber.clipsToBounds=YES;
    self.btnNext.layer.cornerRadius=10;
    self.btnNext.clipsToBounds=YES;
    self.view.backgroundColor=[UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textDentify resignFirstResponder];
    [self.textPhone resignFirstResponder];
}
- (IBAction)nextStep:(UIButton *)sender {
    if ([TextChecker checkTelNumber:self.textPhone.text]) {
    }
    else{
       [ProgressHUD showError:@"请输入手机号"];
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=NO;
}
- (IBAction)getVerifyCode:(UIButton *)sender {
     self.getNumber.titleLabel.text=[NSString stringWithFormat:@"%zds",self.secend];
       self.timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeSecond:) userInfo:nil repeats:YES];
    AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
    NSDictionary *dic=@{@"data":@"18500268948"};
    [manager POST:@"http://192.168.0.112:8080/tachbang/user/SendMessageCode.app" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"%@",responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"错误%@",error);
            }];
}
- (IBAction)nextBtn:(UIButton *)sender {
//        AFHTTPSessionManager *manager =[AFHTTPSessionManager manager];
//        NSString *pwd=[MD5Encryption md5by32:@"123456"];
//        NSString *phone=_textPhone.text;
//         NSString *code=_textDentify.text;
//        NSString *data=[MyEncryption Encryption:@{@"code":code,@"phone":phone,@"pwd":pwd}];
//        NSDictionary *dic=@{@"data":data};
//        [manager POST:@"http://192.168.0.112:8080/tachbang/user/Register.app" parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
//        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            if ([responseObject allKeys].count>1) {
//                NSLog(@"%@",responseObject);
//            }
//            else{
//                NSLog(@"登陆失败");
//            }
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"错误%@",error);
//        }];
}
-(void)changeSecond:(NSTimer *)timer{
    self.secend--;
    if (self.secend<0) {
        self.secend=60;
        [self.timer invalidate];
        self.getNumber.userInteractionEnabled=YES;
         [self.getNumber setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
    }
    else{
        self.getNumber.userInteractionEnabled=NO;
        [self.getNumber setTitle:[NSString stringWithFormat:@"%zds",self.secend] forState:UIControlStateNormal];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    [self.timer invalidate];
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
