//
//  NetworkPortal.m
//  SocialCampus
//
//  Created by LastDays on 16/12/14.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCNetworkPortal.h"
#import "SCHttpRequest.h"

@implementation SCNetworkPortal

+(void)requestWithSM:(SCServiceMessage *)serviceMessage
             delegate:(id<SCNetworkPortalDelegate>)delegate
              success:(void (^)(NSString *data,NSURLResponse *response))success
              failure:(void (^)(NSError *error))failure{
    
    [SCHttpRequest sendRequestWithSM:serviceMessage data:@"12"
                          completion:^(SCServiceMessage *serviceMessage)
    {
        if(delegate&&[delegate respondsToSelector:@selector(finishRequestWithSM:)]){
            [delegate finishRequestWithSM:serviceMessage];
        }
    }];
}

@end
