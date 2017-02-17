//
//  SCLoginView.m
//  SocialCampus
//
//  Created by LastDays on 16/11/2.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCMobileView.h"
#import "UIColor+HexString.h"
#import "UIView+ViewUtils.h"

@interface SCMobileView()<SCTextFieldDelegate>

@end

@implementation SCMobileView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBindTip:frame];
        [self createUI:frame];
    }
    return self;
}


- (void)createUI:(CGRect)mainRect{
    
    self.backgroundColor = [UIColor colorWithHexString:@"#ebebeb"];
    
    _numberTextfield = [[SCTextField alloc] initWithFrame:CGRectMake(NumberTextFieldLeftPadding,NumberTextFieldTopPadding, CGRectGetMaxX(mainRect), 40) secureTextEntry:NO];
    _numberTextfield.delegate = self;
    [_numberTextfield setSCTextFieldKeyboardType:UIKeyboardTypeNumberPad];
    _numberTextfield.scTextFieldWidth = NumberTextFieldWidth;
    _numberTextfield.scTintColor = [UIColor colorWithHexString:@"#1E90FF"];
    _numberTextfield.scTextLineColor = [UIColor colorWithHexString:@"#d9d9d9"];
    _numberTextfield.scTextColor = [UIColor colorWithHexString:@"#363636"];
    _numberTextfield.scPlaceholder = @"请输入手机号";
    [_numberTextfield.textField addTarget:self action:@selector(numberTextfieldChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_numberTextfield];
    
    _codeTextfield = [[SCTextField alloc] initWithFrame:CGRectMake(CodeTextFieldLeftPadding, _numberTextfield.bottom+CodeTextFieldTopPadding,  CGRectGetMaxX(mainRect), CodeTextFieldHeight) secureTextEntry:NO];
    _codeTextfield.delegate = self;
    [_codeTextfield setSCTextFieldKeyboardType:UIKeyboardTypeNumberPad];
    _codeTextfield.scTextFieldWidth = CodeTextFieldWidth;
    _codeTextfield.scTintColor = [UIColor colorWithHexString:@"#1E90FF"];
    _codeTextfield.scTextLineColor = [UIColor colorWithHexString:@"#d9d9d9"];
    _codeTextfield.scTextColor = [UIColor colorWithHexString:@"#363636"];
    [_codeTextfield.textField addTarget:self action:@selector(codeTextfieldChange:) forControlEvents:UIControlEventEditingChanged];
    _codeTextfield.scPlaceholder = @"请输入验证码";
    [self addSubview:_codeTextfield];
    
    _smsCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _smsCodeBtn.frame = CGRectMake(mainRect.size.width-84-SmsCodeBtnRightPadding, SmsCodeBtnTopPadding, SmsCodeBtnWidth, SmsCodeBtnHeight);
    _smsCodeBtn.backgroundColor = [UIColor colorWithHexString:@"#448aff" alpha:0.3f];
    [_smsCodeBtn setTitle:@"发送短信" forState:UIControlStateNormal];
    [_smsCodeBtn setTitleColor:[UIColor colorWithHexString:@"#448aff"] forState:UIControlStateNormal];
    [_smsCodeBtn setTitleColor:[UIColor colorWithHexString:@"#448aff" alpha:0.3f] forState:UIControlStateDisabled];
    _smsCodeBtn.layer.borderWidth = 1;
    _smsCodeBtn.layer.cornerRadius = 4;
    _smsCodeBtn.backgroundColor = [UIColor clearColor];
    self.smsCodeBtn.enabled = NO;
    _smsCodeBtn.layer.borderColor = [UIColor colorWithHexString:@"#448aff" alpha:0.3f].CGColor;
    [_smsCodeBtn addTarget:self action:@selector(onSmsCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_smsCodeBtn];
    
    _finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _finishBtn.frame = CGRectMake(FinishBtnLeftPadding, _codeTextfield.bottom+FinishBtnTopPadding,  FinishBtnWidth, FinishBtnHeight);
    [_finishBtn setTitle:@"确认" forState:UIControlStateNormal];
    [_finishBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _finishBtn.backgroundColor = [UIColor colorWithHexString:@"#d9d9d9"];
    _finishBtn.layer.cornerRadius = 8;
    [_finishBtn addTarget:self action:@selector(onFinishBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _finishBtn.layer.masksToBounds = YES;
    _finishBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [_finishBtn setTitleColor:[UIColor colorWithHexString:@"#fefefe"] forState:UIControlStateNormal];
    _finishBtn.enabled = NO;
    [self addSubview:_finishBtn];
    
    
    
}


- (void)createBindTip:(CGRect)mainRect
{
    UILabel * tipBgLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64,
                                                                     CGRectGetWidth(mainRect), 56)];
    tipBgLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:tipBgLabel];
    
    UILabel * tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(TipLabelLeftPadding, TipLabelTopPadding+tipBgLabel.top, tipBgLabel.width-TipLabelWidth, TipLabelHeight)];
    tipLabel.backgroundColor = [UIColor clearColor];
    tipLabel.textColor = [UIColor blackColor];
    tipLabel.font = [UIFont systemFontOfSize:16];
    tipLabel.text = @"登录成功！";
    [self addSubview:tipLabel];
    
    
    UILabel * tipLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(tipLabel.left,tipLabel.bottom+5,tipLabel.width, tipLabel.height)];
    tipLabel2.backgroundColor = [UIColor clearColor];
    tipLabel2.textColor = RGBCOLOR(0x79, 0x79, 0x79);
    tipLabel2.font = [UIFont systemFontOfSize:12];
    tipLabel2.text = @"为了您的帐户安全，请绑定您的手机号码。";
    [self addSubview:tipLabel2];
}

- (void)setSmsCodeBtnEnabled:(BOOL)smsCodeBtnEnabled{
    _smsCodeBtnEnabled = smsCodeBtnEnabled;
    [self.smsCodeBtn setEnabled:_smsCodeBtnEnabled];
    
}

- (void)setFinishBtnEnabled:(BOOL)finishBtnEnabled{
    _finishBtnEnabled = finishBtnEnabled;
    [self.finishBtn setEnabled:finishBtnEnabled];
}

- (void)setFinishBtnColor:(UIColor *)finishBtnColor{
    _finishBtnColor = finishBtnColor;
    self.finishBtn.backgroundColor = _finishBtnColor;
}



#pragma mark -BtnClick
- (void)onFinishBtnClick{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(onFinishBtnClickDelegate)]) {
        [self.delegate onFinishBtnClickDelegate];
    }
}

- (void)onSmsCodeBtnClick{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(onSmsCodeBtnClickDelegate)]) {
        [self.delegate onSmsCodeBtnClickDelegate];
    }
}

-(void)codeTextfieldChange:(UITextField *)TextField{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(codeTextfieldChangeDelegate:)]) {
        [self.delegate codeTextfieldChangeDelegate:TextField];
    }
}

-(void)numberTextfieldChange:(UITextField *)TextField{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(numberTextfieldChangeDelegate:)]) {
        [self.delegate numberTextfieldChangeDelegate:TextField];
    }
}



#pragma mark -SCTextFieldDelegate
- (void)scTextFieldDidBeginEditing:(SCTextField *)textField{
    
    if (self.codeTextfield == textField) {
        self.codeTextfield.scTextLineColor = [UIColor colorWithHexString:@"#1E90FF"];
        self.numberTextfield.scTextLineColor = [UIColor colorWithHexString:@"#d9d9d9"];
    }else if (self.numberTextfield == textField){
        self.codeTextfield.scTextLineColor = [UIColor colorWithHexString:@"#d9d9d9"];
        self.numberTextfield.scTextLineColor = [UIColor colorWithHexString:@"#1E90FF"];
    }
}

@end
