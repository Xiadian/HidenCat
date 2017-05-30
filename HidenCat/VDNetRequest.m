//
//  VDNetRequest.m
//  客邦
//
//  Created by SZR on 16/4/27.
//  Copyright © 2016年 VDchina. All rights reserved.
//

#import "VDNetRequest.h"
NSString * const VDHTTPPARAMETERS = @"VDHTTPPARAMETERS";
NSString * const VDHTTPCONTENTTYPE = @"VDHTTPCONTENTTYPE";
NSString * const VDHTTPIMAGE = @"VDHTTPIMAGE";       //HTTP 上传图片
NSString * const VDBGIMAGENAME = @"VDBGIMAGENAME";     //后台接收的字段/参数
NSString * const VDFILEPATH = @"VDFILEPATH";        //文件路径
@implementation VDNetRequest
/**
 *  创建sessionManager单例对象
 *
 *  @param attribute 属性列表
 *
 *  @return 返回sessionManager单例对象
 */
+(AFHTTPSessionManager *)createHttpManager:(NSDictionary *)attribute{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    if (attribute[VDHTTPCONTENTTYPE]) {
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:attribute[VDHTTPCONTENTTYPE], nil];
    }
    return manager;
}
//普通get请求
+(void)VD_GetWithURL:(NSString *)url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish{
    [[self createHttpManager:arrtribute] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finish(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finish(task,nil,error);
    }];
}
//普通post请求
+(void)VD_PostWithURL:(NSString *)url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish{
    [[self createHttpManager:arrtribute] POST:url parameters:arrtribute[VDHTTPPARAMETERS] progress:nil success:^(NSURLSessionDataTask  * _Nonnull task, id  _Nullable responseObject) {
        finish(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finish(task,nil,error);
    }];
}
//上传图片
+(void)VD_UploadImageWithURL:(NSString *)url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish{
    [[self createHttpManager:arrtribute] POST:url parameters:arrtribute[VDHTTPPARAMETERS] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //网络开发总，上传文件，是文件不允许被覆盖，文件重名
        NSDateFormatter * formatter =  [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        //设置文件名称
        NSString *fileName;
        //字节流
        NSData * data;
        if (UIImagePNGRepresentation(arrtribute[VDHTTPIMAGE]) == nil) {
            data = UIImageJPEGRepresentation(arrtribute[VDHTTPIMAGE],1);
            fileName = [NSString stringWithFormat:@"%@.jpg", str];
        }else{
            data = UIImagePNGRepresentation(arrtribute[VDHTTPIMAGE]);
            fileName = [NSString stringWithFormat:@"%@.png",str];
        }
        //@"img"为后台接收的字段或参数
        [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/jpg/png"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finish(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finish(task,nil,error);
    }];
}
//上传文件
+(void)VD_UploadFileWithURL:(NSString *)url arrtribute:(NSDictionary *)arrtribute finish:(VDHttpFinishBlock)finish{
    [[self createHttpManager:arrtribute] POST:url parameters:arrtribute[VDHTTPPARAMETERS] constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //网络开发总，上传文件，是文件不允许被覆盖，文件重名
        NSDateFormatter * formatter =  [[NSDateFormatter alloc] init];
        // 设置时间格式
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        //设置文件名称
        NSString *fileName = [NSString stringWithFormat:@"%@.json",str];
        //存储到formData里面
        /*
         1. 要上传的[二进制数据]
         2. 对应网站上[upload.php中]处理文件的[字段"file"]
         3. 要保存在服务器上的[文件名]
         4. 上传文件的[mimeType]
         */
        [formData appendPartWithFileData:[NSData dataWithContentsOfFile:VDFILEPATH] name:arrtribute[VDBGIMAGENAME] fileName:fileName mimeType:@"file"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        finish(task,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        finish(task,nil,error);
    }];
}


@end
