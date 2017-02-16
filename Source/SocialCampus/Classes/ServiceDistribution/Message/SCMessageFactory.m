//
//  MessageFactory.m
//  SocialCampus
//
//  Created by LastDays on 16/11/10.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCMessageFactory.h"
#import "SCServiceCommand.h"

@implementation SCMessageFactory

+ (SCServiceMessage *)messageFactoryWithAssemblyMethod:(AssemblyMethod)assemblyMethod{
    SCServiceMessage *sm = [[SCServiceMessage alloc] init];
    if (assemblyMethod == LoginVerification) {
        sm.messageType = ACCOUNT_LOGIN_VALIDATE;
        sm.method      = ProcessingMethod_Send;
    }
    return sm;
}


@end
