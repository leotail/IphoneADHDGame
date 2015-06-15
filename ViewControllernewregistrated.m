//
//  ViewControllernewregistrated.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "ViewControllernewregistrated.h"

@interface ViewControllernewregistrated ()

@end

@implementation ViewControllernewregistrated
@synthesize UserNameagain;
@synthesize PassWordagain;
@synthesize UserName;
@synthesize Showregistration;
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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//   NSString *Ar[30]; =  [defaults objectForKey:@"UserName"];
    
    
 //   NSString a = Ar[0];
    
//    NSLog(a);
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setUserName:nil];
    [self setPassWord:nil];
    [self setUserNameagain:nil];
    [self setPassWordagain:nil];
    [self setShowregistration:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)Enter:(id)sender {
    
    [UserName resignFirstResponder];
    [PassWord resignFirstResponder];
    [UserNameagain resignFirstResponder];
    [PassWordagain resignFirstResponder];
    
   
    // Create strings and integer to store the text info
    NSString *firstName = [UserName text];
    NSString *lastName  = [PassWord text];
    NSString *firstNameagain = [UserNameagain text];
    NSString *lastNameagain  = [PassWordagain text];
    
    NSData  *ser= [[NSUserDefaults standardUserDefaults] objectForKey:@"exist"];
    NSMutableArray *myArray = [NSKeyedUnarchiver unarchiveObjectWithData:ser];
    
    
    
    
    
    NSData  *serialized= [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    NSMutableArray *myArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];
    NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSMutableArray*myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
  
    int a = 0;
    bool findout = false;
    if([firstName isEqualToString:firstNameagain] && [lastName isEqualToString:lastNameagain]){
        while( a<30 && findout==false ){
            
            if([[myArray objectAtIndex:a] isEqualToString:@"false"]){
                findout=true;
                NSLog(@"exist is :%i", a );
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
                [myArray replaceObjectAtIndex:a withObject:@"True"];
                
               [myArray3 replaceObjectAtIndex:a withObject:lastName];
                [myArray2 replaceObjectAtIndex:a withObject: firstName];
                
                NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray2];
                NSData *sss = [NSKeyedArchiver archivedDataWithRootObject:myArray];
                NSData *se= [NSKeyedArchiver archivedDataWithRootObject:myArray3];
                [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:se forKey:@"password"];
                [[NSUserDefaults standardUserDefaults] setObject:sss forKey:@"exist"];
                
                Showregistration.text = @"You have successfully reset your Username and PassWord";
                
                UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
                UIViewController *next = [board instantiateViewControllerWithIdentifier:@"login"];
                [self presentModalViewController:next animated:YES];

            }
            
            
            a = a+1;
            
          
            
            
            
           
            
                    
        }
        
    }
    else{
        Showregistration.text = @"registration failed";
    }
    
   
              
    
    
}
@end
