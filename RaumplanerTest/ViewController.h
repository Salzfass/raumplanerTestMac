//
//  ViewController.h
//  RaumplanerTest
//
//  Created by Vincent Rothe on 30.11.13.
//  Copyright (c) 2013 Vincent Rothe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDAppKitAdditions.h"

@interface ViewController : NSObject

@property (strong, nonatomic) NSMutableArray *rooms;

- (void)refresh;

@end
