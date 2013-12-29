//
//  CCAPI.m
//  ClassicCalendar
//
//  Created by Lexicss on 28.12.13.
//  Copyright (c) 2013 Lexicss. All rights reserved.
//

#import "CCAPI.h"
#import "CCMainViewController.h"

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)
#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

@interface CCAPI ()

@property(nonatomic, readonly) UINavigationController *navigationAPI;

@end

@implementation CCAPI
@synthesize navigationAPI;

static const int kCellWidth = 40;
static const int kCellHeight = 20;

static CCAPI *instance;

#pragma mark - Singleton

+ (CCAPI *)instance {
    return instance;
}

+ (UINavigationController *)navigationAPI {
    return [instance navigationAPI];
}

+ (void)initialize {
    instance = [CCAPI new];
}

#pragma mark - Constructor

- (id)init {
    self = [super init];
    
    if (self) {
        CCMainViewController *mainViewController = [[CCMainViewController alloc] initWithNibName:nil
                                                                                          bundle:nil];
        
        if (!navigationAPI) {
            navigationAPI = [[UINavigationController alloc] initWithRootViewController:mainViewController];
            [navigationAPI.topViewController setTitle:@"Calendar"];
        }
    }
    
    return self;
}

+ (CGSize)cellSize {
    return CGSizeMake(kCellWidth, kCellHeight);
}

+ (NSString *)nameForMonth:(NSInteger)month {
    switch (month) {
        case 1: return @"January";
        case 2: return @"February";
        case 3: return @"March";
        case 4: return @"April";
        case 5: return @"May";
        case 6: return @"June";
        case 7: return @"July";
        case 8: return @"August";
        case 9: return @"September";
        case 10: return @"October";
        case 11: return @"November";
        case 12: return @"December";
        default:
            return @"";
            break;
    }
}

@end
