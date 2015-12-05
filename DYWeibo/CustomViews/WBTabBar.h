//
//  WBTabBar.h
//  DYWeibo
//
//  Created by YuLeiming on 5/12/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBTabBar;

@protocol WBTabBarDelegate <UITabBarDelegate>

@optional
- (void) tabBarDidClickPlusButton:(WBTabBar *)tabBar;

@end

@interface WBTabBar : UITabBar

@property (nonatomic, weak) id<WBTabBarDelegate> tabBarDelegate;

@end
