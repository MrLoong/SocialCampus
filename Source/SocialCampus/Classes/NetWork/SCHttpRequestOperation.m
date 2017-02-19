//
//  SCHttpRequestOperation.m
//  SocialCampus
//
//  Created by ldjzhang(张俊) on 2017/2/16.
//  Copyright © 2017年 lastday. All rights reserved.
//

#import "SCHttpRequestOperation.h"

@interface SCHttpRequestOperation()<NSURLSessionDataDelegate>

//响应数据
@property(strong,nonatomic) NSMutableData *responseData;


//请求状态信息
@property(copy,nonatomic)RequestProgressBlock requestProgressBlock;
@property(copy,nonatomic)RequestFinishBlock   requestFinishBlock;
@property(copy,nonatomic)RequestCancelBlock   requestCancelBlock;


//数据接收状态
@property(assign,nonatomic) NSInteger expectedContentLength;
@property(assign,nonatomic) NSInteger alreadyReciveSize;

@property(strong,nonatomic) NSMutableURLRequest *request;

@end

@implementation SCHttpRequestOperation


- (instancetype)initWithRequest:(NSMutableURLRequest *)request
           RequestProgressBlock:(RequestProgressBlock)requestProgressBlock
             RequestFinishBlock:(RequestFinishBlock)requestFinishBlock
             RequestCancelBlock:(RequestCancelBlock)requestCancelBlock

{
    self = [super init];
    if (self) {
        _requestProgressBlock  = requestProgressBlock;
        _requestFinishBlock    = requestFinishBlock;
        _requestCancelBlock    = requestCancelBlock;
        _request               = request;
        _alreadyReciveSize     = 0;
        _expectedContentLength = 0;
    }
    return self;
}

-(void)start
{
    if (self.cancelled) {
        return;
    }
    
    NSURLSessionConfiguration *configura = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configura delegate:self delegateQueue:nil];
    NSMutableURLRequest *request = self.request;
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    [dataTask resume];
    [session finishTasksAndInvalidate];
    
}

-(void)cancel
{
    if (self.requestCancelBlock) {
        self.requestCancelBlock();
        [self clear];
    }
}

//当接收到服务器响应的时候调用
//默认情况下是不会接收服务器返回数据的,如果需要接收应该主动告诉系统
-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
                                didReceiveResponse:(NSURLResponse *)response
                                 completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    
    self.expectedContentLength = response.expectedContentLength;
    
    if (!self.cancelled) {
        self.responseData = [[NSMutableData alloc] init];
    }
    
    completionHandler(NSURLSessionResponseAllow);
}

//请求响应
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data
{
    
    [self.responseData appendData:data];
    self.alreadyReciveSize = self.responseData.length;
    self.expectedContentLength -= self.alreadyReciveSize;
    
    //响应请求状态
    if (self.requestProgressBlock) {
        self.requestProgressBlock(self.alreadyReciveSize,self.expectedContentLength);
    }
    
}

//请求完成
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error) {
        self.requestFinishBlock(self.responseData,nil,YES);
    }else{
        self.requestFinishBlock(nil,error,NO);
    }
}



//清空操作
-(void)clear
{
    _requestProgressBlock  = nil;
    _requestFinishBlock    = nil;
    _requestCancelBlock    = nil;
    _request               = nil;
    _alreadyReciveSize     = 0;
    _expectedContentLength = 0;
}



@end
