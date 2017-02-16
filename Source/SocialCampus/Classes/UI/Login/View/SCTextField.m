//
//  SCInputTextView.m
//  SocialCampus
//
//  Created by LastDays on 16/10/25.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCTextField.h"
#import "UIColor+HexString.h"


#define SCInputTextViewTopPadding 8
#define SCInputTextViewLeftPadding 16
#define SCInputTextViewWidth self.frame.size.width-SCInputTextViewLeftPadding*2
#define SCInputTextViewHeight 40-SCInputTextViewTopPadding*2


@implementation SCTextField


- (instancetype)initWithFrame:(CGRect)frame secureTextEntry:(BOOL)secureTextEntry
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUIWitHsecureTextEntry:secureTextEntry];
    }
    return self;
}



//构建UI
- (void)buildUIWitHsecureTextEntry:(BOOL)secureTextEntry{
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(SCInputTextViewLeftPadding, SCInputTextViewTopPadding, SCInputTextViewWidth, SCInputTextViewHeight)];
    _textField.tintColor = [UIColor whiteColor];
    _textField.textColor = [UIColor blackColor];
    _textField.delegate = self;
    _textField.secureTextEntry = secureTextEntry;
    _textField.font = [UIFont systemFontOfSize:18];
    _textField.returnKeyType = UIReturnKeyGo;
    _textField.delegate = self;
    
//    [_textField addTarget:self action:@selector(codeTextfieldChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self addSubview:_textField];

    _lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCInputTextViewLeftPadding, SCInputTextViewTopPadding+SCInputTextViewHeight+3, SCInputTextViewWidth, 1)];
    _lineLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.lineLabel];
    [self.textField setClearButtonMode:UITextFieldViewModeWhileEditing];

}

- (void)setSCTextFieldKeyboardType:(UIKeyboardType)KeyboardType{
    self.textField.keyboardType = KeyboardType;
}



- (void)setScTextColor:(UIColor *)scTextColor{
    _scTextColor = scTextColor;
    self.textField.textColor = _scTextColor;
}

- (void)setScTintColor:(UIColor *)scTintColor{
    _scTintColor = scTintColor;
    self.textField.tintColor = scTintColor;
}

- (void)setScTextFieldWidth:(CGFloat)scTextFieldWidth{
    _scTextFieldWidth = scTextFieldWidth;
    
    // 1. 用一个临时变量保存返回值。
    CGRect temp = self.textField.frame;
    
    // 2. 给这个变量赋值。因为变量都是L-Value，可以被赋值
    temp.size.width = _scTextFieldWidth;
    
    // 3. 修改frame的值
    self.textField.frame = temp;
}

- (void)setScTextLineColor:(UIColor *)scTextLineColor{
    _scTextLineColor = scTextLineColor;
    self.lineLabel.backgroundColor = _scTextLineColor;
}

- (void)setScPlaceholder:(NSString *)scPlaceholder{
    
    _scPlaceholder = scPlaceholder;
    self.textField.placeholder = _scPlaceholder;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if(self.delegate&&[self.delegate respondsToSelector:@selector(scTextFieldDidBeginEditing:)]){
        [self.delegate scTextFieldDidBeginEditing:self];
    }
}


//-(void)codeTextfieldChange:(UITextField *)TextField{
//    NSLog(@"koko");
//}

@end
