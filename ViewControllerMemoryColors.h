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
//  Copyright (c) 2012 Hao Zhuang. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewControllerMemoryColors : UIViewController
{
    NSTimer *timer;
    __weak IBOutlet UILabel *difficulty;
    __weak IBOutlet UILabel *label6;
    __weak IBOutlet UILabel *Label5;
    __weak IBOutlet UILabel *Label4;
    __weak IBOutlet UILabel *Label3;
    __weak IBOutlet UILabel *Label2;
    __weak IBOutlet UILabel *Label1;
    __weak IBOutlet UILabel *Label7;
    __weak IBOutlet UILabel *label8;
    __weak IBOutlet UILabel *Label9;
    __weak IBOutlet UILabel *Label10;
    
    NSMutableArray * Position;
    NSMutableArray * mystat1;
    NSMutableArray * playerstat;
    NSInteger recentplay;
    
    NSString *CurrentKey;
    NSString *CurrentKey1;
    NSString *CurrentKey2;//  use to random number to choose colour
    NSString *CurrentKey3;
    NSString *CurrentKey4;
    NSString *CurrentKey5;
    NSString *CurrentKey6;
    NSString *CurrentKey7;
    NSString *CurrentKey8;
    NSString *CurrentKey9;
    
    NSMutableArray *myArray5;
    NSMutableArray *myArray6;
    
//    NSString *CurrentKey6;
    __weak IBOutlet UILabel *time;
    
    __weak IBOutlet UILabel *ti;
    __weak IBOutlet UILabel *Sequence;
    NSArray *keyList;
    NSInteger randnum;
    NSInteger randum1;
    NSInteger randum2;
    NSInteger randum3;//  use to generate random number 
    NSInteger randum4;
    NSInteger randum5;
    NSInteger randum6;
    NSInteger randum7;
    NSInteger randum8;
    NSInteger randum9;
    NSInteger randum0;
    
    NSInteger CorrectRate;
    NSInteger TotalScore;
    NSInteger TotalTry;
    NSInteger Trytime;
    NSInteger difficult;
    NSInteger MainInt;
    NSInteger Score;
    
    NSString *SelectKey;
    NSString *SelectKey1;
    NSString *SelectKey2;  //use this to remember what use select
    NSString *SelectKey3;
    NSString *SelectKey4;
    NSString *SelectKey5;
    NSString *SelectKey6;
    NSString *SelectKey7;
    NSString *SelectKey8;
    NSString *SelectKey9;
    
    bool Sound;
    
    
}
- (IBAction)Buttona:(id)sender;

- (IBAction)Buttonb:(id)sender;

- (IBAction)Buttonc:(id)sender;

- (IBAction)Buttond:(id)sender;
- (IBAction)Buttone:(id)sender;
- (IBAction)Buttonf:(id)sender;



//- (IBAction)Buttong:(id)sender;
//- (IBAction)Buttonh:(id)sender;
//- (IBAction)Buttonj:(id)sender;
- (IBAction)Voice:(id)sender;
- (IBAction)Reset:(id)sender;
- (IBAction)Check:(id)sender;
-(int)getScore;
-(void)setScore:(int)input;




@end
