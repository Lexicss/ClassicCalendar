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
    [_scrollView setBackgroundColor:[UIColor yellowColor]];
 
    CCMonthView *monthView = [[CCMonthView alloc] initWithPoint:CGPointMake(10, 10)
                                                        withDay:28
                                                      withMonth:12
                                                        forYear:2013
                                                      showTitle:YES];
    [_scrollView addSubview:monthView];
    
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
