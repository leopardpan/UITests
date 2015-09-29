//
//  AppDelegate.m
//  UITestingDemo
//
//  Created by 潘柏信 on 15/9/28.
//  Copyright © 2015年 leopardpan. All rights reserved.
//

#import "AppDelegate.h"
#import "TalkingData.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

// AppID 只要拥有AppID，就可以在这个账号上，更改这个AppID的所有东西。
#define AppID @"05DB565D44051573C597616275F51EC2"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [self setupTalkingData];
    // Override point for customization after application launch.
    return YES;
}

- (void)setupTalkingData {

    // 开启App崩溃捕捉功功能  默认是NO
    [TalkingData setExceptionReportEnabled:YES];
    // 开启TalkingData内部，日志输出  默认是YES
    [TalkingData setLogEnabled:YES];
    
    // 初始化SDK，只要调用了这一接口，就集成了灵动分析功能。
    [TalkingData sessionStarted:AppID withChannelId:@"Github"];
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
