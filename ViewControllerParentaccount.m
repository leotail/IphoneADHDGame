//
//  ViewControllerParentaccount.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "ViewControllerParentaccount.h"

@interface ViewControllerParentaccount ()

@end

@implementation ViewControllerParentaccount
@synthesize SetNewUsername;
@synthesize SetNewPassWord;
@synthesize ParentName;
@synthesize ParentPassWord;

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
 
   
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
   
    myArray = [NSMutableArray arrayWithCapacity:30];
    myArray2 = [NSMutableArray arrayWithCapacity:30];
    
   
    
    NSData  *serialized= [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    myArray = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];
    NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
   

 //   NSString *pp = [NSString stringWithFormat:@"%i",[myArray count]];
 //   NSLog(pp);
    
 //   if([[myArray objectAtIndex:2] isEqualToString:@"XXX"] ){
 //      NSLog(pp);
 //   }
    
//    for(int q=0; q<30; q++) {
 //       NSLog([myArray objectAtIndex:q]);
 //   }
    
    newlastName= [myArray objectAtIndex:0];
    newfirstName = [myArray2 objectAtIndex:0];
    
  //  NSLog(newlastName);
  //  NSLog(newfirstName);
    

    NSLog(@"absfdadasc");

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setParentName:nil];
    [self setParentPassWord:nil];
    [self setSetNewUsername:nil];
    [self setSetNewPassWord:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)Finish:(id)sender {
    
    [ParentName resignFirstResponder];
    [ParentPassWord resignFirstResponder];
    
    firstName = [ParentName text];
    lastName  = [ParentPassWord text];
    
    NSLog(@"eaefsfsfsfswqe%@", firstName);
    
    NSLog(@"eaeffsfsfssfsfsfswqe%@", lastName);
    
    [SetNewUsername resignFirstResponder]; 
    [SetNewPassWord resignFirstResponder];
    
    SettedUsername = [SetNewUsername text];
     SettedPassWord = [SetNewPassWord text];
    
    NSLog(@"Settlepass%@",SettedPassWord );
     NSLog(@"Settleuser%@",SettedUsername );
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
   
    
    
    if([firstName isEqualToString:newfirstName] && [lastName isEqualToString:newlastName] && ([SettedPassWord length]!=0) && ([SettedUsername length]!=0)){
        
        NSInteger change = 1;
        [defaults setInteger:change forKey:@"changenot"];
        
        [myArray replaceObjectAtIndex:0 withObject:SettedPassWord];
        [myArray2 replaceObjectAtIndex:0 withObject:SettedUsername];
        
        
        
        NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray2];
        NSData *se= [NSKeyedArchiver archivedDataWithRootObject:myArray];
        [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"username"];
        [[NSUserDefaults standardUserDefaults] setObject:se forKey:@"password"];
        
        NSLog(@"PassWord changes");
        
        
   //     NSLog([myArray objectAtIndex:0]);
   //     NSLog([myArray2 objectAtIndex:0]);

    }
    
    if([firstName isEqualToString:newfirstName] && [lastName isEqualToString:newlastName] &&([SettedPassWord length]==0)  && ([SettedUsername length]==0)){
        
        
        
        
        
  //      NSLog(@"eaewqe");
        
        
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *next = [board instantiateViewControllerWithIdentifier:@"List"];
        [self presentModalViewController:next animated:YES];
    }
    
  //  NSLog(@"eaedadadawqe");
}
@end
