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

@property (weak, nonatomic) IBOutlet UIButton *notifyBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_notifyBtn setTitle:@"15 Seconds Before Alert" forState:UIControlStateNormal       ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scheduleNotification:(id)sender {

    [self requestPermissionToNotify];
    [self createNotification:15];

}

- (void)requestPermissionToNotify {

    UIMutableUserNotificationAction *backgroundAction = [[UIMutableUserNotificationAction alloc] init];

    backgroundAction.identifier = @"BACKGROUND_ACTION";
    backgroundAction.title = @"Background";
    backgroundAction.activationMode = UIUserNotificationActivationModeBackground;
    backgroundAction.destructive = YES;
    backgroundAction.authenticationRequired = NO;

// If you would like to check whether the UIApplicationState is in the "Background", create this BOOL:
//     +(BOOL) runningInBackground
// {
//     UIApplicationState state = [UIApplication sharedApplication].applicationState;
//     BOOL result = (state == UIApplicationStateBackground);
//
//     return result;
// }

// ()___() BOOL
// < @ @ >
//  |   |
//  {o_o}
//   (|)



    UIMutableUserNotificationAction *foregroundAction = [[UIMutableUserNotificationAction alloc] init];

    foregroundAction.identifier = @"FOREGROUND_ACTION";
    foregroundAction.title = @"Foreground";
    foregroundAction.activationMode = UIUserNotificationActivationModeForeground;
    foregroundAction.destructive = NO;
    foregroundAction.authenticationRequired = NO;

// If you would like to check whether the UIApplicationState is in the "Foreground", create this BOOL:
// +(BOOL) runningInForeground
// {
//     UIApplicationState state = [UIApplication sharedApplication].applicationState;
//     BOOL result = (state == UIApplicationStateActive);
//
//     return result;
// }

// ()___() BOOL
// < @ @ >
//  |   |
//  {o_o}
//   (|)




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



@end
