//
//  SCServiceSelector.m
//  SocialCampus
//
//  Created by LastDays on 16/11/8.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCServiceSelector.h"
#import "SCAccountService.h"

@implementation SCServiceSelector

+ (SCServiceSelector *)shareInstance{
    static SCServiceSelector *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SCServiceSelector alloc] init];
    });
    return shareInstance;
    
}

- (SCServiceEngine *)selectServiceWithMessage:(SCServiceMessage *)sm{
    if([sm.messageType hasPrefix:@"account/"]){
        return [SCAccountService shareInstance];
    }
    return nil;
}
@end
