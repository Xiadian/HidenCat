//
//  QRViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/22.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "QRViewController.h"
#import "QRCodeGenerator.h"
#import <ShareSDK/ShareSDK.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface QRViewController ()

@end

@implementation QRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"我的二维码";
    self.view.backgroundColor=[UIColor colorWithRed:239/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    self.qrImageView.image=[QRCodeGenerator qrImageForString:@"二维嘛" imageSize:self.qrImageView.frame.size.width];
    self.saveLocBtn.layer.cornerRadius=10;
    self.shareQRBtn.layer.cornerRadius=10;
    self.iconView.hidden=YES;
    self.selectBtn.on=NO;
}
- (IBAction)appera:(UISwitch *)sender{
    self.iconView.hidden=!self.iconView.hidden;
    
}
//分享
- (IBAction)shareClick:(id)sender {
    //1、创建分享参数
    //  NSArray* imageArray = @[[UIImage imageNamed:@"shareImg.png"]];
    // （注意：图片必须要在Xcode左边目录里面，名称必须要传正确，如果要分享网络图片，可以这样传iamge参数 images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]）
    //if (imageArray) {
    
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
    [shareParams SSDKSetupShareParamsByText:@"分享内容"
                                     images:@[@"http://mob.com/Assets/images/logo.png?v=20150320"]
                                        url:[NSURL URLWithString:@"http://mob.com"]
                                      title:@"分享标题"
                                       type:SSDKContentTypeAuto];
    //2、分享（可以弹出我们的分享菜单和编辑界面）
    [ShareSDK showShareActionSheet:nil //要显示菜单的视图, iPad版中此参数作为弹出菜单的参照视图，只有传这个才可以弹出我们的分享菜单，可以传分享的按钮对象或者自己创建小的view 对象，iPhone可以传nil不会影响
                             items:nil
                       shareParams:shareParams
               onShareStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error, BOOL end) {
                   
                   switch (state) {
                       case SSDKResponseStateSuccess:
                       {
                           UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"分享成功"
                                                                               message:nil
                                                                              delegate:nil
                                                                     cancelButtonTitle:@"确定"
                                                                     otherButtonTitles:nil];
                           [alertView show];
                           break;
                       }
                       case SSDKResponseStateFail:
                       {
                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"分享失败"
                                                                           message:[NSString stringWithFormat:@"%@",error]
                                                                          delegate:nil
                                                                 cancelButtonTitle:@"OK"
                                                                 otherButtonTitles:nil, nil];
                           [alert show];
                           break;
                       }
                       default:
                           break;
                   }
               }
     ];//}
}
//保存到本地
- (IBAction)saveLocClick:(id)sender {
     ALAssetsLibrary *assetsLibrary=[[ALAssetsLibrary alloc]init];
[assetsLibrary writeImageToSavedPhotosAlbum:self.qrImageView.image.CGImage orientation:ALAssetOrientationUp completionBlock:^(NSURL *assetURL, NSError *error) {
    [ProgressHUD showSuccess:@"保存图片成功"];
}];
    
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
