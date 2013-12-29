//
//  CCViewController.m
//  ClassicCalendar
//
//  Created by Lexicss on 28.12.13.
//  Copyright (c) 2013 Lexicss. All rights reserved.
//

#import "CCMainViewController.h"
#import "CCDayCellView.h"
#import "CCMonthView.h"

@interface CCMainViewController ()

@end

@implementation CCMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        [self view];
    }
    
    return self;
}

- (void)loadView {
    [super loadView];
    
    _scrollView = [[UIScrollView alloc] init];
    [_scrollView setBackgroundColor:[UIColor whiteColor]];
 
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
                                               fromDate:today];
    
    NSInteger previousMonth;
    NSInteger previousYear;
    
    if ([components month] == 1) {
        previousMonth = 12;
        previousYear = [components year] - 1;
    } else {
        previousMonth = [components month] - 1;
        previousYear = [components year];
    }
    
    CCMonthView *previousMonthView = [[CCMonthView alloc] initWithPoint:CGPointMake(0, 10)
                                                                withDay:0
                                                              withMonth:previousMonth
                                                                forYear:previousYear
                                                              showTitle:YES];
    
    CCMonthView *monthView = [[CCMonthView alloc] initWithPoint:CGPointMake(0, CGRectGetMaxY(previousMonthView.frame) + 10)
                                                        withDay:[components day]
                                                      withMonth:[components month]
                                                        forYear:[components year]
                                                      showTitle:YES];
    
    NSInteger nextMonth;
    NSInteger nextYear;
    
    if ([components month] == 12) {
        nextMonth = 1;
        nextYear = [components year] + 1;
    } else {
        nextMonth = [components month] + 1;
        nextYear = [components year];
    }
    
    CCMonthView *nextMonthView = [[CCMonthView alloc] initWithPoint:CGPointMake(0, CGRectGetMaxY(monthView.frame) + 10)
                                                        withDay:0
                                                      withMonth:nextMonth
                                                        forYear:nextYear
                                                      showTitle:YES];
    [_scrollView addSubview:previousMonthView];
    [_scrollView addSubview:monthView];
    [_scrollView addSubview:nextMonthView];
    
    CGRect screen = [[UIScreen mainScreen] bounds];
    [_scrollView setContentSize:CGSizeMake(screen.size.width, CGRectGetMaxY(nextMonthView.frame))];
    NSLog(@"scroll: %@",NSStringFromCGSize(_scrollView.contentSize));
    
    [self setView:_scrollView];
    
    NSLog(@"load view");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
