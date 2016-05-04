//
//  XDGetFilePath.h
//  HidenCat
//
//  Created by XiaDian on 16/4/1.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDGetFilePath : NSObject
//获取要保存的本地文件路径
+ (NSString *)getSavePathWithFileSuffix:(NSString *)suffix;
//获取录像的缩略图
+ (UIImage *)getVideoThumbnailWithFilePath:(NSString *)filePath;
+ (UIImage *)getImage:(NSString *)filePath;
@end
