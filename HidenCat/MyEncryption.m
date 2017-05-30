//
//  MyEncryption.m
//  HidenCat
//
//  Created by XiaDian on 16/5/8.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "MyEncryption.h"
#import "RSAEncryptor.h"
#import "DES3Util.h"
@implementation MyEncryption
+(NSString *)Encryption:(NSDictionary *)sender{
    NSString *str=[self dictionaryToJson:sender];
    NSString *DedKey=[DES3Util shuffledAlphabet];
    //rsa加密key
    RSAEncryptor *rsa=[RSAEncryptor shareManager];
    NSString *keyForRSA=[rsa rsaEncryptString:DedKey];
    //密文
    NSString *encryption=[DES3Util encrypt:str andDES3Key:DedKey];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc]initWithObjectsAndKeys:encryption,@"data",keyForRSA,@"key",nil];
    NSString *value=[self dictionaryToJson:dic];
   
    //去掉json字符串的\n \r  \由后台去掉
    value =[value stringByReplacingOccurrencesOfString:@"\\n" withString:@""];
    value=[value stringByReplacingOccurrencesOfString:@"\\r" withString:@""];
    return value;
}
+(NSDictionary *)DeEncryption:(NSDictionary *)sender{
    //获取key键
    NSString *str=[sender objectForKey:@"key"];
    //获得DES的加密key
    NSString *DedKey=[[RSAEncryptor shareManager]rsaDecryptString:str];
    //通过DESkey解密DES获取json字符串
    NSString *sss=[DES3Util decrypt:[sender objectForKey:@"data"] andDES3Key:DedKey];
   //转成字典
    NSDictionary *dic=[self dictionaryWithJsonString:sss];
    return dic;
}
#pragma mark  字典 json数据互转
//json to 字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
+ (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
@end
