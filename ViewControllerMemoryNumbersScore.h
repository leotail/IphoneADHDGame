// Team information
// Teamname:Asia
// Productname:iConcentrate
// Programmers: Hua Shang , Alex Hon, Hao Zhuang
// ViewController.h
// Gamename: Memorygame
//
// Created by Hao Zhuang on 11/1/2012.
// Modified on 11/11/12
//This viewcontroller will show the statistics about the viewController show number
//  Copyright (c) 2012 Hao Zhuang. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.
#import "ViewControllerMemoryNumbersScore.h"
#import "AppDelegate.h"

@interface ViewControllerMemoryNumbersScore ()

@end

@implementation ViewControllerMemoryNumbersScore

@synthesize passString;
@synthesize pString;

@synthesize Message1;
@synthesize Message2;
@synthesize Message3;
@synthesize Message4;
@synthesize Message5;
@synthesize Message6;

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
    
    
    a =@"0";
    b = @"1";
    c = @"2";
    d = @"3";
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//    int difficult = [defaults integerForKey:@"Diff"];
    
    
  
    //   int difficult = [defaults integerForKey:@"Diff"];
    
    NSData  *diff2= [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi2"];
    NSMutableArray* myArray5= [NSKeyedUnarchiver unarchiveObjectWithData:diff2];
    
    int difficult = [[myArray5 objectAtIndex:apd.ID]integerValue];
    
    
    
    if(difficult==2){
        
        if([pString isEqualToString:a] ){    //get the length of the pronunciation
            q = 3;
        }
        if([pString isEqualToString:b]){
            q = 4;
        }
        if([pString isEqualToString:c]){
            q = 5;
        }
        if([pString isEqualToString:d]){
            q = 6;
        }
    }
    if(difficult==1){
        
        if([pString isEqualToString:a] ){    //get the length of the pronunciation
            q = 5;
        }
        if([pString isEqualToString:b]){
            q = 6;
        }
        if([pString isEqualToString:c]){
            q = 7;
        }
        if([pString isEqualToString:d]){
            q = 8;
        }
    }
    if(difficult==0){
        
        if([pString isEqualToString:a] ){    //get the length of the pronunciation
            q = 7;
        }
        if([pString isEqualToString:b]){
            q = 8;
        }
        if([pString isEqualToString:c]){
            q = 9;
        }
        if([pString isEqualToString:d]){
            q = 10;
        }
    }
    
    Message1.text =@"Your correct times:  ";
    Message2.text = passString;
    Message3.text = @"Reading Length:  ";
    Message4.text =  [NSString stringWithFormat:@"%d",  q];
    
   
    int a = 10-apd.try;
    
    Message5.text = [NSString stringWithFormat:@"%d",  a];
    Message6.text = @"Remaining Time:";

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setMessage1:nil];
    [self setMessage2:nil];
    [self setMessage3:nil];
    [self setMessage4:nil];
    [self setMessage5:nil];
    [self setMessage6:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
