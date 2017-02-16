//
//  SCMainWindowManager.m
//  SocialCampus
//
//  Created by lastday on 16/10/19.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCMainWindowManager.h"
#import "SCLoginViewController.h"

@interface SCMainWindowManager()

@property (strong, nonatomic) UIWindow *mainWindow;
@property (strong, nonatomic) UIViewController *rootViewController;
@property (strong, nonatomic) SCLoginViewController *loginViewConroller;

@end

@implementation SCMainWindowManager

- (instancetype)initWithWindow:(UIWindow *)window
{
    self = [super init];
    if (self) {
        _mainWindow = window;
    }
    return self;
}

- (void)generateUI{
    
    //在这里分离，根据账户信息来判断生主UI还是Login
    [self generateLoginUI];
}

-(void)generateLoginUI{
    
    self.mainWindow.rootViewController = self.loginViewConroller;
}


-(SCLoginViewController *)loginViewConroller{
    if (_loginViewConroller == nil) {
        _loginViewConroller = [[SCLoginViewController alloc] init];
        _loginViewConroller.view.backgroundColor = [UIColor whiteColor];
    }
    return _loginViewConroller;
}



@end
