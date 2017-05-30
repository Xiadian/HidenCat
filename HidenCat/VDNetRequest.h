//
//  VDNetRequest.h
//  客邦
//
//  Created by SZR on 16/4/27.
//  Copyright © 2016年 VDchina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
extern NSString * const VDHTTPPARAMETERS;   //HTTP post请求参数
extern NSString * const VDHTTPCONTENTTYPE; //HTTP Content-type
extern NSString * const VDHTTPIMAGE;       //HTTP 上传图片
extern NSString * const VDBGIMAGENAME;     //后台接收的字段/参数
extern NSString * const VDFILEPATH;        //文件路径
/**
 *  网络请求完成回调
 *
 *  @param task           任务对象
 *  @param responseObject 请求数据信息
 *  @param error          请求错误信息
 */
typedef void(^VDHttpFinishBlock)(NSURLSessionDataTask * task, id responseObject,NSError * error);
@interface VDNetRequest : NSObject
/**
 *  普通get请求
 *
 *  @param url        请求URL
 *  @param arrtribute 参数列表
 *  @param finish     请求完成回调
 */
+(void)VD_GetWithURL:(NSString * )url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish;
/**
 *  普通post请求
 *
 *  @param url        请求URL
 *  @param arrtribute 参数列表
 *  @param finish     请求完成回调
 */
+(void)VD_PostWithURL:(NSString * )url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish;
/**
 *  上传图片
 *
 *  @param url        请求URL
 *  @param arrtribute 参数列表
 *  @param finish     请求完成回调
 */
+(void)VD_UploadImageWithURL:(NSString * )url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish;
//上传文件
+(void)VD_UploadFileWithURL:(NSString *)url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish;
@end
