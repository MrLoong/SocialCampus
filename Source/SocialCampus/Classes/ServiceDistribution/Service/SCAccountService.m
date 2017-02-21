//
//  AccountService.m
//  SocialCampus
//
//  Created by LastDays on 16/11/8.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCAccountService.h"
#import "SCServiceMessage.h"
#import "SCNetworkPortal.h"

@interface SCAccountService()


@end

@implementation SCAccountService

+ (SCAccountService *)shareInstance
{
    static SCAccountService *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SCAccountService alloc] init];
    });
    return shareInstance;
}

- (void)requestProcessing:(SCServiceMessage *)sm{
    if([sm.messageType isEqual: ACCOUNT_LOGIN_VALIDATE]){
        [self loginValiDateRequestWithSM:sm];
    }
}

- (void)loginValiDateRequestWithSM:(SCServiceMessage *)sm{
    
    [SCNetworkPortal requestWithSM:sm
                          delegate:self
                           success:^(NSString *data,NSURLResponse *reponse){
                               
                           }
                           failure:^(NSError *error){
                               
                           }];
}



@end
