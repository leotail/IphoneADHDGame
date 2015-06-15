//
//  changePassWordViewController.h
//  MemoryGame
//
//  Created by Hao Zhuang on 11/26/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface changePassWordViewController : UIViewController
{
    NSString *firstPassWord;
    NSString *firstPassWordagain;
    NSMutableArray *myArray;
    NSMutableArray *myArray3;
    NSMutableArray *myArray2;
    __weak IBOutlet UILabel *Showresult;
}
@property (weak, nonatomic) IBOutlet UITextField *OldPassWord;
@property (weak, nonatomic) IBOutlet UITextField *NewPassWord;
- (IBAction)finish:(id)sender;

@end
