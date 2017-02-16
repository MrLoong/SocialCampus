//
//  SCServiceSelector.h
//  SocialCampus
//
//  Created by LastDays on 16/11/8.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCServiceMessage.h"
#import "SCServiceEngine.h"

@interface SCServiceSelector : NSObject

+(SCServiceSelector *)shareInstance;

- (SCServiceEngine *)selectServiceWithMessage:(SCServiceMessage *)sm;

@end
