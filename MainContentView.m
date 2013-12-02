//
//  MainContentView.m
//  RaumplanerTest
//
//  Created by Vincent Rothe on 01.12.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import "MainContentView.h"

@implementation MainContentView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSRect bounds = self.bounds;
    [[NSColor colorWithCalibratedRed: 0.831 green: 0.878 blue: 0.902 alpha: 1] set];
    [NSBezierPath fillRect:bounds];
}

@end
