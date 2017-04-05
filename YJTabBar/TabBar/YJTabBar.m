//
//  YJTabBar.m
//  YJTabBar
//
//  Created by Kingpin on 2017/4/5.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "YJTabBar.h"

#define SCALE [UIScreen mainScreen].bounds.size.width / 375

@interface YJTabBar ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation YJTabBar
// button的set方法
- (UIButton *)button {
    if (_button == nil) {
        CGFloat BtnWidth = self.frame.size.width / 5 - 10;
        self.button = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:self.button];
        self.button.frame = CGRectMake(0, 0, BtnWidth, BtnWidth);
        self.button.layer.cornerRadius = BtnWidth / 2;
        self.button.backgroundColor = [UIColor blackColor];
        UIImage *image = [[UIImage imageNamed:@"code"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [self.button setImage:image forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(centerAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnWidth = self.bounds.size.width / 5;
    CGFloat btnHeight = self.bounds.size.height;
    NSInteger i = 0;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i = 3;
            }
            view.frame = CGRectMake(i * btnWidth, 0, btnWidth, btnHeight);
            i++;
        }
    }
    CGFloat w = self.bounds.size.width;
    self.button.center = CGPointMake( w / 2, btnHeight - btnWidth / 2);
}

- (void)centerAction:(UIButton *)button {
    if ([self.tabBarDelegate respondsToSelector:@selector(selectCenterBtn:)]) {
        [self.tabBarDelegate selectCenterBtn:button];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint newPoint = [self.button convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.button.bounds, newPoint)) {
            view = self.button;
        }
    }
    return  view;
}

@end
