//
//  SCNavigationBar.m
//  SocialCampus
//
//  Created by LastDays on 16/10/21.
//  Copyright © 2016年 lastday. All rights reserved.
//

#import "SCNavigationBar.h"
#define MLNavigationBarHomeLeftViewTag (998)
#define HOME_LEFTBAR_LEFT 12
#define HOME_LEFTBAR_LEFT 12


@interface SCNavigationBar()

@property(nonatomic, strong) CALayer *extraColorLayer;

@end

@implementation SCNavigationBar

- (void)setBarTintColor:(UIColor *)barTintColor{
    [super setBarTintColor:barTintColor];
    if (self.extraColorLayer == nil) {
        self.extraColorLayer = [CALayer layer];
        self.extraColorLayer.opacity = 1;
        [self.layer addSublayer:self.extraColorLayer];
    }
    self.extraColorLayer.backgroundColor = barTintColor.CGColor;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}
@end
