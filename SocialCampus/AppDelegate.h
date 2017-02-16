//
//  AppDelegate.h
//  SocialCampus
//
//  Created by lastday on 16/10/19.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SCMainWindowManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SCMainWindowManager *mainWindowManager;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

