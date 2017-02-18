//
//  SCRequestCenter.h
//  SocialCampus
//
//  Created by ldjzhang(张俊) on 2017/2/16.
//  Copyright © 2017年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - 请求状态block
/**
 请求进度

 @param alreadyReciveSize     已接收数据
 @param expectedContentLength 未接受数据
 */
typedef void(^RequestProgressBlock)(NSInteger alreadyReciveSize,NSInteger expectedContentLength);


/**
无参数block,用于创建
 */
typedef void(^RequestCreateBlock)();


/**
 请求完成

 @param data                  请求数据
 @param error                 请求错误信息
 @param finished              是否完成
 */
typedef void(^RequestFinishBlock)(NSData *data,NSError *error,BOOL finished);


@interface SCRequestCenter : NSObject

/**
 单例

 @return SCRequestCenter
 */
+(instancetype)shareInstance;


/**
 添加请求

 @param url url
 @param requestProgressBlock RequestProgressBlock
 @param requestFinishBlock RequestFinishBlock
 @param requestCreateBlock RequestCreateBlock
 */
- (void)addRequestWithURL:(NSURL *)url
     RequestProgressBlock:(RequestProgressBlock)requestProgressBlock
       RequestFinishBlock:(RequestFinishBlock)requestFinishBlock
       RequestCreateBlock:(RequestCreateBlock)requestCreateBlock;



@end
