
//
//  UIImage+XDUIImage_giveMeStr.m
//  HidenCat
//
//  Created by XiaDian on 16/3/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "UIImage+XDUIImage_giveMeStr.h"

@implementation UIImage (XDUIImage_giveMeStr)
-(UIImage *)XD_giveMeStr:(NSString *)str{
     UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    [str drawInRect:CGRectMake(0, 0, 200, 200) withAttributes:nil];
    UIImage * img = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsEndImageContext();
    return  img;
}
@end
