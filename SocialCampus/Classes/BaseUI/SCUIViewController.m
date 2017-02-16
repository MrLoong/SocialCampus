//
//  SCUIViewController.m
//  SocialCampus
//
//  Created by LastDays on 16/10/24.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCUIViewController.h"

@interface SCUIViewController ()

@end

@implementation SCUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLeftBarButtonItem];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addLeftBarButtonItem{
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 44, 44);
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
    [backBtn setImage:[UIImage imageNamed:@"icon_back_normal"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"icon_back_press"] forState:UIControlStateHighlighted];
    [backBtn addTarget:self action:@selector(onBackButtonClick) forControlEvents:UIControlEventTouchUpInside];
    backBtn.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    
}

-(void)onBackButtonClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
