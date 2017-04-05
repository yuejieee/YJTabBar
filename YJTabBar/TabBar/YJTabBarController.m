//
//  YJTabBarController.m
//  YJTabBar
//
//  Created by Kingpin on 2017/4/5.
//  Copyright © 2017年 yuejieee. All rights reserved.
//

#import "YJTabBarController.h"
#import "YJTabBar.h"

#define SELECTED_COLOR  [UIColor blackColor]
#define DESELECTED_COLOR [UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1]

@interface YJTabBarController () <YJTabBarDelegate>
@end

@implementation YJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    YJTabBar *tabBar = [YJTabBar new];
    tabBar.frame = self.tabBar.frame;
    tabBar.tabBarDelegate = self;
    [self setValue:tabBar forKey:@"tabBar"];
    
    [self setupSubviews];
}

- (void)setupSubviews {
    UIViewController *first = [UIViewController new];
    [self addChildController:first image:[UIImage imageNamed:@"first_un"] selectedImage:[UIImage imageNamed:@"first"] title:@"first"];
    UIViewController *second = [UIViewController new];
    [self addChildController:second image:[UIImage imageNamed:@"second_un"] selectedImage:[UIImage imageNamed:@"second"] title:@"second"];
    UIViewController *third = [UIViewController new];
    [self addChildController:third image:[UIImage imageNamed:@"third_un"] selectedImage:[UIImage imageNamed:@"third"] title:@"third"];
    UIViewController *fourth = [UIViewController new];
    [self addChildController:fourth image:[UIImage imageNamed:@"fourth_un"] selectedImage:[UIImage imageNamed:@"fourth"] title:@"fourth"];
}

- (void)addChildController:(UIViewController *)controller image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title {
    controller.view.backgroundColor = [UIColor whiteColor];
    controller.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SELECTED_COLOR, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:DESELECTED_COLOR, NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    controller.title = title;
    
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:navigationVC];
}

- (void)selectCenterBtn:(UIButton *)button {
    NSLog(@"testCenterButton");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
