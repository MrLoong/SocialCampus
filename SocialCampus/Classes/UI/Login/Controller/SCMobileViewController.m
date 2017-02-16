//
//  SCMobileViewController.m
//  SocialCampus
//
//  Created by LastDays on 16/10/20.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCMobileViewController.h"
#import "UIColor+HexString.h"
#import "SCTextField.h"
#import "UIView+ViewUtils.h"
#import "SCMobileView.h"


@interface SCMobileViewController ()<SCMobileViewDelegate>

@property (strong, nonatomic)SCTextField *numberTextfield;
@property (strong, nonatomic)SCTextField *codeTextfield;
@property (strong, nonatomic)UIButton    *finishBtn;
@property (strong, nonatomic)UIButton    *smsCodeBtn;
@property (strong, nonatomic)SCMobileView *mobileView;

@end

@implementation SCMobileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
}

- (void)createUI{
    self.title = @"绑定手机号";
    self.mobileView = [[SCMobileView alloc] initWithFrame:self.view.bounds];
    self.mobileView.delegate = self;
    [self.view addSubview:self.mobileView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.codeTextfield endEditing:YES];
    [self.numberTextfield endEditing:YES];
}

#pragma mark -SCLoginViewDelegate
- (void)onFinishBtnClickDelegate{
    NSLog(@"onFinishBtnClickDelegate");
    
}

- (void)onSmsCodeBtnClickDelegate{
    NSLog(@"onSmsCodeBtnClickDelegate");
}

- (void)codeTextfieldChangeDelegate:(UITextField *)TextField{
    if(TextField.text.length >= 6&&self.mobileView.smsCodeBtnEnabled&&self.mobileView.finishBtn.enabled == NO){
        self.mobileView.finishBtnEnabled = YES;
        self.mobileView.finishBtnColor = [UIColor colorWithHexString:@"#1E90FF"];
    }else{
        self.mobileView.finishBtnEnabled = NO;
        self.mobileView.finishBtnColor = [UIColor colorWithHexString:@"#d9d9d9"];
    }
}

- (void)numberTextfieldChangeDelegate:(UITextField *)TextField{
    if(TextField.text.length >= 11){
        self.mobileView.smsCodeBtnEnabled = YES;
    }else{
        self.mobileView.smsCodeBtnEnabled = NO;
    }
}

@end
