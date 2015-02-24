//
//  SSAppDelegate.m
//  stephen
//
//  Created by Stephen Silber on 2/23/15
//  Copyright (c) 2015 stephensilber. All rights reserved.
//

#import "SSAppDelegate.h"
#import "SSChatTableViewController.h"

#ifdef DEBUG

#endif

#define TEST_VIEW_CONTROLLER 0

#if !defined(DEBUG) && TEST_VIEW_CONTROLLER
#error You can only run tests in debug mode. Please set TEST_VIEW_CONTROLLER to 0 in SCUAppDelegate.m.
#endif

@implementation SSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
#ifdef DEBUGpau
    //-------------------------------------------------------------------
    // Do things that are only for debugging
    //-------------------------------------------------------------------
#endif
    
    [application setStatusBarHidden:NO];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
#if TEST_VIEW_CONTROLLER
//    MBSignInViewController *signInViewController = [[MBSignInViewController alloc] init];
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:signInViewController];
//    self.window.rootViewController = navigationController;
#else
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    SSChatTableViewController *chatViewController = [[SSChatTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *chatNavController = [[UINavigationController alloc] initWithRootViewController:chatViewController];
    tabBarController.viewControllers = @[chatNavController];
    
    [self setAppearance];
    
    self.window.rootViewController = tabBarController;
#endif
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - Appearance

- (void)setAppearance {
    // Override colors and appearance values here
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent];
    self.window.tintColor = [UIColor whiteColor];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.871 green:0.114 blue:0.236 alpha:1.000]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setOpaque:YES];
    [[UINavigationBar       appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UITextField appearance] setTintColor:[UIColor whiteColor]];
}

@end
