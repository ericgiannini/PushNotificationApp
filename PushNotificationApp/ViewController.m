//
//  ViewController.m
//  PushNotificationApp
//
//  Created by Eric Giannini on 12/1/15.
//  Copyright © 2015 Unicorn Mobile, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void) requestPermissionToNotify ;

- (void) createNotification:(int)secondsInTheFuture;


@end

@implementation ViewController

- (IBAction)scheduleNotification:(id)sender {
    
    [self requestPermissionToNotify];
    [self createNotification:5];
    
}

- (void)requestPermissionToNotify {
    
    UIMutableUserNotificationAction *backgroundAction = [[UIMutableUserNotificationAction alloc] init];
    
    backgroundAction.identifier = @"BACKGROUND_ACTION";
    backgroundAction.title = @"Background";
    backgroundAction.activationMode = UIUserNotificationActivationModeBackground;
    backgroundAction.destructive = YES;
    backgroundAction.authenticationRequired = NO;
    
    
    UIMutableUserNotificationAction *foregroundAction = [[UIMutableUserNotificationAction alloc] init];
    
    foregroundAction.identifier = @"FOREGROUND_ACTION";
    foregroundAction.title = @"Foreground";
    foregroundAction.activationMode = UIUserNotificationActivationModeForeground;
    foregroundAction.destructive = NO;
    foregroundAction.authenticationRequired = NO;
    
    
    UIMutableUserNotificationCategory *responsiveCategory = [[UIMutableUserNotificationCategory alloc] init];
    responsiveCategory.identifier = @"MAIN_CATEGORY";
    [responsiveCategory setActions:@[backgroundAction, foregroundAction] forContext:UIUserNotificationActionContextDefault];
    
    NSSet *categories = [NSSet setWithObjects:responsiveCategory, nil];
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert ;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void)createNotification:(int)secondsInTheFuture {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInTheFuture];
    localNotification.timeZone = nil;
    
    localNotification.alertTitle = @"Alert Title";
    localNotification.alertBody = @"Alert Body";
    localNotification.alertAction = @"Okay";
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = 4;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
