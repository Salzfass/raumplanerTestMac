//
//  ViewController.m
//  RaumplanerTest
//
//  Created by Vincent Rothe on 30.11.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import "ViewController.h"
#import "NSRConfig.h"
#import "Room.h"
#import "AppDelegate.h"

@implementation ViewController

@synthesize rooms;

- (void)refresh {
    [Room remoteAllAsync:^(NSArray *allRemote, NSError *error) {
        if (error) {
            NSLog(@"An error: %@", error);
        } else {
            self.rooms = [NSMutableArray arrayWithArray:allRemote];
            NSLog(@"Räume: %@", [rooms valueForKey:@"nummer"]);
        }
    }];
    
}

@end