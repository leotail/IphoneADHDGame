// Team information
// Teamname:Asia
// Productname:iConcentrate
// Programmers: Hua Shang , Alex Hon, Hao Zhuang
// ViewController.h
// Gamename: Memorygame
//
// Created by Hao Zhuang on 11/1/2012.
// Modified on 11/11/12
//This viewcontroller will show the statistics about the viewController shows number
//  Copyright (c) 2012 Hao Zhuang. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.

#import "ViewControllerMemoryNumbers.h"
#import "ViewControllerMemoryNumbersScore.h"
#import <AVFoundation/AVFoundation.h>
#include <unistd.h>
#import "AppDelegate.h"

@interface ViewControllerMemoryNumbers ()

@end

@implementation ViewControllerMemoryNumbers


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
    
    Sound = false;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    NSLog(@"DD%@",apd.abc);
    
    NSData  *diff2= [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi2"];
    myArray5 = [NSKeyedUnarchiver unarchiveObjectWithData:diff2];
    
    NSData  *score2= [[NSUserDefaults standardUserDefaults] objectForKey:@"score2"];
    myArray6 = [NSKeyedUnarchiver unarchiveObjectWithData:score2];
    
    difficult=2;
     
    
 //   difficult = [defaults integerForKey:@"Diff"];
    
    difficult = [[myArray5 objectAtIndex:apd.ID]integerValue];
    CorrectRate =  [[myArray6 objectAtIndex:apd.ID]integerValue];
    
  //  NSLog(@"Difficuity is:%d", difficult);
    
  //  NSLog(@"Cprrectrate is:%d", CorrectRate);
    Score=0;
    
    
    
    keyList = [NSArray arrayWithObjects: @"One", @"Two",@"Three",@"Four",@"Five",@"Six",@"Seven",@"Eight",@"Nine", nil];
    totaltry.text = @"You have total played      times";
    
   
    
    num.text = [NSString stringWithFormat:@"%d",apd.try];
    
    // Do any additional setup after loading the view from its nib.
    
    randnum = arc4random() % 6;
    randum2 = arc4random() % 6;
    randum3 = arc4random() % 6;
    randum4 = arc4random() % 6;
    randum5 = arc4random() % 6;
    randum6 = arc4random() % 6;
    randum7 = arc4random() % 6;
    randum8 = arc4random() % 6;
    randum9 = arc4random() % 6;
    randum0 = arc4random() % 6;
    
    randum1 = arc4random() %4;   //generate a random number to choose from 0-3
    
    Trytime=0;
    if(apd.try==0){
        
        TotalScore = [defaults integerForKey:@"totalScore"];
        TotalTry = [defaults integerForKey:@"totalTry"];
 //       NSLog(@"SCore:%d", Score);
  //      NSLog(@"TotalScore%d", TotalScore);
        
        if (CorrectRate>= 80 && difficult>0){
            difficult = difficult-1;
            
            NSLog(@"Difficult adjusvnbvngvngted");
        }
        
        if (CorrectRate<40 && difficult<2 ){
            difficult = difficult+1;
            
            NSLog(@"Difficult adjusted");
        }
        
        
        TotalScore=0;
        TotalTry=0;
        CorrectRate = 0;
        [defaults setInteger:TotalScore forKey:@"totalScore"];
        
        [defaults setInteger:TotalTry forKey:@"totalTry"];
        
        //   [defaults setInteger:difficult forKey:@"Diff"];
        
        //    [defaults setInteger:difficult forKey:@"rate"];
        
        [myArray5 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", difficult]];
        
        NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray5];
        
        [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"diffi2"];
        
        [myArray6 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", CorrectRate]];
        
        NSData *ss = [NSKeyedArchiver archivedDataWithRootObject:myArray6];
        
        [[NSUserDefaults standardUserDefaults] setObject:ss forKey:@"score2"];

        
        
    }
    
    NSLog(@"Difficuity is a :%d", difficult);
    
    
    if( difficult== 2){
        
        difficulty.text = @"Easy, warm up";
    }
    if (difficult== 1){
        difficulty.text = @"Normal, continue working";
        
    }
    if(difficult==0){
        difficulty.text = @"Hard, be careful";
        
    }
    
       
}

- (void)viewDidUnload
{
    
    Message = nil;
    Label1 = nil;
    Label2 = nil;
    Label3 = nil;
    Label4 = nil;
    Label5 = nil;
    Label6 = nil;
    totaltry = nil;
    num = nil;
    label7 = nil;
    Label8 = nil;
    Label9 = nil;
    Label10 = nil;
    difficulty = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
//record what the user selects and print it
- (IBAction)Number2:(id)sender {    
    

    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"One";
            SelectKey = @"One";
            
            
        }
        if(Trytime==2){
            Label2.text = @"One";
            SelectKey1 = @"One";
        }
        if(Trytime==3){
            Label3.text = @"One";
            SelectKey2 = @"One";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"One";
            SelectKey3 = @"One";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"One";
            SelectKey3 = @"One";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"One";
            SelectKey4 = @"One";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"One";
            SelectKey4 = @"One";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"One";
            SelectKey5 = @"One";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"One";
            SelectKey5 = @"One";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"One";
            SelectKey5 = @"One";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"One";
            SelectKey6 = @"One";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"One";
            SelectKey6 = @"One";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"One";
            SelectKey7 = @"Two";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"One";
            SelectKey7 = @"One";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"One";
            SelectKey8 = @"One";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"One";
            SelectKey9 = @"One";
        }
    }
    
    NSLog(@"Trytimedd%d", Trytime);

}

- (IBAction)Number3:(id)sender {
    
   
    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Two";
            SelectKey = @"Two";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Two";
            SelectKey1 = @"Two";
        }
        if(Trytime==3){
            Label3.text = @"Two";
            SelectKey2 = @"Two";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Two";
            SelectKey3 = @"Two";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Two";
            SelectKey3 = @"Two";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Two";
            SelectKey4 = @"Two";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Two";
            SelectKey4 = @"Two";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Two";
            SelectKey5 = @"Two";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Two";
            SelectKey5 = @"Two";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Two";
            SelectKey5 = @"Two";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Two";
            SelectKey6 = @"Two";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Two";
            SelectKey6 = @"Two";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Two";
            SelectKey7 = @"Two";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Two";
            SelectKey7 = @"Two";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Two";
            SelectKey8 = @"Two";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Two";
            SelectKey9 = @"Two";
        }
    }

    
    
}

- (IBAction)Number4:(id)sender {
    
   
    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Three";
            SelectKey = @"Three";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Three";
            SelectKey1 = @"Three";
        }
        if(Trytime==3){
            Label3.text = @"Three";
            SelectKey2 = @"Three";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Three";
            SelectKey3 = @"Three";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Three";
            SelectKey3 = @"Three";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Three";
            SelectKey4 = @"Three";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Three";
            SelectKey4 = @"Three";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Three";
            SelectKey5 = @"Three";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Three";
            SelectKey5 = @"Three";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Three";
            SelectKey5 = @"Three";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Three";
            SelectKey6 = @"Three";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Three";
            SelectKey6 = @"Three";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Three";
            SelectKey7 = @"Three";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Three";
            SelectKey7 = @"Three";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Three";
            SelectKey8 = @"Three";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Three";
            SelectKey9 = @"Three";
        }
    }

}

- (IBAction)Number5:(id)sender {
    
  
    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Four";
            SelectKey = @"Four";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Four";
            SelectKey1 = @"Four";
        }
        if(Trytime==3){
            Label3.text = @"Four";
            SelectKey2 = @"Four";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Four";
            SelectKey3 = @"Four";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Four";
            SelectKey3 = @"Four";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Four";
            SelectKey4 = @"Four";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Four";
            SelectKey4 = @"Four";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Four";
            SelectKey5 = @"Four";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Four";
            SelectKey5 = @"Four";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Four";
            SelectKey5 = @"Four";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Four";
            SelectKey6 = @"Four";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Four";
            SelectKey6 = @"Four";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Four";
            SelectKey7 = @"Four";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Four";
            SelectKey7 = @"Four";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Four";
            SelectKey8 = @"Four";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Four";
            SelectKey9 = @"Four";
        }
    }

}

- (IBAction)Number6:(id)sender {
    
    
    
    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Five";
            SelectKey = @"Five";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Five";
            SelectKey1 = @"Five";
        }
        if(Trytime==3){
            Label3.text = @"Five";
            SelectKey2 = @"Five";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Five";
            SelectKey3 = @"Five";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Five";
            SelectKey3 = @"Five";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Five";
            SelectKey4 = @"Five";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Five";
            SelectKey4 = @"Five";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Five";
            SelectKey5 = @"Five";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Five";
            SelectKey5 = @"Five";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Five";
            SelectKey5 = @"Five";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Five";
            SelectKey6 = @"Five";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Five";
            SelectKey6 = @"Five";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Five";
            SelectKey7 = @"Five";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Five";
            SelectKey7 = @"Five";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Five";
            SelectKey8 = @"Five";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Five";
            SelectKey9 = @"Five";
        }
    }

    
}

- (IBAction)Number7:(id)sender {
    
    

    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Six";
            SelectKey = @"Six";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Six";
            SelectKey1 = @"Six";
        }
        if(Trytime==3){
            Label3.text = @"Six";
            SelectKey2 = @"Six";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Six";
            SelectKey3 = @"Six";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Six";
            SelectKey3 = @"Six";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Six";
            SelectKey4 = @"Six";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Six";
            SelectKey4 = @"Six";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Six";
            SelectKey5 = @"Six";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Six";
            SelectKey5 = @"Six";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Six";
            SelectKey5 = @"Six";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Six";
            SelectKey6 = @"Six";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Six";
            SelectKey6 = @"Six";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Six";
            SelectKey7 = @"Six";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Six";
            SelectKey7 = @"Six";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Six";
            SelectKey8 = @"Six";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Six";
            SelectKey9 = @"Six";
        }
    }

}

- (IBAction)Number8:(id)sender {
    
  
    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Seven";
            SelectKey = @"Seven";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Seven";
            SelectKey1 = @"Seven";
        }
        if(Trytime==3){
            Label3.text = @"Seven";
            SelectKey2 = @"Seven";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Seven";
            SelectKey3 = @"Seven";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Seven";
            SelectKey3 = @"Seven";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Seven";
            SelectKey4 = @"Seven";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Seven";
            SelectKey4 = @"Seven";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Seven";
            SelectKey5 = @"Seven";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Seven";
            SelectKey5 = @"Seven";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Seven";
            SelectKey5 = @"Seven";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Seven";
            SelectKey6 = @"Seven";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Seven";
            SelectKey6 = @"Seven";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Seven";
            SelectKey7 = @"Seven";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Seven";
            SelectKey7 = @"Seven";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Seven";
            SelectKey8 = @"Seven";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Seven";
            SelectKey9 = @"Seven";
        }
    }

}

- (IBAction)Number9:(id)sender {
    
   
    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Eight";
            SelectKey = @"Eight";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Eight";
            SelectKey1 = @"Eight";
        }
        if(Trytime==3){
            Label3.text = @"Eight";
            SelectKey2 = @"Eight";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Eight";
            SelectKey3 = @"Eight";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Eight";
            SelectKey3 = @"Eight";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Eight";
            SelectKey4 = @"Eight";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Eight";
            SelectKey4 = @"Eight";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Eight";
            SelectKey5 = @"Eight";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Eight";
            SelectKey5 = @"Eight";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Eight";
            SelectKey5 = @"Eight";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Eight";
            SelectKey6 = @"Eight";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Eight";
            SelectKey6 = @"Eight";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Eight";
            SelectKey7 = @"Eight";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Eight";
            SelectKey7 = @"Eight";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Eight";
            SelectKey8 = @"Eight";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Eight";
            SelectKey9 = @"Eight";
        }
    }

}

- (IBAction)Number0:(id)sender {
    
    
    
    
    if(Sound==true){
        
        Trytime = Trytime+1;
        if(Trytime==1){
            Label1.text = @"Nine";
            SelectKey = @"Nine";
            
            
        }
        if(Trytime==2){
            Label2.text = @"Nine";
            SelectKey1 = @"Nine";
        }
        if(Trytime==3){
            Label3.text = @"Nine";
            SelectKey2 = @"Nine";
        }
        if(Trytime==4 && randum1==0 && difficult==2){
            Label4.text = nil;
        }
        if(Trytime==4 && randum1>0 && difficult==2){
            Label4.text = @"Nine";
            SelectKey3 = @"Nine";
        }
        
        if(Trytime==4 && difficult<2){
            Label4.text = @"Nine";
            SelectKey3 = @"Nine";
        }
        
        if(Trytime==5 && randum1==0 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1==1 && difficult==2){
            Label5.text = nil;
        }
        if(Trytime==5 && randum1>=2 && difficult ==2){
            Label5.text = @"Nine";
            SelectKey4 = @"Nine";
        }
        if(Trytime ==5 && difficult<2){
            Label5.text = @"Nine";
            SelectKey4 = @"Nine";
        }
        
        if(Trytime==6 && randum1==0 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==1 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==2 && difficult==2){
            Label6.text = nil;
        }
        if(Trytime==6 && randum1==3 && difficult==2){
            Label6.text = @"Nine";
            SelectKey5 = @"Nine";
        }
        if(Trytime==6 && randum1>=1 && difficult==1){
            Label6.text = @"Nine";
            SelectKey5 = @"Nine";
        }
        if(Trytime==6 && difficult==0){
            Label6.text = @"Nine";
            SelectKey5 = @"Nine";
        }
        if(Trytime==7 && difficult==2){
            label7.text = nil;
        }
        
        
        
        if(Trytime==7 && difficult==1 && randum1<=1){
            label7.text = nil;
        }
        if(Trytime==7 && difficult==1 && randum1>1){
            label7.text = @"Nine";
            SelectKey6 = @"Nine";
        }
        if(Trytime==7 && difficult==0){
            label7.text = @"Nine";
            SelectKey6 = @"Nine";
        }
        if(Trytime==8 && difficult==1 && randum1==3){
            Label8.text = @"Nine";
            SelectKey7 = @"Nine";
        }
        if(Trytime==8 && difficult==2){
            Label8.text  = nil;
        }
        if(Trytime==8 && difficult==0 && randum1>0){
            Label8.text = @"Nine";
            SelectKey7 = @"Nine";
        }
        if(Trytime==9 && difficult==0 && randum1>1){
            Label9.text = @"Nine";
            SelectKey8 = @"Nine";
        }
        if(Trytime==10 && difficult==0 && randum1==3){
            Label10.text = @"Nine";
            SelectKey9 = @"Nine";
        }
    }

}

- (IBAction)Start:(id)sender {
    
    
    if(!Sound){    //the user can only press start button for one time
        
        Sound = true;
    
    
   
    
        
    //choose the first three numbers by the random generated numbers and match the random number with colour
   
        
        if(randum1==0 && difficult==2){    //we have already select 3 colours
            
                Message.text = @"Please choose three numbers";
            
            
            CurrentKey3 = nil;
            CurrentKey4 = nil;
            CurrentKey5 = nil;
            
            
        }
        
        
        
        CurrentKey = [keyList objectAtIndex:randnum];  //  use the first generated random number to select a colour
    
    //    NSLog(@"SSSADAD%@", CurrentKey);
        
        CFBundleRef mainBundle =CFBundleGetMainBundle();
        CFURLRef soundFileURLRef;
        soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey), CFSTR("wav"), NULL);
        UInt32 soundID;
        AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
        AudioServicesPlaySystemSound(soundID);
        sleep(1);
        
        CurrentKey1 = [keyList objectAtIndex:randum2];
  //      NSLog(@"SSSADAD%@", CurrentKey1);
        //match the random number with colour
        
        soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (__bridge CFStringRef) CurrentKey1, CFSTR("wav"), NULL);
        
        AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
        AudioServicesPlaySystemSound(soundID);
        sleep(1);
        
        CurrentKey2 = [keyList objectAtIndex:randum3];      //  use the third generated random number to select a colour
        
  //      NSLog(@"SSSADAD%@", CurrentKey2);
        
        soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey2), CFSTR("wav"), NULL);
        
        AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
        AudioServicesPlaySystemSound(soundID);
        sleep(1);
        
        
        if(randum1==1 && difficult==2){    //we have already select 3 colours
            
                Message.text = @"Please choose Four numbers";
            
            
            CurrentKey3 = [keyList objectAtIndex:randum4];
            
            
            CFBundleRef mainBundle =CFBundleGetMainBundle();
            CFURLRef soundFileURLRef;
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) (CFStringRef) CFBridgingRetain(CurrentKey3), CFSTR("wav"), NULL);
            UInt32 soundID;
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
            
            
        }
        
        
        if(randum1==2 && difficult==2){    //we have already select 3 colours
            
                Message.text = @"Please choose Five numbers";
            
            
            CurrentKey3 = [keyList objectAtIndex:randum4];
            CurrentKey4 = [keyList objectAtIndex:randum5];
            CurrentKey5 = nil;
            
            CFBundleRef mainBundle =CFBundleGetMainBundle();
            CFURLRef soundFileURLRef;
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) (CFStringRef) CFBridgingRetain(CurrentKey3), CFSTR("wav"), NULL);
            UInt32 soundID;
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey4), CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
        }
        
        if(randum1==3 && difficult==2){    //we have already select 3 colours
            
                Message.text = @"Please choose Six numbers";
            
            
            CurrentKey3 = [keyList objectAtIndex:randum4];
            CurrentKey4 = [keyList objectAtIndex:randum5];
            CurrentKey5 = [keyList objectAtIndex:randum6];
            
            CFBundleRef mainBundle =CFBundleGetMainBundle();
            CFURLRef soundFileURLRef;
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) (CFStringRef) CFBridgingRetain(CurrentKey3), CFSTR("wav"), NULL);
            UInt32 soundID;
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey4), CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey5), CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
        }
        
        
        
        
        if(difficult==1 ){          //medium difficulty
            
            if(randum1==0){
                    Message.text = @"Please choose five numbers";
                
            }
            
            
            
            
            CurrentKey3 = [keyList objectAtIndex:randum4];
            CurrentKey4 = [keyList objectAtIndex:randum5];
            CurrentKey5 = [keyList objectAtIndex:randum6];
            CurrentKey6 = [keyList objectAtIndex:randum7];
            CurrentKey7 = [keyList objectAtIndex:randum8];
            
            
            CFBundleRef mainBundle =CFBundleGetMainBundle();
            CFURLRef soundFileURLRef;
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) (CFStringRef) CFBridgingRetain(CurrentKey3), CFSTR("wav"), NULL);
            UInt32 soundID;
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey4), CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            if(randum1==1){
                    Message.text = @"Please choose six numbers";
                
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey6), CFSTR("wav"), NULL);
                
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                
                
            }
            if(randum1==2){
                    Message.text = @"Please choose seven numbers";
                
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey6), CFSTR("wav"), NULL);
                
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey7), CFSTR("wav"), NULL);
                
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                
                
            }
            if(randum1==3){
                    Message.text = @"Please choose Eight numbers";
                
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey6), CFSTR("wav"), NULL);
                
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey7), CFSTR("wav"), NULL);
                
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey8), CFSTR("wav"), NULL);
                
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                
                
            }
            
            
        }
        
        
        
        if(difficult==0 ){    //hard difficulty
            
            
            
            
            
            CurrentKey3 = [keyList objectAtIndex:randum4];
            CurrentKey4 = [keyList objectAtIndex:randum5];
            CurrentKey5 =[keyList objectAtIndex:randum6];
            CurrentKey6 =[keyList objectAtIndex:randum7];
            CurrentKey7 =[keyList objectAtIndex:randum8];
            CurrentKey8 =[keyList objectAtIndex:randum9];
            CurrentKey9 =[keyList objectAtIndex:randum0];
            
            
            
            
            if(randum1==0){
                    Message.text = @"Please choose seven numbers";
                CurrentKey7 = nil;
                CurrentKey8= nil;
                CurrentKey9 = nil;
                
            }
            
            CFBundleRef mainBundle =CFBundleGetMainBundle();
            CFURLRef soundFileURLRef;
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey3), CFSTR("wav"), NULL);
            UInt32 soundID;
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey4), CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey5), CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey6), CFSTR("wav"), NULL);
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
            
            
            
            
            
            if(randum1==1){
                    Message.text = @"Please choose eight numbers";
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey7), CFSTR("wav"), NULL);
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                CurrentKey8 = nil;
                CurrentKey9 = nil;
            }
            
            if(randum1==2){
                    Message.text = @"Please choose nine numbers";
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey7), CFSTR("wav"), NULL);
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey8), CFSTR("wav"), NULL);
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                CurrentKey9 = nil;
            }
            
            if(randum1==3){
                    Message.text = @"Please choose ten numbers";
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey7), CFSTR("wav"), NULL);
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey8), CFSTR("wav"), NULL);
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey9), CFSTR("wav"), NULL);
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
            }
            
            
            
            
        }
        
    //    NSLog(CurrentKey);
   //     NSLog(CurrentKey1);
   //     NSLog(CurrentKey2); //for test purpose
   //     NSLog(CurrentKey3);
   //     NSLog(CurrentKey4);
   //     NSLog(CurrentKey5);
    //    NSLog(CurrentKey6);
   //     NSLog(CurrentKey7);
   //     NSLog(CurrentKey8);
   //     NSLog(CurrentKey9);
        
        
    }
}

- (IBAction)Reset:(id)sender {
    
    Trytime = 0;
    Label1.text = nil;
    Label2.text = nil;   //put everything we have selected to nil
    Label3.text = nil;
    Label4.text = nil;
    Label5.text = nil;
    Label6.text = nil;
    label7.text = nil;
    Label8.text = nil;
    Label9.text = nil;
    Label10.text = nil;
    
    SelectKey = nil;
    SelectKey1 = nil;
    SelectKey2 = nil;
    SelectKey3 = nil;
    SelectKey4 = nil;
    SelectKey5 = nil;
    SelectKey6 = nil;
    SelectKey7 = nil;
    SelectKey8 = nil;
    SelectKey9 = nil;
}

- (IBAction)Finish:(id)sender {
    
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    
    apd.try = apd.try+1;
    
  //  NSLog(@"Total haotry: %d", apd.try);
    
                                                        //  check if the user selection match with the random generated number
    if(SelectKey==CurrentKey && CurrentKey !=nil){    //  and the user needs to select something
        Score  =Score +1;
    }
    if(SelectKey1==CurrentKey1 && CurrentKey !=nil){
        Score  =Score +1;
    }
    if(SelectKey2==CurrentKey2 && CurrentKey !=nil){
        Score  =Score +1;
    }
    if(SelectKey3==CurrentKey3 && CurrentKey3 !=nil){
        Score  =Score +1;
    }
    if(SelectKey4==CurrentKey4 && CurrentKey4 !=nil){
        Score  =Score +1;
    }
    if(SelectKey5==CurrentKey5 && CurrentKey5 !=nil){
        Score  =Score +1;
    }
    if(SelectKey6==CurrentKey6 && CurrentKey6 !=nil){
        Score  =Score +1;
        NSLog(@"yes6");
    }
    if(SelectKey7==CurrentKey7 && CurrentKey7 !=nil){
        Score  =Score +1;
        NSLog(@"yes7");
    }
    if(SelectKey8==CurrentKey8 && CurrentKey8 !=nil){
        Score  =Score +1;
        NSLog(@"yes8");
    }
    if(SelectKey9==CurrentKey9 && CurrentKey9 !=nil){
        Score  =Score +1;
        NSLog(@"yes9");
    }
    
    ViewControllerMemoryNumbersScore *nextController = [self.storyboard instantiateViewControllerWithIdentifier:@"MemoryNumbersScore"];
    nextController.passString = [NSString stringWithFormat:@"%d",Score];
    nextController.pString = [NSString stringWithFormat:@"%d",randum1];
    
    [self presentModalViewController:nextController animated:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    TotalScore = [defaults integerForKey:@"totalScore"];
    TotalTry = [defaults integerForKey:@"totalTry"];
 //   NSLog(@"SCore:%d", Score);
 //   NSLog(@"TotalScore%d", TotalScore);
    
    TotalScore = TotalScore+ Score;
    if(difficult==2){
        TotalTry = TotalTry+ randum1+3;
    }
    if(difficult==1){
        TotalTry = TotalTry+ randum1+5;

    }
    if(difficult==0){
        TotalTry = TotalTry+ randum1+7;
        
    }
    [defaults setInteger:TotalScore forKey:@"totalScore"];
    
    [defaults setInteger:TotalTry forKey:@"totalTry"];
  //  NSLog(@"TotalTry: %d", TotalTry);
    
    
    
    
    CorrectRate = TotalScore*100/TotalTry;
  //  [defaults setInteger:CorrectRate forKey:@"rate"];
    NSLog(@"ffsdadadadfdsf");
    
    [myArray6 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", CorrectRate]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray6];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score2"];
    
    
    
    
 //   NSLog(@"corrdvtfsf%d", CorrectRate);
    
  //  int a = [defaults integerForKey:@"rate"];
    
 //   NSLog(@"dfsfsdfs%d", a);
 //   [defaults setInteger:a forKey:@"rate"];
    
    [defaults synchronize];
    

}
@end
