//
//  XDMoviePlayerController.m
//  HidenCat
//
//  Created by XiaDian on 16/4/6.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "XDMoviePlayerController.h"

@implementation XDMoviePlayerController

-(instancetype)initGetVidieoWithUrl:(NSString *)url andContentView:(UIView *)view andContentCGrect:(CGRect)frame{
    self = [super init];
    if (self) {
        NSURL *Viedeourl=[NSURL URLWithString:url];
        _player= [[MPMoviePlayerController alloc]initWithContentURL:Viedeourl];
        _player.controlStyle=MPMovieControlStyleDefault;
        _player.scalingMode=MPMovieScalingModeFill;
        _player.view.frame=frame;
        [view addSubview:_player.view];
        [_player prepareToPlay];
    }
    return self;
}
-(void)StarPlay{
    [_player play];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listenUp) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}
//视频播放结束通知
-(void)listenUp{
    if (_player) {
        [self stopPlay];
    }
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}
-(void)stopPlay{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    [_player pause];
    [_player.view removeFromSuperview];
    _player=nil;
}
@end
