//
//  CCMonthView.h
//  ClassicCalendar
//
//  Created by Lexicss on 28.12.13.
//  Copyright (c) 2013 Lexicss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCMonthView : UIView

@property(nonatomic, strong) NSArray *dayCells;

- (id)initWithPoint:(CGPoint)point
            withDay:(NSUInteger)day
          withMonth:(NSUInteger)month
            forYear:(NSUInteger)year
          showTitle:(BOOL)showTitle;

@end
