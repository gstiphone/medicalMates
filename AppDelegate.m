//
//  AppDelegate.m
//  MedicalMates
//
//  Created by User on 03/02/15.
//  Copyright (c) 2015 User. All rights reserved.
//

#import "AppDelegate.h"
#import "Global.h"
#import "ReferApatientVC.h"
#import "AppointmentConformationVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) {
//#ifdef __IPHONE_8_0
//        UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert) categories:nil];
////        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForType:( UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound                   |UIRemoteNotificationTypeAlert) categories:nil];
//        [application registerUserNotificationSettings:setting];
//#endif
//    }
//else {
//        UIRemoteNotificationType myTypes = UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound;
//        [application registerForRemoteNotificationTypes:myTypes];
//    
//    return YES;
//}
    
    
//    UIUserNotificationType types = UIUserNotificationTypeBadge |
//    UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
//    
//    UIUserNotificationSettings *mySettings =
//    [UIUserNotificationSettings settingsForTypes:types categories:nil];
//    
//    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
//    [application registerForRemoteNotifications];
//    
//    UIRemoteNotificationType enabledTypes = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    
    
    
    
    
    
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
   
    
    
    
    
    

    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)])
    {
        // iOS 8 Notifications
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [application registerForRemoteNotifications];
    }
    else
    {
        // iOS < 8 Notifications
        [application registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }
    return YES;
    
    }


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", token);
    
    
    NSString *tokenStr = [deviceToken description];
    NSString *pushToken = [[[tokenStr
                             stringByReplacingOccurrencesOfString:@"<" withString:@""]
                            stringByReplacingOccurrencesOfString:@">" withString:@""]
                           stringByReplacingOccurrencesOfString:@" " withString:@""] ;
    
    NSLog(@"%@",pushToken);
    
    [MedicalMatesDetails setObject:pushToken forKey:@"DeviceToken"];
    NSLog(@"%@",[MedicalMatesDetails valueForKey:@"DeviceToken"]);
    

}


    // Delegation methods
//    - (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
//        const void *devTokenBytes = [devToken bytes];
////       self.registered = YES;
////        [self sendProviderDeviceToken:devTokenBytes]; // custom method
//    }

    - (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
        NSLog(@"Error in registration. Error: %@", err);
    }
    
    
//    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)])
//        
//    {
//        
//        UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound);
//        
//        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes categories:nil];
//        
//        [application registerUserNotificationSettings:settings];
//        
//        [application registerForRemoteNotifications];
//        
//    }
//    
//    else
//        
//    {
//        
//        // Register for Push Notifications, if running iOS version < 8
//        
//        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
//        
//    }
//    
    
    
    
    
    
    
    
    

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


//-(void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo
//{
//    if([app applicationState] == UIApplicationStateInactive)
//    {
//        //If the application state was inactive, this means the user pressed an action button
//        // from a notification.
//        
//        //Handle notification
//    }
//}





//#ifdef __IPHONE_8_0
//- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
//
//{
//    //register to receive notifications
////    [application registerForRemoteNotifications];
//    NSData*deviceToken;
//    NSLog(@"My token is: %@", deviceToken);
//    
//    NSString *deviceID = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//    deviceID = [deviceID stringByReplacingOccurrencesOfString:@" " withString:@""];
//
//    
//}
//
//- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler
//{
//    //handle the actions
//    if ([identifier isEqualToString:@"declineAction"]){
//    }
//    else if ([identifier isEqualToString:@"answerAction"]){
//    }
//}
//
////- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
////{
////    [self applicationDidFinishLaunching:application];
////    
////    if (launchOptions != nil)
////    {
////        NSDictionary* dictionary = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
////        if (dictionary != nil)
////        {
////            // get the necessary information out of the dictionary
////            // (the data you sent with your push message)
////            // and load your data
////        }
////    }
////    return YES;
////}
//
//// will be called when in foreground
//- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
//    // get the necessary information out of the dictionary
//    // (the data you sent with your push message)
//    // and load your data
//}
//
////- (void)application:(UIApplication *)applicationdidRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
////{
////  
////}
////
////- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
////{
//    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
//    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"content---%@", token);
//    
//    
//    NSString *tokenStr = [deviceToken description];
//    NSString *pushToken = [[[tokenStr
//                              stringByReplacingOccurrencesOfString:@"<" withString:@""]
//                             stringByReplacingOccurrencesOfString:@">" withString:@""]
//                            stringByReplacingOccurrencesOfString:@" " withString:@""] ;
////
////    
////    
////}
//
//

- (void) someMethod
{
    
    // All instances of TestClass will be notified
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"TestNotification"
     object:self];
    
}



-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
    MedicalMatesDetails = [NSUserDefaults standardUserDefaults];
    //When notification is pressed on background it will enter here
    NSLog(@"%@",userInfo);
    
    NSDictionary *dic = userInfo;
    NSLog(@"%@",dic);
    
    NSDictionary *apsInfo = [dic valueForKey:@"aps"];
    NSLog(@"%@",apsInfo);
    
    NSString*str = [apsInfo valueForKey:@"appid"];
    NSLog(@"%@",str);
    
//   NSString* amo=[str stringByReplacingOccurrencesOfString:@"You Have a New Appointment. Appointment id is" withString:@""];
//    
//     NSLog(@"%@",amo);
    [MedicalMatesDetails setObject:str forKey:@"app_id"];
    if(apsInfo) {
        
        
    }
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"TestNotification"
     object:self];
    
    
//    [self someMethod];
    
//    UIStoryboard *mainstoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    AppointmentConformationVC* pvc = [mainstoryboard instantiateViewControllerWithIdentifier:@"AppointmentConformationVC"];
//    [MedicalMatesDetails setObject:amo forKey:@"app_id"];
//    [self.window.rootViewController presentViewController:pvc animated:YES completion:NULL];
    
    //self.viewController = [[ReferApatientVC alloc] initWithNibName:@"ReferApatientVC" bundle:nil];
    
    NSString *message = nil;
    id alert = [userInfo objectForKey:@"alert"];
    if ([alert isKindOfClass:[NSString class]]) {
        message = alert;
    } else if ([alert isKindOfClass:[NSDictionary class]]) {
        message = [alert objectForKey:@"body"];
    }
    if (alert) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title"
                                                            message:@"AThe message."  delegate:self
                                                  cancelButtonTitle:@"button 1"
                                                  otherButtonTitles:@"button", nil];
        [alertView show];
    }
    
    //Get strings based on information on your json payload for example
    if([[userInfo objectForKey:@"keyword"] isEqualToString:@"value"])
    {
        //redirect/push a screen here for example
    }
}




@end
