//
//  AppDelegate.h
//  DYWeibo
//
//  Created by YuLeiming on 19/11/2015.
//  Copyright © 2015 David.Yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainController *viewController;

@property (strong, nonatomic) UINavigationController *navController;

@end

