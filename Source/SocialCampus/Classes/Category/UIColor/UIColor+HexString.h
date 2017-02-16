//
//  UIColor+HexString.h
//  SocialCampus
//
//  Created by LastDays on 16/10/23.
//  Copyright © 2016年 lastday. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIColor (HexString)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

@end
