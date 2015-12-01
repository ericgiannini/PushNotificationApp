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


- (void)requestPermissionToNotify {
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert ;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}

- (void)createNotification:(int)secondsInTheFuture {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [[NSDate date] dateByAddingTimeInterval:secondsInTheFuture];
    
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
