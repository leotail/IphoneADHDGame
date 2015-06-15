// Team information
// Teamname:Asia
// Productname:iConcentrate
// Programmers: Hua Shang , Alex Hon, Hao Zhuang
// ViewController.h
// Gamename: Memorygame
//
// Created by Hao Zhuang on 11/1/2012.
// Modified on 11/11/12
//This viewcontroller will show the statistics about the viewController show number
//  Copyright (c) 2012 Hao Zhuang. All /Volumes/ykc6/cmpt_275/simonsays11/simonsays11.xcodeprojrights reserved.

#import <UIKit/UIKit.h>

@interface ViewControllerMemoryNumbersScore : UIViewController
{
    NSString *a;
    NSString *b;
    NSString *c;
    NSString *d;
    NSInteger q;
}
@property (weak, nonatomic) IBOutlet UILabel *Message1;
@property (weak, nonatomic) IBOutlet UILabel *Message2;
@property (weak, nonatomic) IBOutlet UILabel *Message3;
@property (weak, nonatomic) IBOutlet UILabel *Message4;
@property (weak, nonatomic) IBOutlet UILabel *Message5;
@property (weak, nonatomic) IBOutlet UILabel *Message6;

@property NSString *passString;
@property NSString *pString;    

@end
