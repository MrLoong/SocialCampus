//
//  SCLoginViewController.m
//  SocialCampus
//
//  Created by lastday on 16/10/19.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCLoginViewController.h"
#import "SCMobileViewController.h"
#import "SCNavigationController.h"
#import "SCTextField.h"
#import "SCServiceTerminal.h"
#import "SCServiceEngine.h"

@interface SCLoginViewController ()<SCServiceTerminalDelegate>

@property (strong, nonatomic)UIButton *loginBtn;
@property (strong, nonatomic)UIButton *forgotBtn;
@property (strong, nonatomic)SCTextField *inputUserTextView;
@property (strong, nonatomic)SCTextField *inputPassworldTextView;
@property (strong, nonatomic)UIImageView *userImageView;
@property (strong, nonatomic)UIImageView *passWorldImageView;

@end

@implementation SCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureBgImage];
    [self createUI];
}

- (void)viewDidAppear:(BOOL)animated{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createUI{
    
    self.userImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15,158,32,32)];
    [self.userImageView setImage:[UIImage imageNamed:@"icon_user_normal"]];
    [self.view addSubview:self.userImageView];
    self.inputUserTextView = [[SCTextField alloc] initWithFrame:CGRectMake(40, 150, self.view.frame.size.width-60, 80) secureTextEntry:NO];
    [self.view addSubview:self.inputUserTextView];
    
    
    
    self.passWorldImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15,208,32,32)];
    [self.passWorldImageView setImage:[UIImage imageNamed:@"user_password"]];
    [self.view addSubview:self.passWorldImageView];
    self.inputPassworldTextView = [[SCTextField alloc] initWithFrame:CGRectMake(40, 200, self.view.frame.size.width-60, 80) secureTextEntry:YES];
    [self.view addSubview:self.inputPassworldTextView];
    
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loginBtn setTitle:@"Login in" forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor clearColor];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    self.loginBtn.frame = CGRectMake(30, 315, self.view.frame.size.width-60, 50);
    self.loginBtn.layer.cornerRadius = 22;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    [self.loginBtn.layer setBorderWidth:1.0]; //边框宽度
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 1, 1, 1, 1 });
    [self.loginBtn.layer setBorderColor:colorref];
    self.loginBtn.layer.masksToBounds = YES;
        [self.loginBtn addTarget:self action:@selector(onXYLoginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
    
    
    self.forgotBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.forgotBtn setTitle:@"Forget Password?" forState:UIControlStateNormal];
    self.forgotBtn.frame = CGRectMake(15, 510, self.view.frame.size.width-30, 50);
    [self.view addSubview:self.forgotBtn];
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 550, self.view.frame.size.width-160, 1)];
    lineLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:lineLabel];
    
}



- (void)onXYLoginClick{
//    SCMobileViewController *mobileViewController = [[SCMobileViewController alloc] init];
//    SCNavigationController *navigationController = [[SCNavigationController alloc] initWithRootViewController:mobileViewController];
//    [self presentViewController:navigationController animated:YES completion:nil];
    
    [SCServiceTerminal requestServiceWihtAssemblyMethod:LoginVerification parameters:NULL Responder:self];
}

- (void)configureBgImage{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"login_bg"];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height);
    [imageView addSubview:effectView];
    [self.view addSubview:imageView];
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.inputUserTextView endEditing:YES];
    [self.inputPassworldTextView endEditing:YES];
}



#pragma mark - SCServiceTerminalDelegate

-(void)pushDataToControllerWithSM:(SCServiceMessage *)SM{
    NSLog(@"%@",SM.responseContent);
}









@end
