//
//  ViewControllerCard.h
//  iConcentrate
//
//  Created by Patrick Wong on 2012-11-11.
//  Copyright (c) 2012 Team Asia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AnimalCard.h"

@interface ViewControllerCard: UIViewController
{
    IBOutlet UITextField *missCount;
    NSMutableArray *animalArray;
    NSMutableArray *sortedPosition;
    AnimalCard *firstGuess, *secondGuess;
    NSTimer *timer;
    AVAudioPlayer *wrongGuess, *correctGuess, *win, *shuffle;
    
//    NSInteger  cardRemaining;


}

@property(strong, nonatomic)IBOutlet UITextField *missCount;
@property(strong, nonatomic)NSMutableArray *sortedPosition;

-(NSInteger)cardCounter;
-(void)setGame;
-(void)stopAllSounds; 
-(void)shuffle;
-(void)timerControl;
-(void)revealCards;
-(void)hideCards;
-(void)scoreCount;
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;
-(IBAction)startButtonEasy:(id)sender;
-(IBAction)startButtonMedium:(id)sender;
-(IBAction)startButtonHard:(id)sender;
-(IBAction)guessButtons:(id)sender;

@end
