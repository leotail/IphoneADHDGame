// Team information
// Teamname:Asia
// Productname:iConcentrate
// Programmers: Hua Shang YaKun Cai Alex Hon Hao Zhuang

// In our project proposal, we need to pronounce the word but right now we just show the word in the left of the screen. We will implements that laterly.
// We have a unfixed bug which deals with the time counter. The time counter will count faster and faster as we continue to press the start button.
// there are some warnings about incomplete implementation but we have not found them out.

// ViewController.m
// Gamename: simonsays
//
//  Created by Yakun Cai on 10/19/12.
// Modified on 11/11/12
//  Copyright (c) 2012 Yakun Cai. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.

#import "ViewControllerSimon.h"
#import <AVFoundation/AVFoundation.h>
#include <unistd.h>
#import "ViewControllerScore.h"
#import "AppDelegate.h"

@interface ViewControllerSimon ()

@end

@implementation ViewControllerSimon

- (void)viewDidLoad
{
    [super viewDidLoad];
    //create key list
    
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
  
   NSData  *diff1= [[NSUserDefaults standardUserDefaults] objectForKey:@"diffi1"];
   myArray3 = [NSKeyedUnarchiver unarchiveObjectWithData:diff1];
    
   
    
   NSData  *score1= [[NSUserDefaults standardUserDefaults] objectForKey:@"score1"];
   myArray4 = [NSKeyedUnarchiver unarchiveObjectWithData:score1];
    
    
    
    //we tried to memory the each player's position nut we could not implement it.
    NSData * SSstat1 = [[NSUserDefaults standardUserDefaults] objectForKey:@"SSstat1"];

    NSData * SSPosition = [[NSUserDefaults standardUserDefaults] objectForKey:@"SSpostion"];

    
   mystat1 = [NSKeyedUnarchiver unarchiveObjectWithData:SSstat1];

    Position = [NSKeyedUnarchiver unarchiveObjectWithData:SSPosition];
    
    playerstat = [NSMutableArray arrayWithCapacity:30];
    
   playerstat = [mystat1 objectAtIndex:apd.ID ];
    
  //  NSMutableArray *playerstat2 = [mystat1 objectAtIndex:apd.ID+1 ];
  
    
      
   
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                                   
    recentplay = [[Position objectAtIndex:apd.ID]integerValue];
    
    SSplaytimes = [defaults integerForKey:@"SSplaytimes"];
                                   
 
    
    [Position insertObject:[NSString stringWithFormat:@"%i", recentplay] atIndex:apd.ID];
                                 
    

    
 //   NSLog(@"Recent play is %d", recentplay);
    
  
    keyList = [NSArray arrayWithObjects: @"Head", @"Shoulders",@"Chest",@"Arm",@"Hand",@"Stomach",@"Leg",@"Foot",@"Empty",nil];
    //Tools for enable or disable buttons and timers
    flag = true;
    flag2 = true;
  
 
   
    

    

    

    
   difficulty = [[myArray3 objectAtIndex:apd.ID] integerValue];
 
    
 
    
    score = [[myArray4 objectAtIndex:apd.ID] integerValue];
    
    
   
   
    if (score>= 80 && difficulty>0){
        difficulty = difficulty-1;
    }
    
    if (score<40 && difficulty<2){
        difficulty = difficulty+1;
    }
    
   
    
 
    
  [myArray3 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", difficulty]];
    
  
    
    NSData *s = [NSKeyedArchiver archivedDataWithRootObject:myArray3];
    
   [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"diffi1"];
    
    

    
    for(int er = 0; er<30; er++){
        NSLog(@"Diff is %@", [myArray3 objectAtIndex:er]);
    
    }
    if( difficulty== 2){
        Time = 15;
    }
    else if (difficulty== 1){
        Time = 10;
    }
    else{
        Time = 5;
    }
       
    if( difficulty== 2){
        
        Time = 15;
    }
    else if (difficulty== 1){
        Time = 10;
    }
    else{
        Time = 5;
    }
   
// default values for variables
    Time2 = 15;
    score = 0;
    comment.text= @"";
    MainInt = Time;
    MainInt2 = Time2;
    stop =false;
    score = 0;
    Trytime = 0;
    Righttime = 0;
    score = 0;
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // globalsimonsaysscore = result();
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



//Nothing is said.

- (IBAction)NoTouch:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Empty"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
 //   [defaults setInteger:score forKey:@"Score"];
    
   [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
   NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}

//Press shoulder.

- (IBAction)Shoulder:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Shoulders"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    
    NSLog([NSString stringWithFormat:@"%i", score]);
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    

    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}




//Press head.

- (IBAction)Head:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Head"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
 
    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}

//Press chest.

- (IBAction)Chest:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Chest"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
 
    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}

//Press arm.

- (IBAction)Arm:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Arm"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    

    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}

//Press stomach.

- (IBAction)Stomach:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Stomach"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
   
    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}

//Press leg.

- (IBAction)Leg:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Leg"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}

//Press foot.

- (IBAction)foot:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Foot"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    Trytime ++;
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
   
    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}

//Press hand.

- (IBAction)Hand:(id)sender {
    comment.text= @"";
    if (CurrentKey == @"Hand"){  
        flag2 = true;
        seconds.text = @"0";
        infor.text = @"You are right.";
        
        Righttime ++;
    }
    else {
        //present the status true or false
        infor.text = @"You are wrong.";
        flag2 = true;
    }
    
    Trytime ++;
    sleep(1);
    [timer invalidate];
    score = Righttime/Trytime*100;
    mark.text=[NSString stringWithFormat:@"%i", score];
    AppDelegate *apd=[[UIApplication sharedApplication] delegate];
    apd.fscore = score;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
 
    
    [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
    
    NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
    
    [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
}


//Start button works situation

- (IBAction)StartQuiz:(id)sender {
    UIButton *starter = (UIButton *)sender;
    starter.enabled = NO;
    starter.hidden = YES;
    
    if(flag==true){
        mark.text=[NSString stringWithFormat:@"%i", score];
        
        //Total time timer.
        
        AppDelegate *apd=[[UIApplication sharedApplication] delegate];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

 
        
        recentplay =  [[Position objectAtIndex:apd.ID]integerValue];
        
        recentplay = recentplay+1;
        
        SSplaytimes  = [defaults integerForKey:@"SSplaytimes"];
        
        SSplaytimes = SSplaytimes+1;
        
        
        [defaults setInteger:SSplaytimes forKey:@"SSplaytimes"];
        
     //   NSLog(@"Recentdadadasdaplay is %d", recentplay);

        [Position replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", recentplay]];
        
        
        for(int we = 0; we<30; we++){
     //       NSLog(@"After position is %@", [Position objectAtIndex:we]);
        }
        
        NSData *s = [NSKeyedArchiver archivedDataWithRootObject:Position];
        [[NSUserDefaults standardUserDefaults] setObject:s forKey:@"SSpostion"];
        
        
        timer2 = [ NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countdown2) userInfo:nil repeats:YES ];
        
   //     NSLog(@"Recentplay is %d", recentplay);
        
        
        
        
        

        
               
        
    }
    else{
        comment.text= @"Choose a button";
    }
    flag = false;
    
}

// countdown2 function for the total time

- (void)countdown2{
    MainInt2 = MainInt2 - 1;
    if(MainInt2 < 0){
        
        
       AppDelegate *apd=[[UIApplication sharedApplication] delegate];

        
        NSLog(@"Score is Score is:%d", apd.fscore);
        
        [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", apd.fscore]];
        
        NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
        
        [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];

        
        
        UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UIViewController *next = [board instantiateViewControllerWithIdentifier:@"finalScore"];
        [self presentModalViewController:next animated:YES];
    
         
        [timer2 invalidate];
        [timer invalidate];
        NSLog(@"FFF");
        
        
        
    
    }
    
        
   
    
        
    
    
    else{
        totalTime.text = [NSString stringWithFormat:@"%i", MainInt2];
        if (flag2 == true){
            randnum = arc4random() % 9;
            CurrentKey = [keyList objectAtIndex:randnum];
           
            // test the random item
           // worddisplay.text = CurrentKey;
            
            //voice...............................
            
            
            
            
                CFBundleRef mainBundle =CFBundleGetMainBundle();
                CFURLRef soundFileURLRef;
                soundFileURLRef = CFBundleCopyResourceURL(mainBundle, (__bridge CFStringRef) CurrentKey, CFSTR("wav"), NULL);
                UInt32 soundID;
                AudioServicesCreateSystemSoundID(soundFileURLRef, &soundID);
                AudioServicesPlaySystemSound(soundID);
                sleep(1);
 
            
            //level of difficulty adjustment
            
            score = Righttime/Trytime*100;
            infor.text =(@"Processing");
            
            if(difficulty==2){
                diff.text = @"Easy";
            }
            if(difficulty==1){
                diff.text = @"Normal";
            }
            if(difficulty==0){
                diff.text = @"hard";
            }
             
             
            flag2 = false;
            MainInt = Time ;
            timer = [ NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countdown) userInfo:nil repeats:YES ];
            
        }
    }
    
    
    
    
}

//countdown function for timer each time. 
- (void)countdown {
    
    MainInt -=1;
    if( MainInt > 0){
        seconds.text = [NSString stringWithFormat:@"%i", MainInt];
       
    }
    
    
    else if (MainInt == 0|| MainInt < 0){
        seconds.text = @"Time Out";
        infor.text = @"Failed";
        Trytime++;
        [timer invalidate];
        flag2 =true;
        
        NSLog(@"Righttime is %f", Righttime);
        NSLog(@"trytime is %f", Trytime);
        score = Righttime/Trytime*100;
        mark.text=[NSString stringWithFormat:@"%i", score];
        
        AppDelegate *apd=[[UIApplication sharedApplication] delegate];
        apd.fscore = score;
        
        
        
  
        NSLog(@"SSSCore is %d", score);
        
        [myArray4 replaceObjectAtIndex:apd.ID withObject:[NSString stringWithFormat:@"%i", score]];
        
        NSData *as = [NSKeyedArchiver archivedDataWithRootObject:myArray4];
        
        [[NSUserDefaults standardUserDefaults] setObject:as forKey:@"score1"];
        [timer invalidate];
        
    }
}

- (IBAction)Exit:(id)sender {
    
    [timer invalidate];
    [timer2 invalidate];
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UIViewController *next = [board instantiateViewControllerWithIdentifier:@"select"];
    [self presentModalViewController:next animated:YES];
    
}
@end

