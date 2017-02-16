//
//  HttpRequest.h
//  SocialCampus
//
//  Created by LastDays on 16/12/14.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCServiceMessage.h"

@interface SCHttpRequest : NSObject

+ (void)sendRequestWithSM:(SCServiceMessage *)serviceMessage
                     data:(NSString *)data
               completion:(void(^)(SCServiceMessage *serviceMessage))completion;



@end
