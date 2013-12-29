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

static const int kCellWidth_iphone = 40;
static const int kCellHeight_iphone = 20;

static const int kCellWidth_ipad = 100;
static const int kCellHeight_ipad = 40;

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
    if (IS_IPAD) {
        return CGSizeMake(kCellWidth_ipad, kCellHeight_ipad);
    } else {
        return CGSizeMake(kCellWidth_iphone, kCellHeight_iphone);
    }
}

+ (CGFloat)fontSize {
    CGFloat height = (IS_IPAD ? kCellHeight_ipad : kCellHeight_iphone);
    height -= height / 5;
    
    return height;
}

+ (NSString *)nameForMonth:(NSInteger)month withYear:(NSInteger)year {
    NSString *monthName;
    
    switch (month) {
        case 1: monthName = @"January"; break;
        case 2: monthName = @"February"; break;
        case 3: monthName = @"March"; break;
        case 4: monthName = @"April"; break;
        case 5: monthName = @"May"; break;
        case 6: monthName = @"June"; break;
        case 7: monthName = @"July"; break;
        case 8: monthName = @"August"; break;
        case 9: monthName = @"September"; break;
        case 10: monthName = @"October"; break;
        case 11: monthName = @"November"; break;
        case 12: monthName = @"December"; break;
        default:
            return monthName = @"";
            break;
    }
    
    return [NSString stringWithFormat:@"%@, %d", monthName, year];
}

@end
