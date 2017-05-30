//
//  XDGetFilePath.m
//  HidenCat
//
//  Created by XiaDian on 16/4/1.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "XDGetFilePath.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@implementation XDGetFilePath
+ (NSString *)getSavePathWithFileSuffix:(NSString *)suffix
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths objectAtIndex:0];
    NSDate *date = [NSDate date];
    //获取当前时间
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyyMMddHHmmss"];
    NSString *curretDateAndTime = [dateFormat stringFromDate:date];
    //获取用户userID
  //  NSDictionary *userDic= [[NSUserDefaults standardUserDefaults] objectForKey:UserInformation];
    //命名文件
  //  NSString *fileName = [NSString stringWithFormat:@"%@%@.%@",userDic[@"UserID"],curretDateAndTime,suffix];
    NSString *fileName = [NSString stringWithFormat:@"%@.%@",curretDateAndTime,suffix];
    //指定文件存储路径
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    return filePath;
}
//获取视屏截图
+ (UIImage *)getVideoThumbnailWithFilePath:(NSString *)filePath
{
    NSURL *url=[[NSURL alloc]initFileURLWithPath:filePath];
    AVURLAsset *urlAsset = [[AVURLAsset alloc] initWithURL:url options:nil];
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:urlAsset];
    imageGenerator.appliesPreferredTrackTransform = YES;    // 截图的时候调整到正确的方向
    CMTime time = CMTimeMakeWithSeconds(1.0, 30);   // 1.0为截取视频1.0秒处的图片，30为每秒30帧
    CGImageRef cgImage = [imageGenerator copyCGImageAtTime:time actualTime:nil error:nil];
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);

    return image;
}
+ (UIImage *)getImage:(NSString *)filePath
{
    NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    AVURLAsset *urlAsset = [[AVURLAsset alloc] initWithURL:url options:options];
    AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
    generator.appliesPreferredTrackTransform = YES;
    generator.maximumSize = CGSizeMake(60, 60);
    CGImageRef imageRef = [generator copyCGImageAtTime:CMTimeMake(10, 10) actualTime:NULL error:nil];
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    return image;
}

@end
