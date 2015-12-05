//
//  WBTabBarController.m
//  DYWeibo
//
//  Created by YuLeiming on 5/12/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import "WBTabBarController.h"
#import "WBTabBar.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "HomeViewController.h"
#import "UIColor+PXExtensions.h"
#import "ComposeViewController.h"

@interface WBTabBarController ()<WBTabBarDelegate>{

    HomeViewController * _homeViewController;
    MessageViewController * _messageViewController;
    DiscoverViewController * _discoverViewController;
    ProfileViewController * _profileViewController;
}

@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    _homeViewController = [[HomeViewController alloc] init];
    [self addChildViewController:_homeViewController];
    [self addChildController:_homeViewController title:@"首页" imageNormal:@"com_bt_tab_backlog_normal" imagePressed:@"com_bt_tab_backlog_pressed"];

    _messageViewController = [[MessageViewController alloc] init];
    [self addChildController:_messageViewController title:@"消息" imageNormal:@"com_bt_tab_backlog_normal" imagePressed:@"com_bt_tab_backlog_pressed"];

    _discoverViewController = [[DiscoverViewController alloc] init];
    [self addChildController:_discoverViewController title:@"发现" imageNormal:@"com_bt_tab_backlog_normal" imagePressed:@"com_bt_tab_backlog_pressed"];

    _profileViewController = [[ProfileViewController alloc] init];
    [self addChildController:_profileViewController title:@"个人" imageNormal:@"com_bt_tab_backlog_normal" imagePressed:@"com_bt_tab_backlog_pressed"];

    WBTabBar *tabBar = [[WBTabBar alloc] init];
    tabBar.tabBarDelegate = self;
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

#pragma mark - HWTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(WBTabBar *)tabBar
{
    ComposeViewController * composeViewController = [[ComposeViewController alloc] init];
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:composeViewController] animated:YES completion:nil];
}

/**
 * 添加子控制器到UITabBarController中
 */
- (void)addChildController:(UIViewController *)childViewController title:(NSString *)title imageNormal:(NSString *)image imagePressed:(NSString *) imagePressed
{
    // 设置子控制器，tabbar和navigationBar上的title
    childViewController.title = title;

    // 设置tabBarItem上默认的指示图片和选中时的图片
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:imagePressed] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    // 设置tabBarItem上文字的样式（这里是设置文字在不同状态下的颜色值）
    [childViewController.tabBarItem setTitleTextAttributes:
            @{NSForegroundColorAttributeName: [UIColor pxColorWithHexValue:@"#9c9c9c"]} forState:UIControlStateNormal];
    [childViewController.tabBarItem setTitleTextAttributes:
            @{NSForegroundColorAttributeName: [UIColor pxColorWithHexValue:@"#77d2c5"]} forState:UIControlStateSelected];

    // 使用系统默认的UINavigationController
    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:childViewController]];
}

@end
