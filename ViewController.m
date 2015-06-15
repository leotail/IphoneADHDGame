// ViewController.h
// Gamename: Memorygame
//
// Created by Hao Zhuang on 11/1/2012.
// Modified on 11/11/12
//  Copyright (c) 2012 Yakun Cai. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    One = arc4random() % 2;
 //   AppDelegate *apd=[[UIApplication sharedApplication] delegate];
 //   apd.abc = @"red";
    
    
    
    
    	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
   
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)Start:(id)sender {
    
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
   
    NSLog(@"this is total try: %d", apd.try);
    if(One==0 && apd.try!=3){
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *next = [board instantiateViewControllerWithIdentifier:@"MemoryNumbers"];
        [self presentModalViewController:next animated:YES];
    }
    
    if(One==1 && apd.try!=3){
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *next = [board instantiateViewControllerWithIdentifier:@"MemoryColors"];
        [self presentModalViewController:next animated:YES];
    }
    
    if(apd.try==3){
        apd.try =0;
        
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *next = [board instantiateViewControllerWithIdentifier:@"select"];
        [self presentModalViewController:next animated:YES];
    }
    
   
}
@end
