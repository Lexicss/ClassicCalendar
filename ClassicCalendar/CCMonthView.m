//
//  CCMonthView.m
//  ClassicCalendar
//
//  Created by Lexicss on 28.12.13.
//  Copyright (c) 2013 Lexicss. All rights reserved.
//

#import "CCMonthView.h"
#import "CCDayCellView.h"
#import "CCAPI.h"

#define ROWS 6
#define COLS 7

@implementation CCMonthView
@synthesize dayCells;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithPoint:(CGPoint)point withDay:(NSUInteger)day withMonth:(NSUInteger)month forYear:(NSUInteger)year showTitle:(BOOL)showTitle {
    CGSize cellSize = [CCAPI cellSize];
    
    NSInteger additionalRow = (showTitle ? 1 : 0);
    CGRect frame = CGRectMake(point.x, point.y, cellSize.width * COLS, cellSize.height * (ROWS + additionalRow));
    self = [super initWithFrame:frame];
    
    if (self) {
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:year];
        [comps setMonth:month];
        [comps setDay:1];
        
        NSDate *date = [calendar dateFromComponents:comps];
        NSRange currentRange = [calendar rangeOfUnit:NSDayCalendarUnit
                                               inUnit:NSMonthCalendarUnit
                                              forDate:date];
        NSUInteger numberOfDaysInMonth = currentRange.length;
        NSDateComponents *weekdayComps = [calendar components:NSWeekdayCalendarUnit
                                                     fromDate:date];
        
        int weekday = [weekdayComps weekday];//sunday - 1, monday - 2 ... saturday - 7
        NSInteger offset;
        NSInteger startDay;
        
        if (month == 1) {
            month = 12;
            year--;
        } else {
            month--;
        }
        
        NSDateComponents *previousComponents = [[NSDateComponents alloc] init];
        [previousComponents setYear:year];
        [previousComponents setMonth:month];
        [previousComponents setDay:1];
        NSDate *previousMonthDate = [calendar dateFromComponents:previousComponents];
        NSRange previousRange = [calendar rangeOfUnit:NSDayCalendarUnit
                                       inUnit:NSMonthCalendarUnit
                                      forDate:previousMonthDate];
        NSUInteger numberOfDaysInPreviousMonth = previousRange.length;
        
        if (weekday != 2) { // if not monday
            offset = (weekday == 1 ? 5 : weekday - 3);
        } else {
            offset = 6;
        }
        startDay = numberOfDaysInPreviousMonth - offset;
        
        NSInteger dayNumber = day + offset;
        NSInteger markI = dayNumber / COLS;
        NSInteger markJ = dayNumber % COLS;
        
        if (showTitle) {
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cellSize.width * COLS, cellSize.height)];
            [titleLabel setText:@"December"];
            [titleLabel setFont:[UIFont fontWithName:@"AmericanTypewriter" size:16]];
            [titleLabel setTextAlignment:NSTextAlignmentCenter];
            
            [self addSubview:titleLabel];
        }
        
        BOOL monthIsOverlapped = NO;
        
        for (NSInteger i = 0; i < ROWS; i++) {
            for (NSInteger j = 0; j < COLS; j++) {
                CCDayType dayType = TypeNormal;
                
                if (offset > -1 || monthIsOverlapped) {
                    dayType = TypeExcess;
                } else if (j == COLS - 2) {
                    dayType = TypeSaturday;
                } else if (j == COLS - 1) {
                    dayType = TypeHolidayOrSunday;
                }
                
                BOOL mark = (i == markI && j == markJ);
                CCDayCellView *dayView = [[CCDayCellView alloc] initWithPoint:CGPointMake(j * (cellSize.width - 1), (i + additionalRow) * (cellSize.height - 1))
                                                                     withDay:startDay
                                                                    withType:dayType
                                                                    withMark:mark];
                startDay++;
                offset--;
                
                if (offset == -1) {
                    startDay = 1;
                }
                if (startDay > numberOfDaysInMonth && i >= ROWS - 2) {
                    startDay = 1;
                    monthIsOverlapped = YES;
                }
                
                [self addSubview:dayView];
            }
        }
        
    }
    
    return self;
}

@end
