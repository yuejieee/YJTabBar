//
//  YJTabBar.h
//  YJTabBar
//
//  Created by Kingpin on 2017/4/5.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YJTabBar;

@protocol YJTabBarDelegate <NSObject>

- (void)selectCenterBtn:(UIButton *)button;

@end

@interface YJTabBar : UITabBar

@property (nonatomic, weak) id<YJTabBarDelegate>tabBarDelegate;

@end
