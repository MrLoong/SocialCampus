//
//  SCRequestCenter.m
//  SocialCampus
//
//  Created by ldjzhang(张俊) on 2017/2/16.
//  Copyright © 2017年 lastday. All rights reserved.
//

#import "SCRequestCenter.h"


@interface SCRequestCenter()


/**
 请求状态，描述请求过程中的状态变化
 */
@property(strong, nonatomic) NSMutableDictionary *requestStatus;



@end

@implementation SCRequestCenter

+ (instancetype)shareInstance
{
    static SCRequestCenter *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SCRequestCenter alloc] init];
    });
    return shareInstance;
    
    
}



@end
