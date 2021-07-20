//
//  AppDelegate.m
//  InputEmojiExample
//
//  Created by zorro on 15/3/6.
//  Copyright (c) 2015年 tutuge. All rights reserved.
//

#import "AppDelegate.h"
@import Pendo;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    if ([[url scheme] containsString:@"pendo"]) {
        [[PendoManager sharedManager] initWithUrl:url];
        return YES;
    }
    //  your code here ...
    return YES;
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts  API_AVAILABLE(ios(13.0)){
    NSURL * url = URLContexts.allObjects[0].URL;
    if ([[url scheme] containsString:@"pendo"]) {
        [[PendoManager sharedManager] initWithUrl:url];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    PendoInitParams *initParams = [[PendoInitParams alloc] init];
    [initParams setVisitorId:@"Ying Zhou"];
    [initParams setVisitorData:@{@"Age":@38, @"Country":@"China", @"Gender":@"Male"}];
    [initParams setAccountId:@"ACME"];
    [initParams setAccountData:@{@"Tier":@1, @"Timezone":@"CST", @"Size":@"Enterprise"}];

    NSString * appKey = @"eyJhbGciOiJSUzI1NiIsImtpZCI6IiIsInR5cCI6IkpXVCJ9.eyJkYXRhY2VudGVyIjoidXMiLCJrZXkiOiIzNjk0ZWNlYzk1NzI0M2U3Y2RiZWJlMWNiYjI5M2ExNGM5NTYxYzAxMTAyMzI1YWExZWQxZTQ5MjNmMTkyYzA2MTBhYzYzZmQyYjk1MjFmNmM5MTFiYTgyNjA5NmExNDgzMjQ5NGEzMGE3ZTcyZjY5M2I1NzYyY2Q1NjJlNjFjOS43YzI2MWRhMmExNzEyYzZjNjg3NzBmN2M1YzA5ZWUwYi4yZDhmYzllYWExOWJkMTIzYjljYzliYTE4YWM2NDQ3ZTQyNGVhOThjMTU3ODhmMmIzODgzZDU1YWNiMDE4NDVmIn0.RmsEgAlWWtnLF4JEupxQyot9ohqfcgqn04U-AKOT8ZHH471D3iXDYcd1hopyhnf8FvETn_tC6DMg04JzB1XrETvpsqnXmKT58-Lc--eNCiyIzrsDB7JOkHCxI7zQ3Ixf5C9jBdvZZ4whdA0V66T_KEhoGMGAajb3ify3CDNjPeo";
    [[PendoManager sharedManager] initSDK: appKey
                                  initParams: initParams];
    
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
