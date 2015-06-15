//
//  ViewControllerScore.m
//  MemoryGame
//
//  Created by Hao Zhuang on 11/11/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import "ViewControllerScore.h"
#import "AppDelegate.h"
@interface ViewControllerScore ()

@end

@implementation ViewControllerScore
@synthesize scoreR;
@synthesize score;
@synthesize resultR;


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
    
    NSData  *ssstat1= [[NSUserDefaults standardUserDefaults] objectForKey:@"SSstat1"];
    NSMutableArray * mystat1 = [NSKeyedUnarchiver unarchiveObjectWithData:ssstat1];
    
    NSData * SSPosition = [[NSUserDefaults standardUserDefaults] objectForKey:@"SSpostion"];    
    NSMutableArray * poss = [NSKeyedUnarchiver unarchiveObjectWithData:SSPosition];
    
 
    
    NSInteger recentplay = [[poss objectAtIndex: apd.ID] integerValue];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   // int SSplaytimes = [defaults integerForKey:@"SSplaytimes"];
    
    int pos = recentplay%30;
    
   // int poos =  SSplaytimes %30;
    
   
    
    NSLog(@"Pos is %d", recentplay);
    
   
 
    NSMutableArray * UserArray = [mystat1 objectAtIndex:apd.ID];
    
    NSData  *diff1= [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi1"];
    NSMutableArray *myArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:diff1];
    
    int difficulty = [[NSString stringWithFormat:@"%i",[myArray3 objectAtIndex:apd.ID ]]integerValue];
    
    NSLog(@"Difficuly is :%d", difficulty);
    
    
    if(difficulty==2){
        
        
        double a = apd.fscore*0.6;
        
        
        
        [UserArray replaceObjectAtIndex:pos withObject:[NSString stringWithFormat:@"%f", a] ];
        
      //  [SS replaceObjectAtIndex:pos withObject:[NSString stringWithFormat:@"%f", a] ];
        
                
        NSLog(@"SS");
        
    }
    
    if(difficulty==1){
        
        
        double a = apd.fscore*0.8;
        
        [UserArray replaceObjectAtIndex:pos withObject:[NSString stringWithFormat:@"%f", a] ];
        
     //  [SS replaceObjectAtIndex:pos withObject:[NSString stringWithFormat:@"%f", a] ];
        
        NSLog(@"SSS");
        
    }
    
    if(difficulty==0){
        
        
        double a = apd.fscore;
        
        [UserArray replaceObjectAtIndex:pos withObject:[NSString stringWithFormat:@"%f", a] ];
        
     
        
      //  [SS replaceObjectAtIndex:pos withObject:[NSString stringWithFormat:@"%f", a] ];
        
        NSLog(@"SSSS");
        
    }
    
    
  //  NSData *s = [NSKeyedArchiver archivedDataWithRootObject:SS];
  //  [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"SSstat1"];
    
  //  NSData *sss = [NSKeyedArchiver archivedDataWithRootObject:SS];
  //  [[NSUserDefaults standardUserDefaults] setObject:sss forKey:@"SSscore3"];

   
    
    for(int r = 0; r<30; r++){
 //       NSLog([SS objectAtIndex:r]);
        NSLog(@"DdD");
      
    }
     
   
    //display the score
    scoreR.text=@"Your score:";
    
   
    score.text=([NSString stringWithFormat:@"%d", apd.fscore]);
    
    apd.fscore = 0;
    // feedback to the user
    if(apd.fscore>=80){
        resultR.text=@"Congratulations, good job!";
    }
    else if(apd.fscore>=40 && apd.fscore<80){
        resultR.text=@"Normal job, you can be better.";
    }
    else{
        resultR.text=@"Not a good job, plaease try again.";
    }
	// Do any additional setup after loading the view.
    
    
}

- (void)viewDidUnload
{
    [self setScoreR:nil];
    [self setScore:nil];
    [self setResultR:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
