//
//  ColouredCollectionView.m
//  RaumplanerTest
//
//  Created by Vincent Rothe on 01.12.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import "ColouredCollectionView.h"
#import "ColouredCollectionItem.h"
#import "HexColor.h"
#import "Room.h"

@implementation ColouredCollectionView

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
	[super drawRect:dirtyRect];
	
    // Drawing code here.
}

- (NSCollectionViewItem *)newItemForRepresentedObject:(id)object {
    NSCollectionViewItem *collItem = [super newItemForRepresentedObject:object];
    ColouredCollectionItem *colouredView = (ColouredCollectionItem *)collItem.view;
    NSColor *backgroundColor = [NSColor colorWithHexString:[(Room *)[collItem representedObject] color]];
    colouredView.backgroundColor = backgroundColor;
    return collItem;
}

@end
