//
//  ServiceMessage.h
//  SocialCampus
//
//  Created by LastDays on 16/11/6.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCServiceCommand.h"

#define MESSAGE_STATE_IDLE		(0)	// 消息被创建
#define MESSAGE_STATE_SENDING	(1)	// 消息正在发送
#define MESSAGE_STATE_SUCCEED	(2)	// 消息处理成功（本地或网络）
#define MESSAGE_STATE_FAILED	(3)	// 消息处理失败（本地或网络）
#define MESSAGE_STATE_CANCELLED	(4)	// 消息被取消了

// 处理方式
typedef enum
{
    ProcessingMethod_Send,
    ProcessingMethod_Cancel,
    ProcessingMethod_Reset,
    
}ProcessingMethod;

//消息类型
typedef enum
{
    LoginVerification,
    
}AssemblyMethod;


@interface SCServiceMessage : NSObject

@property (strong, nonatomic)NSDictionary        *requestParameters;          // 输入参数
@property (strong, nonatomic)NSDictionary        *responseContent;            // 响应内容
@property (strong, nonatomic)NSString            *errorField;                 // 错误域
@property (assign, nonatomic)NSInteger           errorCode;                   // 错误码
@property (strong, nonatomic)NSString            *errorDescription;           // 错误描述
@property (assign, nonatomic)BOOL                isCache;                     // 是非否缓存
@property (assign, nonatomic)BOOL                isOverTime;                  // 是否超时
@property (assign, nonatomic)NSUInteger          rTimes;                      // 重传次数
@property (strong, nonatomic)id                  extuter;                     // 执行者
@property (strong, nonatomic)id                  responder;                   // 响应者
@property (strong, nonatomic)id                  terminal;                    // 请求终端
@property (assign, nonatomic)NSUInteger          state;                       // 消息状态
@property (strong, nonatomic)NSString            *messageType;                // 消息类型
@property (assign, nonatomic)ProcessingMethod    method;                      // 请求方式
@property (strong, nonatomic)NSString            *api;                        // 请求接口


@end
