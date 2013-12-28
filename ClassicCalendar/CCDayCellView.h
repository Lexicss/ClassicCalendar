//
//  CCDayCellView.h
//  ClassicCalendar
//
//  Created by Lexicss on 28.12.13.
//  Copyright (c) 2013 Lexicss. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    TypeNormal,
    TypeSaturday,
    TypeHolidayOrSunday,
    TypeExcess
}CCDayType;

@interface CCDayCellView : UIView

- (id)initWithPoint:(CGPoint)point withDay:(NSUInteger)day withType:(CCDayType)dayType withMark:(BOOL)mark;

@end
