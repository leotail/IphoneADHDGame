// Team information
// Teamname:Asia
// Productname:iConcentrate
// Programmers: Hua Shang YaKun Cai  Hao Zhuang

// In our project proposal, we need to pronounce the word but right now we just show the word in the left of the screen. We will implements that laterly.
// We have a unfixed bug which deals with the time counter. The time counter will count faster and faster as we continue to press the start button.
// there are some warnings about incomplete implementation but we have not found them out.

// ViewController.h
// Gamename: simonsays
//
// Created by Yakun Cai on 10/19/12.
// Modified on 11/11/12
//  Copyright (c) 2012 Yakun Cai. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import "AppDelegate.h"


@interface ViewControllerSimon : UIViewController
{
    // labels for display
    IBOutlet UILabel *seconds;
    IBOutlet UILabel *infor;
    IBOutlet UILabel *worddisplay;
    IBOutlet UILabel *mark;
    IBOutlet UILabel *diff;
    IBOutlet UILabel *totalTime;
    IBOutlet UILabel *comment;
    
    NSInteger recentplay;
    
    NSMutableArray *myArray3;
    NSMutableArray *myArray4;
    
    NSMutableArray * playerstat;
    
    //local variables
    NSTimer *timer,*timer2;
    double Trytime,Righttime;
    NSInteger score;
    NSInteger Time,MainInt,randnum,Time2, MainInt2;
    bool flag2,stop,flag;
    NSString *CurrentKey;
    NSArray *keyList;
    //temp type
    NSInteger difficulty;
    
    NSInteger SSplaytimes;
    
       
    NSMutableArray * mystat1 ;
    NSMutableArray * mystat2 ;
    NSMutableArray * mystat3;
    NSMutableArray * Position;
    //Just a test for file input
    //NSString * filePath;
    //NSString * fileRoot;
    //NSString * fileContents;
    //NSString *ddd;
    //NSString *a;
    //NSString *firstName;
    
}
- (IBAction)Exit:(id)sender;
//buttons
- (IBAction)NoTouch:(id)sender;
- (IBAction)Shoulder:(id)sender;
- (IBAction)StartQuiz:(id)sender;
- (IBAction)Head:(id)sender;
- (IBAction)Chest:(id)sender;
- (IBAction)Arm:(id)sender;
- (IBAction)Stomach:(id)sender;
- (IBAction)Leg:(id)sender;
- (IBAction)foot:(id)sender;
- (IBAction)Hand:(id)sender;
//internal method
-(void)countdown;
-(void)countdown2;


@end
