//
//  CCAPI.h
//  ClassicCalendar
//
//  Created by Lexicss on 28.12.13.
//  Copyright (c) 2013 Lexicss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCAPI : NSObject

#pragma mark - Singleton

+ (CCAPI *)instance;
+ (UINavigationController *)navigationAPI;
+ (CGSize)cellSize;

@end
