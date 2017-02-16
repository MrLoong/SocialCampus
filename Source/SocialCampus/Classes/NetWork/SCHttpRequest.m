//
//  HttpRequest.m
//  SocialCampus
//
//  Created by LastDays on 16/12/14.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCHttpRequest.h"


@implementation SCHttpRequest

+ (void)sendRequestWithSM:(SCServiceMessage *)serviceMessage
               data:(NSString *)data
         completion:(void(^)(SCServiceMessage *serviceMessage))completion
{
    serviceMessage.responseContent = @{
                                       @"value":@"Lastday",
                                       };

    completion(serviceMessage);
}






@end
