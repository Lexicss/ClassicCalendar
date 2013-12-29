//
//  CCDayCellView.m
//  ClassicCalendar
//
//  Created by Lexicss on 28.12.13.
//  Copyright (c) 2013 Lexicss. All rights reserved.
//

#import "CCDayCellView.h"
#import "CCAPI.h"

#define DAY_FONT [UIFont fontWithName:@"AmericanTypewriter" size:16]

@interface CCDayCellView ()

@property(nonatomic, strong) UILabel *dayLabel;

@end

@implementation CCDayCellView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithPoint:(CGPoint)point withDay:(NSUInteger)day withType:(CCDayType)dayType withMark:(BOOL)mark {
    CGSize cellSize = [CCAPI cellSize];
    CGRect frame = CGRectMake(point.x, point.y, cellSize.width, cellSize.width);
    self = [super initWithFrame:frame];
    
    if (self) {
        UIColor *color;
        UIColor *bgColor = (mark ? [UIColor cyanColor] : [UIColor clearColor]);
        
        switch (dayType) {
            case TypeSaturday:
                color = [UIColor purpleColor];
                break;
            case TypeHolidayOrSunday:
                color = [UIColor redColor];
                break;
            case TypeExcess:
                color = [UIColor grayColor];
                break;
            case TypeExcessSunday:
                color = [UIColor colorWithRed:1.0
                                        green:0.5
                                         blue:0.5
                                        alpha:1.0];
                break;
                
            default:
                color = [UIColor blackColor];
                break;
        }
       
        _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cellSize.width, cellSize.height)];
        [_dayLabel setText:[NSString stringWithFormat:@"%d",day]];
        [_dayLabel setTextColor:color];
        [_dayLabel setFont:DAY_FONT];
        [_dayLabel setTextAlignment:NSTextAlignmentCenter];
        [_dayLabel setBackgroundColor:bgColor];
        
        [_dayLabel.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [_dayLabel.layer setBorderWidth:1];
        
        [self addSubview:_dayLabel];
    }
    
    return self;
}

- (id)initWithPoint:(CGPoint)point withWeekDay:(NSUInteger)weekDay {
    CGSize cellSize = [CCAPI cellSize];
    CGRect frame = CGRectMake(point.x, point.y, cellSize.width, cellSize.height);
    self = [super initWithFrame:frame];
    
    if (self) {
        UIColor *color = [UIColor blackColor];
        NSString *weekName;
        
        switch (weekDay) {
            case 1:
                weekName = @"Mon";
                break;
            case 2:
                weekName = @"Tue";
                break;
            case 3:
                weekName = @"Wed";
                break;
            case 4:
                weekName = @"Thu";
                break;
            case 5:
                weekName = @"Fri";
                break;
            case 6:
                weekName = @"Sat";
                color = [UIColor purpleColor];
                break;
            case 7:
                weekName = @"Sun";
                color = [UIColor redColor];
                break;
                
                
            default:
                weekName = @"?";
                break;
        }
        
        _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cellSize.width, cellSize.height)];
        [_dayLabel setText:weekName];
        [_dayLabel setTextColor:color];
        [_dayLabel setFont:DAY_FONT];
        [_dayLabel setTextAlignment:NSTextAlignmentCenter];
        [_dayLabel setBackgroundColor:[UIColor clearColor]];
        
        [_dayLabel.layer setBorderColor:[[UIColor blackColor] CGColor]];
        [_dayLabel.layer setBorderWidth:1];
        
        [self addSubview:_dayLabel];
    }
    
    return self;
}

@end
