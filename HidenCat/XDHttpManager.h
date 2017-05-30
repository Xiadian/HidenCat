//
//  XDHttpManager.h
//  HidenCat
//
//  Created by XiaDian on 16/5/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
extern NSString * const PARAMETERSDIC;   //字典类型参数
extern NSString * const PARAMETERARR; //数组参数
extern NSString * const PARAMETERSSTR;       //字符参数
typedef void(^XDHttpConnectNetFinish)(NSURLSessionDataTask * task, id responseObject,NSError * error);
typedef  enum {
    XDGET,//get请求
    XDPOST//post请求
}NetStyle;
@interface XDHttpManager : NSObject
//获取单例对象的方法
+ (instancetype)defaultManager;
//启动一个网络请求
-(void)startNetConnectByStyle:(NetStyle)style andUrl :(NSString *)urlString andPraDic:(NSDictionary *)mutableDicPra andFinishBlock:(XDHttpConnectNetFinish)finishBlock;
@end
