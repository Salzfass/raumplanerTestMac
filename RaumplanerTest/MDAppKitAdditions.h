//
//  MDAppKitAdditions.h
//  
//
//  Created by Mark Douma on 6/4/2010.
//  Copyright (c) 2010 Mark Douma LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>



@interface NSWindow (MDAdditions)
- (CGFloat)toolbarHeight;
- (void)resizeToSize:(NSSize)newSize;
- (void)switchView:(NSView *)aView title:(NSString *)aString;
- (void)switchView:(NSView *)aView;
@end

