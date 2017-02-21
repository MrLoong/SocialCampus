//
//  SCRequestCenter.m
//  SocialCampus
//
//  Created by ldjzhang(张俊) on 2017/2/16.
//  Copyright © 2017年 lastday. All rights reserved.
//

#import "SCHttpRequestCenter.h"
#import "SCHttpRequestOperation.h"


@interface SCHttpRequestCenter()


/**
 请求状态，描述所有的请求的状态变化.
 */
@property(strong, nonatomic) NSMutableDictionary *requestStatus;

@property(strong, nonatomic) dispatch_queue_t concurrentQueue;


@end

@implementation SCHttpRequestCenter

+ (instancetype)shareInstance
{
    static SCHttpRequestCenter *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[SCHttpRequestCenter alloc] init];
    });
    return shareInstance;
}


//虽然满足了不同处对同一URL都做相同相应，但是同一处的连续请求却没有处理，导致连续添加（暂时采用循环遍历的形式满足）。
- (void)addRequestWithURL:(NSURL *)url
     RequestProgressBlock:(RequestProgressBlock)requestProgressBlock
       RequestFinishBlock:(RequestFinishBlock)requestFinishBlock
       RequestCreateBlock:(RequestCreateBlock)requestCreateBlock
{
    //Url 做空处理。
    if([url isEqual:nil]){
        requestFinishBlock(nil,nil,nil);
    }
    
    //设置屏障，读写操作保持一致性。
    dispatch_barrier_sync(self.concurrentQueue, ^{
        BOOL fistRequest = NO;
        
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
    });
    
}

-(void)requestWithURL:(NSURL *)URL
 RequestProgressBlock:(RequestProgressBlock)requestProgressBlock
   RequestFinishBlock:(RequestFinishBlock)requestFinishBlock
   RequestCreateBlock:(RequestCreateBlock)requestCreateBlock
{
    __block SCHttpRequestOperation *operation;
    __weak __typeof(self)myself = self;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:URL cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    //请求添加，如果未发现有创建，则进行请求创建
    [self addRequestWithURL:URL
       RequestProgressBlock:requestProgressBlock
         RequestFinishBlock:requestFinishBlock
         RequestCreateBlock:^{
             operation = [[SCHttpRequestOperation alloc] initWithRequest:request RequestProgressBlock:^(NSInteger alreadyReciveSize, NSInteger expectedContentLength){
                 __block NSArray *requestArray;
                 dispatch_sync(self.concurrentQueue,^{
                     requestArray = [myself.requestStatus[URL] copy];
                 });
                 for (NSDictionary *requestContent in requestArray) {
                     dispatch_async(dispatch_get_main_queue(), ^{
                         
                         RequestProgressBlock progressBlock = requestContent[@"requestProgress"];
                         
                         if (progressBlock) {
                             progressBlock(alreadyReciveSize,expectedContentLength);
                         }
                     });
                 }
             } RequestFinishBlock:^(NSData *data, NSError *error, BOOL finished) {
                 __block NSArray *requestArray;
                 dispatch_barrier_sync(self.concurrentQueue,^{
                     requestArray = [myself.requestStatus[URL] copy];
                     if (finished) {
                         
                     }
                 });
             } RequestCancelBlock:^{
                 
             }];
    }];
}




@end
