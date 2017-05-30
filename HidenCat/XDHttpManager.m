


//
//  XDHttpManager.m
//  HidenCat
//
//  Created by XiaDian on 16/5/11.
//  Copyright © 2016年 vdchina. All rights reserved.
//

#import "XDHttpManager.h"
NSString * const PARAMETERSDIC;   //字典类型参数
NSString * const PARAMETERARR; //数组参数
NSString * const PARAMETERSSTR;//字符参数
@implementation XDHttpManager
/**
 *  获取管理类的单例
 *
 *  @return 返回本方法
 */
+ (instancetype)defaultManager {
    static XDHttpManager *xm = nil;
    @synchronized(self) {
        if (!xm) {
            xm = [[XDHttpManager alloc] init];
        }
    }
    return xm;
}
-(void)startNetConnectByStyle:(NetStyle)style andUrl:(NSString *)urlString andPraDic:(NSDictionary *)mutableDicPra andFinishBlock:(XDHttpConnectNetFinish)finishBlock{

}
-(AFHTTPSessionManager *)getManager{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    return manager;
}
/**
 *  get请求
 *
 *  @param urlString   请求地址
 *  @param praDic      请求参数
 *  @param finishBlock 请求回调block
 */
-(void)startNetConnectByGet:(NSString *)urlString andPraDic:(NSDictionary *)mutableDicPra andFinishBlock:(XDHttpConnectNetFinish)finishBlock{
    [[self getManager] POST:urlString parameters:mutableDicPra[PARAMETERSDIC] progress:nil success:^(NSURLSessionDataTask  * _Nonnull task, id  _Nullable responseObject) {
        finishBlock(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finishBlock(task,nil,error);
    }];
    
    
}
/**
 *  post请求
 *
 *  @param urlString   请求地址
 *  @param praDic      请求参数
 *  @param finishBlock 请求回调block
 */
-(void)startNetConnectByPost:(NSString *)urlString andPraDic:(NSDictionary *)mutableDicPra finish:(XDHttpConnectNetFinish)finishBlock{
    [[self getManager] POST:urlString parameters:mutableDicPra[PARAMETERSDIC] progress:nil success:^(NSURLSessionDataTask  * _Nonnull task, id  _Nullable responseObject) {
        finishBlock(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finishBlock(task,nil,error);
    }];
}
@end
