//
//  TextCheck.h
//  HidenCat
//
//  Created by XiaDian on 16/4/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//
#import <Foundation/Foundation.h>
@interface TextChecker : NSObject
/**
 *  判断是否是电话号
 *
 *  @param sender 需要进行判断的字符串
 *
 *  @return 布尔类型
 */
+(BOOL)checkTelNumber:(NSString *)text;
@end
