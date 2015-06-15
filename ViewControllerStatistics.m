//
//  ViewControllerStatistic.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "ViewControllerStatistic.h"

@interface ViewControllerStatistic ()

@end

@implementation ViewControllerStatistic

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
