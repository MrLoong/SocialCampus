//
//  SCMainWindowManager.h
//  SocialCampus
//
//  Created by lastday on 16/10/19.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SCMainWindowManager : NSObject

- (instancetype)initWithWindow:(UIWindow *)window;

- (void)generateUI;

@end
