//
//  MyEncryption.h
//  HidenCat
//
//  Created by XiaDian on 16/5/8.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyEncryption : NSObject
+(NSString *)Encryption:(NSDictionary *)sender;
+(NSDictionary *)DeEncryption:(NSDictionary *)sender;
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
