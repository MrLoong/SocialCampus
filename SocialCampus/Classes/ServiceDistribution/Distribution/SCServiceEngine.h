//
//  ServiceEngine.h
//  SocialCampus
//
//  Created by LastDays on 16/11/8.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCServiceMessage.h"
#import "SCNetworkPortal.h"

@protocol SCServiceEngineDelegate <NSObject>

@optional
-(void)pushDataToTerminal:(SCServiceMessage *)sm;



@end

@interface SCServiceEngine : NSObject<SCNetworkPortalDelegate>

+ (void)sendSM:(SCServiceMessage *)serviceMessage;

+ (SCServiceEngine *)shareInstance;

- (void)requestProcessing:(SCServiceMessage *)sm;

@end
