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

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewControllerMemoryNumbers : UIViewController
{
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
    
    __weak IBOutlet UILabel *num;
    __weak IBOutlet UILabel *totaltry;
    __weak IBOutlet UILabel *Message;
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
    
    NSArray *keyList;
    NSInteger Trytime;
    NSInteger Score;
    NSInteger difficult;
    NSInteger TotalScore;
    NSInteger TotalTry;
    NSInteger CorrectRate;
    
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
    
    NSMutableArray *myArray5;
    NSMutableArray *myArray6;
    
    __weak IBOutlet UILabel *Label1;
    
    __weak IBOutlet UILabel *Label2;
    
    __weak IBOutlet UILabel *Label3;
    
    __weak IBOutlet UILabel *Label4;
    
    __weak IBOutlet UILabel *Label5;
    
    __weak IBOutlet UILabel *Label6;
    
    __weak IBOutlet UILabel *label7;
    
    __weak IBOutlet UILabel *Label8;
    
    __weak IBOutlet UILabel *Label9;
    
    __weak IBOutlet UILabel *Label10;
    __weak IBOutlet UILabel *difficulty;
    
    
    bool Sound;
    
}
- (IBAction)Number2:(id)sender;
- (IBAction)Number3:(id)sender;
- (IBAction)Number4:(id)sender;
- (IBAction)Number5:(id)sender;
- (IBAction)Number6:(id)sender;

- (IBAction)Number7:(id)sender;
- (IBAction)Number8:(id)sender;

- (IBAction)Number9:(id)sender;
- (IBAction)Number0:(id)sender;
- (IBAction)Start:(id)sender;
- (IBAction)Reset:(id)sender;
- (IBAction)Finish:(id)sender;


@end
