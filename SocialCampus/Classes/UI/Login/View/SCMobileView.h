//
//  SCLoginView.h
//  SocialCampus
//
//  Created by LastDays on 16/11/2.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCTextField.h"


#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define TipLabelWidth               10
#define TipLabelHeight              16
#define TipLabelLeftPadding         18
#define TipLabelTopPadding          12


#define SmsCodeBtnWidth             84
#define SmsCodeBtnHeight            20
#define SmsCodeBtnRightPadding      16
#define SmsCodeBtnTopPadding        138

#define NumberTextFieldWidth        mainRect.size.width-90-40
#define NumberTextFieldHeight       40
#define NumberTextFieldLeftPadding  0
#define NumberTextFieldTopPadding   129

#define CodeTextFieldWidth          mainRect.size.width-90-40
#define CodeTextFieldHeight         40
#define CodeTextFieldLeftPadding    0
#define CodeTextFieldTopPadding     8

#define FinishBtnWidth              CGRectGetWidth(mainRect)-16*2
#define FinishBtnHeight             48
#define FinishBtnLeftPadding        16
#define FinishBtnTopPadding         16


@protocol SCMobileViewDelegate <NSObject>

@optional
-(void)onFinishBtnClickDelegate;
-(void)onSmsCodeBtnClickDelegate;
-(void)codeTextfieldChangeDelegate:(UITextField *)TextField;
-(void)numberTextfieldChangeDelegate:(UITextField *)TextField;

@end

@interface SCMobileView : UIView

@property (strong, nonatomic)SCTextField *numberTextfield;
@property (strong, nonatomic)SCTextField *codeTextfield;
@property (strong, nonatomic)UIButton    *finishBtn;
@property (strong, nonatomic)UIButton    *smsCodeBtn;
@property (weak  , nonatomic)id<SCMobileViewDelegate> delegate;
@property (assign, nonatomic)BOOL        smsCodeBtnEnabled;
@property (assign, nonatomic)BOOL        finishBtnEnabled;
@property (strong, nonatomic)UIColor     *finishBtnColor;

@end
