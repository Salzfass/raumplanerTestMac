//
//  Room.h
//  RaumplanerTest
//
//  Created by Vincent Rothe on 30.11.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import "NSRRemoteObject.h"

@interface Room : NSRRemoteObject

@property (nonatomic) int id;
@property (strong, nonatomic) NSString *nummer;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *color;
@property (strong, nonatomic) NSDate *created_at;
@property (strong, nonatomic) NSDate *updated_at;
@property (strong, nonatomic) NSString *place;

@end
