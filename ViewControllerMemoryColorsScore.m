// Team information
// Teamname:Asia
// Productname:iConcentrate
// Programmers: Hua Shang , Alex Hon, Hao Zhuang
// ViewController.h
// Gamename: Memorygame
//
// Created by Hao Zhuang on 11/1/2012.
// Modified on 11/11/12
//This viewcontroller will show the statistics about the viewController show colour
//  Copyright (c) 2012 Hao Zhuang. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.

#import <UIKit/UIKit.h>


@interface ViewControllerMemoryColorsScore : UIViewController
{
    __weak IBOutlet UILabel *final;
    __weak IBOutlet UILabel *totaltry;
    __weak IBOutlet UILabel *word;
    __weak IBOutlet UILabel *correct;
    __weak IBOutlet UILabel *result;
    __weak IBOutlet UITextField *Result;
    __weak IBOutlet UILabel *Rssult2;
    __weak IBOutlet UILabel *rate;
    __weak IBOutlet UILabel *Show;
    NSString *a;
    NSString *b;
    NSString *c;
    NSString *d;
    NSInteger q;
    
    NSInteger difficult;
}
@property NSString *passString;
- (IBAction)back:(id)sender;
@property NSString *pString;
@end
