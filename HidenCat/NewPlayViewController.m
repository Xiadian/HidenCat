//
//  NewPlayViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/5.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "NewPlayViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "HidenCatView.h"
#import "XDGetFilePath.h"
#import "ViewPlayViewController.h"
@interface NewPlayViewController ()<AVCaptureFileOutputRecordingDelegate,HidenCatDelegate>
@property(strong,nonatomic)AVCaptureMovieFileOutput *output;
@property(strong,nonatomic)UIView *top;
@property(strong,nonatomic)UIImage *ScreenImg;
@property(strong,nonatomic)NSString *vidioPath;

@property(assign,nonatomic)NSInteger second;
@property (strong,nonatomic) AVCaptureSession *captureSession;//负责输入和输出设备之间的数据传递
@property (strong,nonatomic) AVCaptureDeviceInput *captureDeviceInput;//负责从AVCaptureDevice获得输入数据
@property(nonatomic,strong)UIView *backView;
@property (strong,nonatomic) AVCaptureStillImageOutput *captureStillImageOutput;//照片输出流
@property (strong,nonatomic) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;//相机拍摄预览图层
@end

@implementation NewPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    self.second=0.0;
    self.navigationController.navigationBar.hidden=NO;
    [UIApplication sharedApplication].statusBarHidden=YES;
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    //2.初始化一个摄像头输入设备(first是后置摄像头，last是前置摄像头)
    AVCaptureDeviceInput *inputVideo = [AVCaptureDeviceInput deviceInputWithDevice:[devices firstObject] error:NULL];
    //3.创建麦克风设备
    AVCaptureDevice *deviceAudio = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
    //4.初始化麦克风输入设备
    AVCaptureDeviceInput *inputAudio = [AVCaptureDeviceInput deviceInputWithDevice:deviceAudio error:NULL];
    //　二，初始化视频文件输出
    //5.初始化一个movie的文件输出
    AVCaptureMovieFileOutput *output =[[AVCaptureMovieFileOutput alloc]init];
    self.output = output;
    AVCaptureSession *session =[[AVCaptureSession alloc]init];
    if ([session canAddInput:inputVideo]) {
        [session addInput:inputVideo];}
    if ([session canAddInput:inputAudio]) {
        [session addInput:inputAudio];}
    if ([session canAddOutput:output]) {[session addOutput:output];}
    AVCaptureVideoPreviewLayer *preLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
    preLayer.frame =CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width,[UIScreen mainScreen].bounds.size.height*2/3.0);
    preLayer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:preLayer];
    [session startRunning];
    self.top=[[UIView alloc]initWithFrame:CGRectMake(0, 0,0, 50)];
    _top.backgroundColor=[UIColor redColor];
    UIView *vv=[[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*2/3.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/3.0)];
    vv.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:vv];
    [vv addSubview:_top];
    NSArray *arr=[[NSBundle mainBundle]loadNibNamed:@"HidenCatView" owner:self options:nil];
    HidenCatView *v=arr[0];
    v.delegate=self;
    v.frame=CGRectMake(0,10,XDSW, XDSH/3.0-10);
    [vv addSubview:v];
}
-(void)play{
  //判断是否在录制,如果在录制，就停止，并设置按钮title
    if ([self.output isRecording]) {
        [self.output stopRecording];
    }
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"myVidio.mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.vidioPath=path;
    [self.output startRecordingToOutputFileURL:url recordingDelegate:self];
    [UIView animateWithDuration:8 animations:^{
        self.top.frame=CGRectMake(0,0,XDSW,50);
    } completion:^(BOOL finished) {
        if (self.navigationController.viewControllers.count==2) {
            UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XDSW, XDSH)];
            view.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
            view.userInteractionEnabled=NO;
            [self.view addSubview:view];
            [ProgressHUD show:@"正在合成视频..."];
             [self.output stopRecording];
        }
    }];
}
-(void)saveEnd:(UIButton *)btn{
   // NSLog(@"松手%d",[self.output isRecording]);
    self.backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, XDSW, XDSH)];
     self.backView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.6];
     self.backView.userInteractionEnabled=NO;
    [self.view addSubview: self.backView];
    [ProgressHUD show:@"正在合成视频..."];
    self.top.frame=CGRectMake(0,0,0,50);
    [self.output stopRecording];
}
//拍摄完成回调
- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error{
    ALAssetsLibrary *assetsLibrary=[[ALAssetsLibrary alloc]init];
       [assetsLibrary writeVideoAtPathToSavedPhotosAlbum:outputFileURL completionBlock:^(NSURL *assetURL, NSError *error) {
        if (error) {
           // NSLog(@"保存视频到相簿过程中发生错误，错误信息：%@",error.localizedDescription);
        }else{
            [self.backView removeFromSuperview];
            [ProgressHUD dismiss];
            UIImage * image=[XDGetFilePath getVideoThumbnailWithFilePath:self.vidioPath];
            ViewPlayViewController *vv=[[ViewPlayViewController alloc]init];
            vv.img=image;
            [self.navigationController pushViewController:vv animated:YES];
          //  NSLog(@"成功保存视频到相簿.");
        }
    }];
}


@end
