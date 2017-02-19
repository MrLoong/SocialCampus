//
//  ServiceEngine.m
//  SocialCampus
//
//  Created by LastDays on 16/11/8.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCServiceEngine.h"
#import "SCServiceMessage.h"
#import "SCServiceSelector.h"
#import "SCServiceTerminal.h"


@interface SCServiceEngine()

/**
 *  发送SCServiceMessage， 请求发送
 *
 *  @param serviceMessage SCServiceMessage
 *
 */
- (void)sendSM:(SCServiceMessage *)serviceMessage;

/**
 *  取消SCServiceMessage的发送
 *
 *  @param messageType 消息类型
 *  @param delegate    响应者
 *
 */
-(void)cancleSM:(NSString *)messageType delegate:(id)delegate;

- (void)serviceDistributionWithMethod:(ProcessingMethod)method  SCServiceMessage:(SCServiceMessage *)serviceMessage;

@end

@implementation SCServiceEngine

+ (SCServiceEngine *)shareInstance{
    static SCServiceEngine *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SCServiceEngine alloc] init];
    });
    return shareInstance;
}

+ (void)sendSM:(SCServiceMessage *)serviceMessage{
    [[SCServiceEngine shareInstance] serviceDistributionWithMethod:serviceMessage.method SCServiceMessage:serviceMessage];
}


- (void)serviceDistributionWithMethod:(ProcessingMethod)method  SCServiceMessage:(SCServiceMessage *)serviceMessage{
    switch (method) {
        case ProcessingMethod_Send  :
            [self sendSM:serviceMessage];
            break;
        case ProcessingMethod_Cancel:
            [self cancleSM:serviceMessage.messageType delegate:serviceMessage.responder];
            break;
        default:
            NSLog(@"不能识别的命令");
            break;
    }
}

- (void)sendSM:(SCServiceMessage *)serviceMessage{
    
    SCServiceEngine *targetServicce = [[SCServiceSelector shareInstance] selectServiceWithMessage:serviceMessage];
    serviceMessage.extuter = targetServicce;
    [serviceMessage.extuter requestProcessing:serviceMessage];
}

- (void)cancleSM:(NSString *)messageType delegate:(id)delegate{
    
}

- (void)requestProcessing:(SCServiceMessage *)sm{
    
}


#pragma mark - SCNetworkPortalDelegate

-(void)finishRequestWithSM:(SCServiceMessage *)sm{
    if (sm.terminal && [sm.terminal respondsToSelector:@selector(pushDataToTerminal:)]) {
        [sm.terminal pushDataToTerminal:sm];
    }
}

@end
