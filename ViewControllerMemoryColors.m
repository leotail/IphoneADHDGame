// Team information
// Teamname:Asia
// Productname:iConcentrate
// Programmers: Hua Shang YaKun Cai Alex Hon Hao Zhuang



// ViewController.h
// Gamename: Memorygame
//
// Created by Hao Zhuang on 11/1/2012.
// Modified on 11/11/12
//This viewcontroller will appear colour.
//  Copyright (c) 2012 Yakun Cai. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.

#import "ViewControllerMemoryColors.h"
#import "ViewControllerMemoryColorsScore.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#include <unistd.h>

@interface ViewControllerMemoryColors()

@end

@implementation ViewControllerMemoryColors

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"S");
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    	// Do any additional setup after loading the view.
    Sound = false;  //use to control only click start once
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];


    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
   
    
    NSData  *diff2= [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi2"];
    myArray5 = [NSKeyedUnarchiver unarchiveObjectWithData:diff2];
    
    NSData  *score2= [[NSUserDefaults standardUserDefaults] objectForKey:@"score2"];
    myArray6 = [NSKeyedUnarchiver unarchiveObjectWithData:score2];
    
    
    

    difficult = 2;

    
    int a = apd.ID;
    
    
    
    NSData * MGstat1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"MGstat1"];
    
    NSData * MGPosition = [[NSUserDefaults standardUserDefaults] objectForKey:@"MGPosition"];
 
    
    mystat1 = [NSKeyedUnarchiver unarchiveObjectWithData:MGstat1];
    
    Position = [NSKeyedUnarchiver unarchiveObjectWithData:MGPosition];
    
    playerstat = [NSMutableArray arrayWithCapacity:30];
    
    playerstat = [mystat1 objectAtIndex:apd.ID ];
    
    recentplay = [[Position objectAtIndex:apd.ID]integerValue];

    
    difficult = [[myArray5 objectAtIndex:a]integerValue];
   
        
    CorrectRate =  [[myArray6 objectAtIndex:a]integerValue];
    
 

    if(apd.try==0){
        
        
        recentplay = recentplay+1;
        
        [Position replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", recentplay]];
        
        
        NSData *as = [NSKeyedArchiver archivedDataWithRootObject:Position];
        [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"MGPosition"];
        
        
        TotalScore = [defaults integerForKey:@"totalScore"];
        TotalTry = [defaults integerForKey:@"totalTry"];
  
        
        if (CorrectRate>= 80 && difficult>0){
            difficult = difficult-1;
            
                }
    
        if (CorrectRate<40 && difficult<2 ){
            difficult = difficult+1;
            
         
        }
    
        
        
        TotalScore=0;
        TotalTry=0;
        
        CorrectRate  =0;
        
        
        [myArray5 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", difficulty]];
        
        NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray5];
        
        [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"diff2"];
        
        [myArray6 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", CorrectRate]];
        
        NSData *ss = [NSKeyedArchiver archivedDataWithRootObject:myArray6];
        
        [[NSUserDefaults standardUserDefaults] setObject:ss forKey:@"score2"];
        
        
        [defaults setInteger:TotalScore forKey:@"totalScore"];
        
        [defaults setInteger:TotalTry forKey:@"totalTry"];
        
 
    }


    
    
    if( difficult== 2){
        
        difficulty.text = @"Easy, warm up";
    }
    if (difficult== 1){
        difficulty.text = @"Normal, continue working";
        
    }
    if(difficult==0){
        difficulty.text = @"Hard, be careful";
        
    }
    
    
  

    time.text = @"You have total played           tiems";
    
    ti.text = [NSString stringWithFormat:@"%d",apd.try];
    

    
    [defaults setObject:apd.abc forKey:@"selectKey"];
    [defaults synchronize];


  
    
    Trytime = 0;
//    Score = 0;
    keyList = [NSArray arrayWithObjects: @"Red", @"Green",@"Blue",@"Black",@"Orange",@"Purple", nil];
    
    
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
    
    
}


- (void)viewDidUnload
{
    Label1 = nil;
    Label2 = nil;
    Label3 = nil;
    Label4 = nil;
    Label5 = nil;
    label6 = nil;
    time = nil;
    Sequence = nil;
    ti = nil;
    difficulty = nil;
    Label7 = nil;
    label8 = nil;
    Label9 = nil;
    Label10 = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(int)getScore{
    return Score;
}


-(void)setScore:(int )input{
    Score = input;
}

//record what the user selects and print it
- (IBAction)Buttona:(id)sender {

    //    self.LoginButton.tintColor = [UIColor redColor];
    //    self.loginButton.backgroundColor = [UIColor colorWithRed:0.0 green:157.0/255.0 blue:223.0/255.0 alpha:1.0];}
    
    if(Sound==true){
    
    Trytime = Trytime+1;
     if(Trytime==1){
         Label1.text = @"Red";
         SelectKey = @"Red";
         
         
     }
     if(Trytime==2){
         Label2.text = @"Red";
         SelectKey1 = @"Red";
     }
     if(Trytime==3){
         Label3.text = @"Red";
         SelectKey2 = @"Red";
     }
    if(Trytime==4 && randum1==0 && difficult==2){
        Label4.text = nil;
    }
    if(Trytime==4 && randum1>0 && difficult==2){
        Label4.text = @"Red";
        SelectKey3 = @"Red";
    }
    
    if(Trytime==4 && difficult<2){
        Label4.text = @"Red";
        SelectKey3 = @"Red";
    }
    
    if(Trytime==5 && randum1==0 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1==1 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1>=2 && difficult ==2){
        Label5.text = @"Red";
        SelectKey4 = @"Red";
    }
    if(Trytime ==5 && difficult<2){
        Label5.text = @"Red";
        SelectKey4 = @"Red";
    }
    
    if(Trytime==6 && randum1==0 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==1 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==2 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==3 && difficult==2){
        label6.text = @"Red";
        SelectKey5 = @"Red";
    }
    if(Trytime==6 && randum1>=1 && difficult==1){
        label6.text = @"Red";
        SelectKey5 = @"Red";
    }
    if(Trytime==6 && difficult==0){
        label6.text = @"Red";
        SelectKey5 = @"Red";
    }
    if(Trytime==7 && difficult==2){
        Label7.text = nil;
    }
    
    
   
    if(Trytime==7 && difficult==1 && randum1<=1){
        Label7.text = nil;
    }
    if(Trytime==7 && difficult==1 && randum1>1){
        Label7.text = @"Red";
        SelectKey6 = @"Red";
    }
    if(Trytime==7 && difficult==0){
        Label7.text = @"Red";
        SelectKey6 = @"Red";
    }
    if(Trytime==8 && difficult==1 && randum1==3){
        label8.text = @"Red";
        SelectKey7 = @"Red";
    }
    if(Trytime==8 && difficult==2){
        label8.text  = nil;
    }
    if(Trytime==8 && difficult==0 && randum1>0){
        label8.text = @"Red";
        SelectKey7 = @"Red";
    }
    if(Trytime==9 && difficult==0 && randum1>1){
        Label9.text = @"Red";
        SelectKey8 = @"Red";
    }
    if(Trytime==10 && difficult==0 && randum1==3){
        Label10.text = @"Red";
        SelectKey9 = @"Red";
    }
   
    

 
    
  
 
    
    
    
    

    }
    
    
    


         
    
    
}
- (IBAction)Buttonb:(id)sender {
    
    if(Sound==true){
    
    Trytime = Trytime+1;
    
 //   NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
 //   NSString *lastName = [defaults objectForKey:@"electKey"];
    
  //  NSLog(@"QQQQQ%@", lastName);
    
    
    
    if(Trytime==1){
        Label1.text = @"Green";
        SelectKey = @"Green";
        
        
    }
    if(Trytime==2){
        Label2.text = @"Green";
        SelectKey1 = @"Green";
    }
    if(Trytime==3){
        Label3.text = @"Green";
        SelectKey2 = @"Green";
    }
    if(Trytime==4 && randum1==0 && difficult==2){
        Label4.text = nil;
    }
    if(Trytime==4 && randum1>0 && difficult==2){
        Label4.text = @"Green";
        SelectKey3 = @"Green";
    }
    
    if(Trytime==4 && difficult<2){
        Label4.text = @"Green";
        SelectKey3 = @"Green";
    }
    
    if(Trytime==5 && randum1==0 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1==1 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1>=2 && difficult ==2){
        Label5.text = @"Green";
        SelectKey4 = @"Greend";
    }
    if(Trytime ==5 && difficult<2){
        Label5.text = @"Green";
        SelectKey4 = @"Green";
    }
    
    if(Trytime==6 && randum1==0 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==1 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==2 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==3 && difficult==2){
        label6.text = @"Green";
        SelectKey5 = @"Green";
    }
    if(Trytime==6 && randum1>=1 && difficult==1){
        label6.text = @"Green";
        SelectKey5 = @"Green";
    }
    if(Trytime==6 && difficult==0){
        label6.text = @"Green";
        SelectKey5 = @"Green";
    }
    if(Trytime==7 && difficult==2){
        Label7.text = nil;
    }
    
    
    
    if(Trytime==7 && difficult==1 && randum1<=1){
        Label7.text = nil;
    }
    if(Trytime==7 && difficult==1 && randum1>1){
        Label7.text = @"Green";
        SelectKey6 = @"Green";
    }
    if(Trytime==7 && difficult==0){
        Label7.text = @"Green";
        SelectKey6 = @"Green";
    }
    if(Trytime==8 && difficult==1 && randum1==3){
        label8.text = @"Green";
        SelectKey7 = @"Green";
    }
    if(Trytime==8 && difficult==2){
        label8.text  = nil;
    }
    if(Trytime==8 && difficult==0 && randum1>0){
        label8.text = @"Green";
        SelectKey7 = @"Green";
    }
    if(Trytime==9 && difficult==0 && randum1>1){
        Label9.text = @"Green";
        SelectKey8 = @"Green";
    }
    if(Trytime==10 && difficult==0 && randum1==3){
        Label10.text = @"Green";
        SelectKey9 = @"Green";
    }
        
    }
}

- (IBAction)Buttonc:(id)sender {
    
    if(Sound==true){
    
    Trytime = Trytime+1;
    if(Trytime==1){
        Label1.text = @"Blue";
        SelectKey = @"Blue";
        
        
    }
    if(Trytime==2){
        Label2.text = @"Blue";
        SelectKey1 = @"Blue";
    }
    if(Trytime==3){
        Label3.text = @"Blue";
        SelectKey2 = @"Blue";
    }
    if(Trytime==4 && randum1==0 && difficult==2){
        Label4.text = nil;
    }
    if(Trytime==4 && randum1>0 && difficult==2){
        Label4.text = @"Blue";
        SelectKey3 = @"Blue";
    }
    
    if(Trytime==4 && difficult<2){
        Label4.text = @"Blue";
        SelectKey3 = @"Blue";
    }
    
    if(Trytime==5 && randum1==0 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1==1 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1>=2 && difficult ==2){
        Label5.text = @"Blue";
        SelectKey4 = @"Blue";
    }
    if(Trytime ==5 && difficult<2){
        Label5.text = @"Blue";
        SelectKey4 = @"Blue";
    }
    
    if(Trytime==6 && randum1==0 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==1 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==2 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==3 && difficult==2){
        label6.text = @"Blue";
        SelectKey5 = @"Blue";
    }
    if(Trytime==6 && randum1>=1 && difficult==1){
        label6.text = @"Blue";
        SelectKey5 = @"Blue";
    }
    if(Trytime==6 && difficult==0){
        label6.text = @"Blue";
        SelectKey5 = @"Blue";
    }
    if(Trytime==7 && difficult==2){
        Label7.text = nil;
    }
    
    
    
    if(Trytime==7 && difficult==1 && randum1<=1){
        Label7.text = nil;
    }
    if(Trytime==7 && difficult==1 && randum1>1){
        Label7.text = @"Blue";
        SelectKey6 = @"Blue";
    }
    if(Trytime==7 && difficult==0){
        Label7.text = @"Blue";
        SelectKey6 = @"Blue";
    }
    if(Trytime==8 && difficult==1 && randum1==3){
        label8.text = @"Blue";
        SelectKey7 = @"Blue";
    }
    if(Trytime==8 && difficult==2){
        label8.text  = nil;
    }
    if(Trytime==8 && difficult==0 && randum1>0){
        label8.text = @"Blue";
        SelectKey7 = @"Blue";
    }
    if(Trytime==9 && difficult==0 && randum1>1){
        Label9.text = @"Blue";
        SelectKey8 = @"Blue";
    }
    if(Trytime==10 && difficult==0 && randum1==3){
        Label10.text = @"Blue";
        SelectKey9 = @"Blue";
    }
    }
    
}

- (IBAction)Buttond:(id)sender {
    
    if(Sound==true){
    
    Trytime = Trytime+1;
    if(Trytime==1){
        Label1.text = @"Black";
        SelectKey = @"Black";
        
        
    }
    if(Trytime==2){
        Label2.text = @"Black";
        SelectKey1 = @"Black";
    }
    if(Trytime==3){
        Label3.text = @"Black";
        SelectKey2 = @"Black";
    }
    if(Trytime==4 && randum1==0 && difficult==2){
        Label4.text = nil;
    }
    if(Trytime==4 && randum1>0 && difficult==2){
        Label4.text = @"Black";
        SelectKey3 = @"Black";
    }
    
    if(Trytime==4 && difficult<2){
        Label4.text = @"Black";
        SelectKey3 = @"Black";
    }
    
    if(Trytime==5 && randum1==0 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1==1 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1>=2 && difficult ==2){
        Label5.text = @"Black";
        SelectKey4 = @"Black";
    }
    if(Trytime ==5 && difficult<2){
        Label5.text = @"Black";
        SelectKey4 = @"Black";
    }
    
    if(Trytime==6 && randum1==0 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==1 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==2 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==3 && difficult==2){
        label6.text = @"Black";
        SelectKey5 = @"Black";
    }
    if(Trytime==6 && randum1>=1 && difficult==1){
        label6.text = @"Black";
        SelectKey5 = @"Black";
    }
    if(Trytime==6 && difficult==0){
        label6.text = @"Black";
        SelectKey5 = @"Black";
    }
    if(Trytime==7 && difficult==2){
        Label7.text = nil;
    }
    
    
    
    if(Trytime==7 && difficult==1 && randum1<=1){
        Label7.text = nil;
    }
    if(Trytime==7 && difficult==1 && randum1>1){
        Label7.text = @"Black";
        SelectKey6 = @"Black";
    }
    if(Trytime==7 && difficult==0){
        Label7.text = @"Black";
        SelectKey6 = @"Black";
    }
    if(Trytime==8 && difficult==1 && randum1==3){
        label8.text = @"Black";
        SelectKey7 = @"Black";
    }
    if(Trytime==8 && difficult==2){
        label8.text  = nil;
    }
    if(Trytime==8 && difficult==0 && randum1>0){
        label8.text = @"Black";
        SelectKey7 = @"Black";
    }
    if(Trytime==9 && difficult==0 && randum1>1){
        Label9.text = @"Black";
        SelectKey8 = @"Black";
    }
    if(Trytime==10 && difficult==0 && randum1==3){
        Label10.text = @"Black";
        SelectKey9 = @"Black";
    }
        
    }

}

- (IBAction)Buttone:(id)sender {
    
    if(Sound==true){
    Trytime = Trytime+1;
    if(Trytime==1){
        Label1.text = @"Orange";
        SelectKey = @"Orange";
        
        
    }
    if(Trytime==2){
        Label2.text = @"Orange";
        SelectKey1 = @"Orange";
    }
    if(Trytime==3){
        Label3.text = @"Orange";
        SelectKey2 = @"Orange";
    }
    if(Trytime==4 && randum1==0 && difficult==2){
        Label4.text = nil;
    }
    if(Trytime==4 && randum1>0 && difficult==2){
        Label4.text = @"Orange";
        SelectKey3 = @"Orange";
    }
    
    if(Trytime==4 && difficult<2){
        Label4.text = @"Orange";
        SelectKey3 = @"Orange";
    }
    
    if(Trytime==5 && randum1==0 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1==1 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1>=2 && difficult ==2){
        Label5.text = @"Orangee";
        SelectKey4 = @"Orange";
    }
    if(Trytime ==5 && difficult<2){
        Label5.text = @"Orange";
        SelectKey4 = @"Orange";
    }
    
    if(Trytime==6 && randum1==0 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==1 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==2 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==3 && difficult==2){
        label6.text = @"Orange";
        SelectKey5 = @"Orange";
    }
    if(Trytime==6 && randum1>=1 && difficult==1){
        label6.text = @"Orange";
        SelectKey5 = @"Orange";
    }
    if(Trytime==6 && difficult==0){
        label6.text = @"Orange";
        SelectKey5 = @"Orange";
    }
    if(Trytime==7 && difficult==2){
        Label7.text = nil;
    }
    
    
    
    if(Trytime==7 && difficult==1 && randum1<=1){
        Label7.text = nil;
    }
    if(Trytime==7 && difficult==1 && randum1>1){
        Label7.text = @"Orange";
        SelectKey6 = @"Orange";
    }
    if(Trytime==7 && difficult==0){
        Label7.text = @"Orange";
        SelectKey6 = @"Orange";
    }
    if(Trytime==8 && difficult==1 && randum1==3){
        label8.text = @"Orange";
        SelectKey7 = @"Orange";
    }
    if(Trytime==8 && difficult==2){
        label8.text  = nil;
    }
    if(Trytime==8 && difficult==0 && randum1>0){
        label8.text = @"Orange";
        SelectKey7 = @"Orange";
    }
    if(Trytime==9 && difficult==0 && randum1>1){
        Label9.text = @"Orange";
        SelectKey8 = @"Orange";
    }
    if(Trytime==10 && difficult==0 && randum1==3){
        Label10.text = @"Orange";
        SelectKey9 = @"Orange";
    }
    }
    
}

- (IBAction)Buttonf:(id)sender {
    
    if(Sound ==true){
    
    Trytime = Trytime+1;
    if(Trytime==1){
        Label1.text = @"Purple";
        SelectKey = @"Purple";
        
        
    }
    if(Trytime==2){
        Label2.text = @"Purple";
        SelectKey1 = @"Purple";
    }
    if(Trytime==3){
        Label3.text = @"Purple";
        SelectKey2 = @"Purple";
    }
    if(Trytime==4 && randum1==0 && difficult==2){
        Label4.text = nil;
    }
    if(Trytime==4 && randum1>0 && difficult==2){
        Label4.text = @"Purple";
        SelectKey3 = @"Purple";
    }
    
    if(Trytime==4 && difficult<2){
        Label4.text = @"Purple";
        SelectKey3 = @"Purple";
    }
    
    if(Trytime==5 && randum1==0 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1==1 && difficult==2){
        Label5.text = nil;
    }
    if(Trytime==5 && randum1>=2 && difficult ==2){
        Label5.text = @"Purple";
        SelectKey4 = @"Purple";
    }
    if(Trytime ==5 && difficult<2){
        Label5.text = @"Purple";
        SelectKey4 = @"Purple";
    }
    
    if(Trytime==6 && randum1==0 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==1 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==2 && difficult==2){
        label6.text = nil;
    }
    if(Trytime==6 && randum1==3 && difficult==2){
        label6.text = @"Purple";
        SelectKey5 = @"Purple";
    }
    if(Trytime==6 && randum1>=1 && difficult==1){
        label6.text = @"Purple";
        SelectKey5 = @"Purple";
    }
    if(Trytime==6 && difficult==0){
        label6.text = @"Purple";
        SelectKey5 = @"Purple";
    }
    if(Trytime==7 && difficult==2){
        Label7.text = nil;
    }
    
    
    
    if(Trytime==7 && difficult==1 && randum1<=1){
        Label7.text = nil;
    }
    if(Trytime==7 && difficult==1 && randum1>1){
        Label7.text = @"Purple";
        SelectKey6 = @"Purple";
    }
    if(Trytime==7 && difficult==0){
        Label7.text = @"Purple";
        SelectKey6 = @"Purple";
    }
    if(Trytime==8 && difficult==1 && randum1==3){
        label8.text = @"Purple";
        SelectKey7 = @"Purple";
    }
    if(Trytime==8 && difficult==2){
        label8.text  = nil;
    }
    if(Trytime==8 && difficult==0 && randum1>0){
        label8.text = @"Purple";
        SelectKey7 = @"Purple";
    }
    if(Trytime==9 && difficult==0 && randum1>1){
        Label9.text = @"Purple";
        SelectKey8 = @"Purple";
    }
    if(Trytime==10 && difficult==0 && randum1==3){
        Label10.text = @"Purple";
        SelectKey9 = @"Purple";
    }
    }

}



- (IBAction)Voice:(id)sender {
    
    
    

    if(!Sound){          //use to control only click start once
        Sound = true;
    
   
        
        
  

        
       
                
        if(randum1==0 && difficult==2){    //we have already select 3 colours
            
            Sequence.text = @"Please choose three colours";
            
            
            CurrentKey3 = nil;
            CurrentKey4 = nil;
            CurrentKey5 = nil;
            
            
        }
        
    
        
        CurrentKey = [keyList objectAtIndex:randnum];  //  use the first generated random number to select a colour
        
        NSLog(@"SSSADAD%@", CurrentKey);
        
            CFBundleRef mainBundle =CFBundleGetMainBundle();
            CFURLRef soundFileURLRef;
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey), CFSTR("wav"), NULL);
            UInt32 soundID;
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
       CurrentKey1 = [keyList objectAtIndex:randum2];     
        NSLog(@"SSSADAD%@", CurrentKey1);
             //match the random number with colour
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (__bridge CFStringRef) CurrentKey1, CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
       CurrentKey2 = [keyList objectAtIndex:randum3];      //  use the third generated random number to select a colour
        
      NSLog(@"SSSADAD%@", CurrentKey2);
           
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey2), CFSTR("wav"), NULL);
           
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
    
        if(randum1==1 && difficult==2){    //we have already select 3 colours
            
            Sequence.text = @"Please choose Four colours";
            
            
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
            
        Sequence.text = @"Please choose Five colours";
            
            
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
            
            Sequence.text = @"Please choose Six colours";
            
            
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
            Sequence.text = @"Please choose five colours";

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
            Sequence.text = @"Please choose six colours";
            
            
            soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef)CFBridgingRetain(CurrentKey6), CFSTR("wav"), NULL);
            
            AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
            AudioServicesPlaySystemSound(soundID);
            sleep(1);
            
            
            
        }
        if(randum1==2){
            Sequence.text = @"Please choose seven colours";
            
            
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
            Sequence.text = @"Please choose Eight colours";
            
            
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
                Sequence.text = @"Please choose seven colours";
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
                Sequence.text = @"Please choose eight colours";
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (CFStringRef) CFBridgingRetain(CurrentKey7), CFSTR("wav"), NULL);
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
                
                CurrentKey8 = nil;
                CurrentKey9 = nil;
            }
            
            if(randum1==2){
                Sequence.text = @"Please choose nine colours";
                
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
                Sequence.text = @"Please choose ten colours";
                
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
        

        
        
}
    

 
}
    
    
    


- (IBAction)Reset:(id)sender {
    
    Trytime = 0;
    Label1.text = nil;
    Label2.text = nil;   //put everything we have selected to nil
    Label3.text = nil;
    Label4.text = nil;
    Label5.text = nil;
    label6.text = nil;
    Label7.text = nil;
    label8.text = nil;
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

- (IBAction)Check:(id)sender {
    
    
    
    
 //   NSLog(@"DDD%@", SelectKey);
 //   NSLog(@"DDD%@", SelectKey1);

 //   NSLog(@"DDD%@", SelectKey2);

 //   NSLog(@"DDD%@", SelectKey3);

  //  NSLog(@"DDD%@", SelectKey4);
  //  NSLog(@"DDD%@", SelectKey5);
 //   NSLog(@"DDD%@", SelectKey6);
  //  NSLog(@"DDD%@", SelectKey7);

    
    
    
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    
    apd.try = apd.try+1;   //number of times of trying so far
    
  
    
    NSLog(@"Total zhuangtry: %d", apd.try);
    
    
    if(SelectKey==CurrentKey && CurrentKey !=nil){
        Score  =Score +1;   //  check if the user selection match with the random generated colour
        
        NSLog(@"yes1");    //  and the user needs to select something
    }
    if(SelectKey1==CurrentKey1 && CurrentKey !=nil){
        Score  =Score +1;
        NSLog(@"yes2");   //if the select match with the random generated colour
    }
    if(SelectKey2==CurrentKey2 && CurrentKey !=nil){
        Score  =Score +1;
        NSLog(@"yes3");  
    }
    if(SelectKey3==CurrentKey3 && CurrentKey3 !=nil){
        Score  =Score +1;
        NSLog(@"yes4");
    }
    if(SelectKey4==CurrentKey4 && CurrentKey4 !=nil){
        Score  =Score +1;
        NSLog(@"yes5");
    }
    if(SelectKey5==CurrentKey5 && CurrentKey5 !=nil){
        Score  =Score +1;
        NSLog(@"yes6");
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
   
    
    time.text = [NSString stringWithFormat:@"%i", Score];
    
    ViewControllerMemoryColorsScore *nextController = [self.storyboard instantiateViewControllerWithIdentifier:@"MemoryColorsScore"];
    nextController.passString = [NSString stringWithFormat:@"%d",Score];
    nextController.pString = [NSString stringWithFormat:@"%d",randum1];   
    
    [self presentModalViewController:nextController animated:YES];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    TotalScore = [defaults integerForKey:@"totalScore"];
    TotalTry = [defaults integerForKey:@"totalTry"];
 //   NSLog(@"SCore:%d", Score);
  //  NSLog(@"TotalScore%d", TotalScore);
    
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
   // NSLog(@"TotalTry: %d", TotalTry);
    
    
    
    
    CorrectRate = TotalScore*100/TotalTry;
    [defaults setInteger:CorrectRate forKey:@"rate"];
  
    
   
    [myArray6 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", CorrectRate]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray6];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score2"];
    

  
    

    
    [defaults synchronize];
    
}






@end
