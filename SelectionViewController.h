//
//  SelectionViewController.h
//  iConcentrate
//
//  Created by Patrick Wong on 2012-11-22.
//  Copyright (c) 2012 Team Asia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectionViewController : UIViewController
{
    IBOutlet UIImageView *cardStar;
    
    NSMutableArray * myArray7;
    
    NSMutableArray * myArray8;
    
    NSInteger difficulty;
    
    double rating;
    
    NSString *performance;
  /*
    NSMutableArray *User1;
    NSMutableArray *User2;
    NSMutableArray *User3;
    NSMutableArray *User4;
    NSMutableArray *User5;
    NSMutableArray *User6;
    NSMutableArray *User7;
    NSMutableArray *User8;
    NSMutableArray *User9;
    NSMutableArray *User10;
    NSMutableArray *User11;
    NSMutableArray *User12;
    NSMutableArray *User13;
    NSMutableArray *User14;
    NSMutableArray *User15;
    NSMutableArray *User16;
    NSMutableArray *User17;
    NSMutableArray *User18;
    NSMutableArray *User17;
    */
    
    
    
    
}

-(IBAction)cardMatchingGame: (id)sender;

@property (strong, nonatomic)IBOutlet UIImageView *cardStar;


@end
