//
//  SCHttpRequestOperation.h
//  SocialCampus
//
//  Created by ldjzhang(张俊) on 2017/2/16.
//  Copyright © 2017年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SCHttpRequestCenter.h"

@interface SCHttpRequestOperation : NSOperation


/**
 Operation初始化

 @param request              NSMutableURLRequest
 @param requestProgressBlock RequestProgressBlock
 @param requestFinishBlock   RequestFinishBlock
 @param requestCancelBlock   RequestCancelBlock

 @return SCHttpRequestOperation
 */
- (instancetype)initWithRequest:(NSMutableURLRequest *)request
           RequestProgressBlock:(RequestProgressBlock)requestProgressBlock
             RequestFinishBlock:(RequestFinishBlock)requestFinishBlock
             RequestCancelBlock:(RequestCancelBlock)requestCancelBlock;

@end
