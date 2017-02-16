//
//  MessageFactory.h
//  SocialCampus
//
//  Created by LastDays on 16/11/10.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCServiceMessage.h"


@interface SCMessageFactory : NSObject

+ (SCServiceMessage *)messageFactoryWithAssemblyMethod:(AssemblyMethod)assemblyMethod;

@end
