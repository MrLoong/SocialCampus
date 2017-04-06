//
//  SCNavigationController.m
//  SocialCampus
//
//  Created by LastDays on 16/10/20.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCNavigationController.h"
#import "SCNavigationBar.h"
#import "UIColor+HexString.h"

@interface SCNavigationController ()

@end

@implementation SCNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                                 NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#fefefe"]}];
    [self.navigationBar setBarTintColor:[UIColor colorWithHexString:@"#1E90FF"]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    self.navigationBar.shadowImage = nil;
    [self setNavigationBarHidden:NO];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithNavigationBarClass:[SCNavigationBar class] toolbarClass:nil];
    if(self){
        self.viewControllers = @[rootViewController];
    }
    return self;
}



//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleDefault;
//}



@end
