//
//  SCServiceRequest.h
//  SocialCampus
//
//  Created by LastDays on 16/11/16.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCServiceMessage.h"

@protocol SCServiceTerminalDelegate <NSObject>

@optional
-(void)pushDataToControllerWithSM:(SCServiceMessage *)SM;


@end

// 请求处理状态
typedef enum
{
    SendDataStatu_Waiting,      // 等待中
    SendDataStatu_Connecting,   // 连接中
    SendDataStatu_Sending,      // 发送数据中
    SendDataStatu_Recving,      // 接收数据中
    SendDataStatu_Finish,       // 完成数据接收
} SendDataStatus;

typedef void (^ServiceReponseBlock)(SCServiceMessage *serviceMessage);


@interface SCServiceTerminal : NSObject
{
    
}

@property (assign, nonatomic) NSInteger           status;              // 请求处理状态
@property (assign, nonatomic) NSInteger           overTime;            // 超时时间
@property (copy  , nonatomic) ServiceReponseBlock whenSending;         // 发送
@property (copy  , nonatomic) ServiceReponseBlock whenSucceed;         // 成功
@property (copy  , nonatomic) ServiceReponseBlock whenFailed;          // 失败
@property (copy  , nonatomic) ServiceReponseBlock whenCancled;         // 取消




/**
 请求的统一入口

 @param assemblyMethod 服务消息组装方式
 @param responder      请求对象（消息最终反馈的响应者）
 */
+ (void)requestServiceWihtAssemblyMethod:(AssemblyMethod)assemblyMethod parameters:(NSDictionary*)parameters Responder:(id)responder;


/**
 单例SCMProcessing
 
 @return SCMProcessing
 */
+ (SCServiceTerminal *)shareInstance;

@end
