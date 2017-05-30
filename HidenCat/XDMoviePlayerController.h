//
//  XDMoviePlayerController.h
//  HidenCat
//
//  Created by XiaDian on 16/4/6.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import <Foundation/Foundation.h>

@interface XDMoviePlayerController : NSObject
{
    NSArray *_arr;
}
@property(nonatomic,strong)MPMoviePlayerController *player;
-(instancetype)initGetVidieoWithUrl:(NSString *)url andContentView:(UIView *)view andContentCGrect:(CGRect)frame;
-(void)StarPlay;
-(void)stopPlay;
@end
