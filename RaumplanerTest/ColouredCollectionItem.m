//
//  ColouredCollectionItem.m
//  RaumplanerTest
//
//  Created by Vincent Rothe on 01.12.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import "ColouredCollectionItem.h"

@implementation ColouredCollectionItem

@synthesize backgroundColor;

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
    NSRect rectWithPadding = NSMakeRect((self.bounds.origin.x + 10), (self.bounds.origin.y + 10), (self.bounds.size.width - 20), (self.bounds.size.height - 20));
    if (!backgroundColor) {
        self.backgroundColor = [NSColor whiteColor];
    }
    NSBezierPath* roundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect: rectWithPadding xRadius: 3 yRadius: 3];
    [self.backgroundColor setFill];
    [roundedRectanglePath fill];
}

@end