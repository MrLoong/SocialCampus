//
//  NetworkPortal.h
//  SocialCampus
//
//  Created by LastDays on 16/12/14.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCServiceMessage.h"

@protocol SCNetworkPortalDelegate<NSObject>

-(void)finishRequestWithSM:(SCServiceMessage *)sm;

@end

@interface SCNetworkPortal : NSObject


+(void)requestWithSM:(SCServiceMessage *)serviceMessage
            delegate:(id<SCNetworkPortalDelegate>)delegate
             success:(void (^)(NSString *data,NSURLResponse *response))success
             failure:(void (^)(NSError *error))failure;

@end
