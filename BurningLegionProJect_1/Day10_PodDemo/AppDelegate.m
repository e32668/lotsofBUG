//
//  AppDelegate.m
//  Day10_PodDemo
//
//  Created by tarena on 16/9/12.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "NewListViewController.h"
#import "PageViewController.h"
#import "NorthNavController.h"
#import "LeftController.h"
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //所有通过`AF`框架发送的网络请求,都有状态栏的菊花繁忙提示
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    [UIImageView appearance].clipsToBounds = YES;
    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
    PageViewController *pvc = [[PageViewController alloc]init];
    pvc.menuViewStyle = WMMenuViewStyleLine;
    pvc.titleColorSelected = [UIColor orangeColor];
    LeftController *LeftVc = [[LeftController alloc]initWithStyle:UITableViewStyleGrouped];
    
    UINavigationController *PageNaviVC = [[NorthNavController alloc]initWithRootViewController:pvc];
    UINavigationController *LeftNaviVC = [[NorthNavController alloc]initWithRootViewController:LeftVc];
    pvc.navigationItem.title = @"南方周末";
    //pvc.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"titleImg.png"]];
    pvc.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    pvc.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.659 green:0.047 blue:0.039 alpha:1.000];
    
    MMDrawerController *drawer = [[MMDrawerController alloc]initWithCenterViewController:PageNaviVC leftDrawerViewController:LeftNaviVC];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:drawer];

    [self.window makeKeyAndVisible];
//    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:pvc];
//    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
