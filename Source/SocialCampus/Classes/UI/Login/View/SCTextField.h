//
//  SCInputTextView.h
//  SocialCampus
//
//  Created by LastDays on 16/10/25.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SCTextField;

@protocol SCTextFieldDelegate <NSObject>

@optional
- (void)scTextFieldDidBeginEditing:(SCTextField *)textField;

@end

@interface SCTextField : UIView<UITextFieldDelegate>

@property (weak  , nonatomic) id<SCTextFieldDelegate>     delegate;

//属性集

@property (strong, nonatomic) UIColor     *scTextColor;
@property (strong, nonatomic) UIColor     *scTintColor;
@property (assign, nonatomic) CGFloat     scTextFieldWidth;
@property (strong, nonatomic) UIColor     *scTextLineColor;
@property (strong, nonatomic) NSString    *scPlaceholder;


//native UI
@property (strong, nonatomic) UITextField *textField;
@property (strong, nonatomic) UILabel     *lineLabel;


- (instancetype)initWithFrame:(CGRect)frame secureTextEntry:(BOOL)secureTextEntry;

- (void)setSCTextFieldKeyboardType:(UIKeyboardType)KeyboardType;
@end
