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
 请求状态，描述所有的请求的状态变化
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


//虽然满足了不同处对同一URL都做相同相应，但是同一处的连续请求却没有处理，导致连续添加（暂时采用循环遍历的形式满足）
- (void)addRequestWithURL:(NSURL *)url
     RequestProgressBlock:(RequestProgressBlock)requestProgressBlock
       RequestFinishBlock:(RequestFinishBlock)requestFinishBlock
       RequestCreateBlock:(RequestCreateBlock)requestCreateBlock
{
    
    BOOL fistRequest = NO;
    
    //Url 做空处理
    if([url isEqual:nil]){
        requestFinishBlock(nil,nil,nil);
    }
    
    
    if(!self.requestStatus[url]){
        self.requestStatus[url] = [[NSMutableArray alloc] init];
        fistRequest = YES;
    }
    
    NSMutableArray *requestArray = self.requestStatus[url];
    NSMutableDictionary *requestContent = [[NSMutableDictionary alloc] init];
    if (requestProgressBlock) {
        requestContent[@"requestProgress"] = [requestProgressBlock copy];
    }
    if (requestFinishBlock) {
        requestContent[@"requestFinish"] = [requestFinishBlock copy];
    }
    
    BOOL isContain = NO;
    
    for (NSMutableDictionary *content in requestArray) {
        if ([content[@"requestProgress"] isEqual:requestProgressBlock]||[content[@"requestFinish"] isEqual:requestFinishBlock]){
            isContain = YES;
        }
    }
    if (!isContain) {
        [requestArray addObject:requestContent];
        self.requestStatus[url] = requestArray;
        
        if (fistRequest) {
            requestCreateBlock();
        }
    }
    
}



@end
