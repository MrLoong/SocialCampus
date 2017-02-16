//
//  SCServiceRequest.m
//  SocialCampus
//
//  Created by LastDays on 16/11/16.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCServiceTerminal.h"
#import "SCMessageFactory.h"
#import "SCServiceEngine.h"

@interface SCServiceTerminal()<SCServiceEngineDelegate>

#pragma mark - 开放接口

/**
 统一入口
 
 @param assemblyMethod  AssemblyMethod
 */
- (void)requestServiceWihtAssemblyMethod:(AssemblyMethod)assemblyMethod  parameters:(NSDictionary*)parameters Responder:(id)responder;

/**
 *  请求方式的统一入口
 *
 *  @param method         ProcessingMethod
 *  @param serviceMessage SCServiceMessage
 *
 */
- (void)ProcessingSCMethod:(ProcessingMethod)method SCServiceMessage:(SCServiceMessage *)serviceMessage;

/**
 *  发送SCServiceMessage
 *
 *  @param serviceMessage SCServiceMessage
 *
 */
- (void)sendSM:(SCServiceMessage *)serviceMessage;

/**
 *  取消SCServiceMessage的发送
 *
 *  @param serviceMessage SCServiceMessage
 *
 */
- (void)cancleSM:(SCServiceMessage *)serviceMessage;

/**
 *  重置SCServiceMessage
 *
 *  @param serviceMessage SCServiceMessage
 *
 */
- (void)resetSM:(SCServiceMessage *)serviceMessage;

@end

@implementation SCServiceTerminal

+ (SCServiceTerminal *)shareInstance{
    static SCServiceTerminal *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SCServiceTerminal alloc] init];
    });
    return shareInstance;
}

+ (void)requestServiceWihtAssemblyMethod:(AssemblyMethod)assemblyMethod parameters:(NSDictionary*)parameters Responder:(id)responder{
    [[SCServiceTerminal shareInstance] requestServiceWihtAssemblyMethod:assemblyMethod parameters:parameters Responder:responder];
}

#pragma mark - 私有接口

- (void)requestServiceWihtAssemblyMethod:(AssemblyMethod)assemblyMethod
                              parameters:(NSDictionary*)parameters
                               Responder:(id)responder{
    SCServiceMessage *sm =  [SCMessageFactory messageFactoryWithAssemblyMethod:assemblyMethod];
    sm.responder = responder;
    sm.terminal  = self;
    [self ProcessingSCMethod:sm.method SCServiceMessage:sm];
}

- (void)ProcessingSCMethod:(ProcessingMethod)method SCServiceMessage:(SCServiceMessage *)serviceMessage{
    switch (method) {
        case ProcessingMethod_Send  :
            [self sendSM:serviceMessage];
            break;
        case ProcessingMethod_Cancel:
            [self cancleSM:serviceMessage];
            break;
        case ProcessingMethod_Reset :
            [self resetSM:serviceMessage];
            break;
        default:
            NSLog(@"不能识别的命令");
            break;
    }
}

- (void)sendSM:(SCServiceMessage *)serviceMessage{
    [SCServiceEngine sendSM:serviceMessage];
}
- (void)cancleSM:(SCServiceMessage *)serviceMessage{
    
}
- (void)resetSM:(SCServiceMessage *)serviceMessage{
    
}

#pragma mark - SCServiceEngineDelegate

-(void)pushDataToTerminal:(SCServiceMessage *)sm{
    
    if (sm.responder && [sm.responder respondsToSelector:@selector(pushDataToControllerWithSM:)]) {
        [sm.responder pushDataToControllerWithSM:sm];
    }
}
@end
