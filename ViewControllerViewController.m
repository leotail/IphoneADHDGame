//
//  ViewControllerViewController.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/23/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "ViewControllerViewController.h"
#import "AppDelegate.h"

@interface ViewControllerViewController ()

@end

@implementation ViewControllerViewController

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
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    Array1= [NSMutableArray arrayWithCapacity:30];
    Array2 = [NSMutableArray arrayWithCapacity:30];
    Array3 = [NSMutableArray arrayWithCapacity:30];
    Array4 = [NSMutableArray arrayWithCapacity:30];
    Array5 = [NSMutableArray arrayWithCapacity:30];
    Array6 = [NSMutableArray arrayWithCapacity:30];
    Array7 = [NSMutableArray arrayWithCapacity:30];
     Array8 = [NSMutableArray arrayWithCapacity:30];
    
 //   NSData  *serialized= [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
 //   Array1 = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];
 //   NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
 //   Array2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
    
 //   NSData *diff1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi1"];
//     Array3 = [NSKeyedUnarchiver unarchiveObjectWithData:diff1];
    
    
 //   NSData *diff2 = [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi2"];
    
 //   NSData *diff3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi3"];
 //   NSData *diff4 = [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi4"];
    
    
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
