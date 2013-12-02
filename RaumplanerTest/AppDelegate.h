//
//  AppDelegate.h
//  RaumplanerTest
//
//  Created by Vincent Rothe on 30.11.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "INAppStoreWindow.h"
#import "ViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSView *toolbarSubview;

@property (weak) IBOutlet NSView *roomsView;
@property (weak) IBOutlet NSView *loginView;
@property (weak) IBOutlet NSView *mainContentView;

@property (weak) IBOutlet NSTextField *usernameField;
@property (weak) IBOutlet NSSecureTextField *passwordField;
- (IBAction)performLogin:(id)sender;
@property (nonatomic) BOOL isLoggedIn;

@property (assign) IBOutlet INAppStoreWindow *window;
@property (strong, nonatomic) ViewController *viewController;


- (IBAction)refresh:(id)sender;
- (IBAction)segmentedAction:(NSSegmentedControl *)sender;
@property (weak) IBOutlet NSSegmentedControl *navSegmentedControl;

@end
