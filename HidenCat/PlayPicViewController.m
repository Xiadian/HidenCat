//
//  PlayPicViewController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/25.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "PlayPicViewController.h"
#import "PhotoBrowserView.h"
#import <MediaPlayer/MediaPlayer.h>
@interface PlayPicViewController ()
{
    MPMoviePlayerController *_player;
}
@property (nonatomic,strong) PhotoBrowserView *photoBrowserView;
@end

@implementation PlayPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.playUrl=@"http://7xrze4.com1.z0.glb.clouddn.com/CangMaoMaoQQ20160314112239.mp4";
    _photoBrowserView=[[PhotoBrowserView alloc]initWithFrame:self.view.bounds WithArray:self.picArr andCurrentIndex:self.imgTag-1 andVideoUrl:self.playUrl];
    [self.view addSubview:_photoBrowserView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if(self.photoBrowserView.photeView){
        if (self.photoBrowserView.photeView.player) {
            [self.photoBrowserView.photeView.player pause];
            [self.photoBrowserView.photeView.player.view removeFromSuperview];
            self.photoBrowserView.photeView.player=nil;
        }
    }
    _photoBrowserView=nil;
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
