//
//  Selectgamestat.m
//  MemoryGame
//
//  Created by Hao Zhuang on 12-11-25.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "Selectgamestat.h"
#import "AppDelegate.h"
@interface Selectgamestat ()

@end

@implementation Selectgamestat

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

- (IBAction)SimonScore:(id)sender {
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    
    apd.SELECTSTATGame = 1;
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:@"scorehistory"];
    [self presentModalViewController:next animated:YES];
    
}

- (IBAction)MemoryScore:(id)sender {
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];

    apd.SELECTSTAT = 2;
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:@"scorehistory"];
    [self presentModalViewController:next animated:YES];
}
- (IBAction)MatchngScore:(id)sender {
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    
    apd.SELECTSTAT = 3;
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:@"scorehistory"];
    [self presentModalViewController:next animated:YES];
}
@end
