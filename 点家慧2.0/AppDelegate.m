//
//  AppDelegate.m
//  点家慧2.0
//
//  Created by app on 17/5/10.
//  Copyright © 2017年 inwhoop.com. All rights reserved.
//

#import "AppDelegate.h"
#import "Main__ViewController.h"
#import "AppDelegate.h"
#import "message__ViewController.h"
#import "My__ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    /**
     *  创建tabbar来装 首页，消息页面，我的页面
     */
    
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    tabBar.tabBar.tintColor = UIColorFromRGB(0x31cdaa);
    //首页
    Main__ViewController *mainVC = [[Main__ViewController alloc]init];
//    mainVC.title = @"首页";
    
    //消息
    message__ViewController *messageVC = [[message__ViewController alloc]init];
    messageVC.view.backgroundColor = [UIColor whiteColor];
    //我的
    My__ViewController *myVC = [[My__ViewController alloc]init];
    
    //最下方Bar的图片
    //mainvc
    UIImage *img1=[[UIImage imageNamed:[NSString stringWithFormat:@"home@3x"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img2=[[UIImage imageNamed:[NSString stringWithFormat:@"home_page@3x"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mainVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:img1 selectedImage:img2];
    //message_vc
    UIImage *img3=[[UIImage imageNamed:[NSString stringWithFormat:@"news@3x"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img4=[[UIImage imageNamed:[NSString stringWithFormat:@"news@3x"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:img3 selectedImage:img4];
    //myVC
    UIImage *img5=[[UIImage imageNamed:[NSString stringWithFormat:@"my@3x"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *img6=[[UIImage imageNamed:[NSString stringWithFormat:@"expression@3x"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:img5 selectedImage:img6];
    
    //修改Bar的字体
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont   systemFontOfSize:12]}   forState:UIControlStateNormal];
    /**
     *  通过 NAV 包装起来
     */
    UINavigationController *mainNav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    UINavigationController *messageNav = [[UINavigationController alloc]initWithRootViewController:messageVC];
    UINavigationController *myNav = [[UINavigationController alloc]initWithRootViewController:myVC];
    /**
     *  将 Nav 装入 TabBar 之中
     */
    [tabBar addChildViewController:mainNav];
    [tabBar addChildViewController:messageNav];
    [tabBar addChildViewController:myNav];
//    [tabBar addChildViewController:vc ];
    
  
    /**
     * 移交控制权限给 TabBar
     */
    self.window.rootViewController = tabBar;
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
