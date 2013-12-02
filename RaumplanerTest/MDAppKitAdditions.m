//
//  MDAppKitAdditions.m
//  
//
//  Created by Mark Douma on 6/4/2010.
//  Copyright (c) 2010 Mark Douma LLC. All rights reserved.
//

#import "MDAppKitAdditions.h"


#define MD_DEBUG 0


static NSView *blankView() {
	static NSView *view = nil;
	if (view == nil)view = [[NSView alloc] init];
	return view;
} 

@implementation NSWindow (MDAdditions)

- (CGFloat)toolbarHeight {
	NSToolbar *toolbar = self.toolbar;
	CGFloat toolbarHeight = 0.0;
	
	if (toolbar && toolbar.isVisible) {
		NSRect windowFrame = [[self class] contentRectForFrameRect:self.frame styleMask:self.styleMask];
		toolbarHeight = NSHeight(windowFrame) - NSHeight([self.contentView frame]);
	}
	return toolbarHeight;
}

- (void)resizeToSize:(NSSize)newSize {
	CGFloat newHeight = newSize.height + [self toolbarHeight];
	CGFloat newWidth = newSize.width;
	NSRect aFrame = [[self class] contentRectForFrameRect:self.frame styleMask:self.styleMask];
	aFrame.origin.y += aFrame.size.height;
	aFrame.origin.y -= newHeight;
	aFrame.size.height = newHeight;
	aFrame.size.width = newWidth;
	aFrame = [[self class] frameRectForContentRect:aFrame styleMask:self.styleMask];
	[self setFrame:aFrame display:YES animate:YES];
}

- (void)switchView:(NSView *)aView title:(NSString *)aString {
	if (self.contentView != aView) {
		[self setContentView:blankView()];
		[self setTitle:NSLocalizedString(aString, @"")];
		[self resizeToSize:aView.frame.size];
		[self setContentView:aView];
	}
}

- (void)switchView:(NSView *)aView {
	if (self.contentView != aView) {
		[self setContentView:blankView()];
		[self resizeToSize:[aView frame].size];
		[self setContentView:aView];
	}
}

@end

