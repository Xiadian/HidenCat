//
//  DES3Util.h
//  des
//
//  Created by XiaDian on 16/5/6.
//
//

//
//  DES3Util.h
//

#import <Foundation/Foundation.h>


@interface DES3Util : NSObject {
    
}
// 加密方法
+ (NSString*)encrypt:(NSString*)plainText andDES3Key:(NSString *)key;

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText andDES3Key:(NSString *)key;

+(NSString *)shuffledAlphabet;
@end

