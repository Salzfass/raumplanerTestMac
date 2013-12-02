//
//  AppDelegate.m
//  RaumplanerTest
//
//  Created by Vincent Rothe on 30.11.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import "AppDelegate.h"
#import "NSRConfig.h"
#import "MDAppKitAdditions.h"


enum {
	raumViewTag,
	langzeitViewTag,
    stundenViewTag
};

@implementation AppDelegate

@synthesize window, viewController, toolbarSubview, roomsView, mainContentView, loginView, passwordField, usernameField, isLoggedIn, navSegmentedControl;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setupWindowTitlebar];
    self.isLoggedIn = NO;
    [self updateControlsAfterAuthentication];
    [[NSRConfig defaultConfig] setAppURL:@"http://rb.wichern-schule.de"];
    [[NSRConfig defaultConfig] configureToRailsVersion:NSRRailsVersion3];
    
//    [[NSRConfig defaultConfig] setAppUsername:@"Salzfass"];
//    [[NSRConfig defaultConfig] setAppPassword:@"!Mandel32"];
    
    self.viewController = [[ViewController alloc] init];
    [self.mainContentView addSubview:loginView];
    [loginView setFrame:self.mainContentView.frame];
    [loginView setBounds:self.mainContentView.bounds];
    [loginView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    
}

- (void)setupCloseButton {
    INWindowButton *closeButton = [INWindowButton windowButtonWithSize:NSMakeSize(14, 16) groupIdentifier:nil];
    closeButton.activeImage = [NSImage imageNamed:@"button-active"];
    closeButton.activeNotKeyWindowImage = [NSImage imageNamed:@"button-active"];
    closeButton.inactiveImage = [NSImage imageNamed:@"button-active"];
    closeButton.pressedImage = [NSImage imageNamed:@"close-pressed"];
    closeButton.rolloverImage = [NSImage imageNamed:@"close-rollover"];
    self.window.closeButton = closeButton;
}

- (void)setupMinimizeButton {
    INWindowButton *button = [INWindowButton windowButtonWithSize:NSMakeSize(14, 16) groupIdentifier:nil];
    button.activeImage = [NSImage imageNamed:@"button-active"];
    button.activeNotKeyWindowImage = [NSImage imageNamed:@"button-active"];
    button.inactiveImage = [NSImage imageNamed:@"button-active"];
    button.pressedImage = [NSImage imageNamed:@"minimize-pressed"];
    button.rolloverImage = [NSImage imageNamed:@"minimize-rollover"];
    self.window.minimizeButton = button;
}

- (void)setupZoomButton {
    INWindowButton *button = [INWindowButton windowButtonWithSize:NSMakeSize(14, 16) groupIdentifier:nil];
    button.activeImage = [NSImage imageNamed:@"button-active"];
    button.activeNotKeyWindowImage = [NSImage imageNamed:@"button-active"];
    button.inactiveImage = [NSImage imageNamed:@"button-active"];
    button.pressedImage = [NSImage imageNamed:@"zoom-pressed"];
    button.rolloverImage = [NSImage imageNamed:@"zoom-rollover"];
    self.window.zoomButton = button;
}

- (void)setupWindowTitlebar {
    //[self.window setBackgroundColor:[NSColor colorWithCalibratedRed: 0.831 green: 0.878 blue: 0.902 alpha: 1]];
    [self.window setBackgroundColor:[NSColor whiteColor]];
    
    self.window.trafficLightButtonsLeftMargin = 7.0;
    self.window.fullScreenButtonRightMargin = 7.0;
    self.window.centerFullScreenButton = YES;
    self.window.titleBarHeight = 40.0;
    self.window.titleBarDrawingBlock = ^(BOOL drawsAsMainWindow, CGRect drawingRect, CGPathRef clippingPath) {
        CGContextRef ctx = [[NSGraphicsContext currentContext] graphicsPort];
        CGContextAddPath(ctx, clippingPath);
        CGContextClip(ctx);
        
        NSGradient *gradient = nil;
        if (drawsAsMainWindow) {
            gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedRed: 0.255 green: 0.616 blue: 0.357 alpha: 1]
                                                     endingColor:[NSColor colorWithCalibratedRed: 0.255 green: 0.616 blue: 0.357 alpha: 1]];
            [[NSColor darkGrayColor] setFill];
        } else {
            // set the default non-main window gradient colors
            gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.851f alpha:1]
                                                     endingColor:[NSColor colorWithCalibratedWhite:0.929f alpha:1]];
            [[NSColor colorWithCalibratedWhite:0.6f alpha:1] setFill];
        }
        [gradient drawInRect:drawingRect angle:90];
        NSRectFill(NSMakeRect(NSMinX(drawingRect), NSMinY(drawingRect), NSWidth(drawingRect), 1));
    };
    [self setupCloseButton];
    [self setupMinimizeButton];
    [self setupZoomButton];
    
    [self.window.titleBarView addSubview:self.toolbarSubview];
}


- (IBAction)refresh:(id)sender {
    if (self.isLoggedIn) {
        [viewController refresh];
    }
}

- (IBAction)segmentedAction:(NSSegmentedControl *)sender {
    NSInteger tag = sender.selectedSegment;
    NSView *targetView = nil;
	
	switch (tag) {
		case raumViewTag : targetView = self.roomsView; [self refresh:nil]; break;
            
		default:
			break;
	}
    [[self.mainContentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.mainContentView addSubview:targetView];
    [targetView setFrame:self.mainContentView.frame];
    [targetView setBounds:self.mainContentView.bounds];
    [targetView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
 
    
}
- (IBAction)performLogin:(id)sender {
    if ([usernameField.stringValue isNotEqualTo:@""] || [passwordField.stringValue isNotEqualTo:@""]) {
        [[NSRConfig defaultConfig] setAppUsername:usernameField.stringValue];
        [[NSRConfig defaultConfig] setAppPassword:passwordField.stringValue];
        self.isLoggedIn = YES;
    }
    [self updateControlsAfterAuthentication];
}

- (void)updateControlsAfterAuthentication {
    if (self.isLoggedIn) {
        [navSegmentedControl setEnabled:YES];
    } else {
        [navSegmentedControl setEnabled:NO];
    }
}
@end
