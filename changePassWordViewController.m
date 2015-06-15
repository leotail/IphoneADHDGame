//
//  changePassWordViewController.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/26/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "changePassWordViewController.h"
#import "AppDelegate.h"
@interface changePassWordViewController ()

@end

@implementation changePassWordViewController
@synthesize OldPassWord;
@synthesize NewPassWord;

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
    
    
    [OldPassWord resignFirstResponder];
    [NewPassWord resignFirstResponder];
    
    firstPassWord = [OldPassWord text];
    firstPassWordagain  = [NewPassWord text];
    
    NSLog(@"firstPassWord is: %@", firstPassWord);
    
    NSLog(@"firstPassWordagain is: %@", firstPassWordagain);
    
    NSData  *serialized= [[NSUserDefaults standardUserDefaults] objectForKey:@"password"];
    NSMutableArray *myArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:serialized];
    NSData *serializ = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    NSMutableArray*myArray2 = [NSKeyedUnarchiver unarchiveObjectWithData:serializ];
    
    for(int e = 0; e<30; e++){
        NSLog([myArray3 objectAtIndex:e]);
        
        NSLog(@"Password is   ");
    }

    
    NSData  *ser= [[NSUserDefaults standardUserDefaults] objectForKey:@"exist"];
   myArray = [NSKeyedUnarchiver unarchiveObjectWithData:ser];
    
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    
    
    [self setOldPassWord:nil];
    [self setNewPassWord:nil];
    Showresult = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)finish:(id)sender {
    
    int a = 1;
    bool findout = false;
    
    firstPassWord = [OldPassWord text];
    firstPassWordagain  = [NewPassWord text];
    
    NSLog(@"firstPassWord is: %@", firstPassWord);
    
    NSLog(@"firstPassWordagain is: %@", firstPassWordagain);

    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    if([firstPassWord isEqualToString:firstPassWordagain] ){
        while (a<30 && findout==false ){
            
            if([[myArray objectAtIndex:a] isEqualToString:@"false"]){
                findout=true;
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
                for(int e = 0; e<30; e++){
                    NSLog([myArray3 objectAtIndex:e]);
                    
                    NSLog(@"Password is   ");
                }
                a = a+1;
                
                [myArray3 replaceObjectAtIndex:apd.ID withObject:firstPassWord];
  //              [myArray2 replaceObjectAtIndex:a withObject: firstName];
                
                NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray2];
                NSData *se= [NSKeyedArchiver archivedDataWithRootObject:myArray3];
                [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:se forKey:@"password"];
                
                Showresult.text = @"You have successfully reset your  PassWord";
                
                NSLog(@"apd.id is%d", apd.ID);
                
                
                for(int er = 0; er<30; er++){
                    NSLog(@"after PAssWord%@", [myArray3 objectAtIndex:er]);
                }
                
            }
    
        }
    }
else{
    Showresult.text = @"PassWord reset failed";
    
    
    for(int e = 0; e<30; e++){
        NSLog([myArray3 objectAtIndex:e]);
        
        NSLog(@"Password is   ");
    }
}
}
@end
