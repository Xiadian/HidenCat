//
//  TextCheck.m
//  HidenCat
//
//  Created by XiaDian on 16/4/28.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "TextChecker.h"

@implementation TextChecker
//电话号码验证
+(BOOL)checkTelNumber:(NSString*)telNumber
{
    NSString * pattern=@"^1+[3578]+\\d{9}";
    
    NSPredicate * pred=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",pattern];
    
    BOOL isMatch=[pred evaluateWithObject:telNumber];
    
    return isMatch;
}
@end
