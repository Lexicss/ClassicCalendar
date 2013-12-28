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

@end
