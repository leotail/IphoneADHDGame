//
//  ViewControllerexistplayer.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "ViewControllerexistplayer.h"
#import "AppDelegate.h"
@interface ViewControllerexistplayer ()
@property (weak, nonatomic) IBOutlet UILabel *Reminder;

@end

@implementation ViewControllerexistplayer
@synthesize Reminder;
@synthesize UserName;
@synthesize check;

@synthesize PassWord;

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
    
    NSData  *serialized= [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    NSMutableArray *myArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];
    NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSMutableArray*myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
    
    
    for(int e = 0; e<30; e++){
     //   NSLog([myArray3 objectAtIndex:e]);
        
     //   NSLog(@"Password");
    }
    
    for(int e = 0; e<30; e++){
    //    NSLog([myArray2 objectAtIndex:e]);
     //   NSLog(@"username");
    }
    
  
}

- (void)viewDidUnload
{
    [self setUserName:nil];
    [self setPassWord:nil];
    [self setReminder:nil];
    [self setReminder:nil];
    [self setReminder:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)finish:(id)sender {
    [UserName resignFirstResponder];
    [PassWord resignFirstResponder];
    
    NSString *firstName = [UserName text];
    NSString *lastName  = [PassWord text];
    
    NSData  *serialized= [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    NSMutableArray *myArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];
    NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSMutableArray*myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
    
    
    for(int e = 0; e<30; e++){
      //  NSLog([myArray3 objectAtIndex:e]);
        
     //   NSLog(@"Password is   ");
    }
    
    for(int e = 0; e<30; e++){
   
    }
    
    
  
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
   
 //   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
 //   int change =  [defaults integerForKey:@"changenot"];
    
  

    
    for(int a = 0; a<30; a++){
        if([[myArray3 objectAtIndex:a] isEqualToString:lastName] &&[[myArray2 objectAtIndex:a] isEqualToString:firstName] &&  ([[myArray3 objectAtIndex:a] isEqualToString:[NSString stringWithFormat:@"%i", a]])==false &&[[myArray2 objectAtIndex:a] isEqualToString:@"Username"]==false){
            
          
          
            apd.ID = a;
            
         //   NSLog([NSString stringWithFormat:@"%i", apd.ID]);
            UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            UIViewController *next = [board instantiateViewControllerWithIdentifier:@"mainscreen"];
            [self presentModalViewController:next animated:YES];
    }
        else{
            check.text = @"Username or PassWord is incorrect.";
        }
            
            
            
        
    
   
        
    
    
    
        
    
    
    

    }}
    @end
