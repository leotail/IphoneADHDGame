//
//  ViewControllerParentaccount.h
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerParentaccount : UIViewController
{
    NSMutableArray *a;
    NSMutableArray *b;
    
    NSString *firstName;
    NSString *lastName;
    NSString *newfirstName;
    NSString *newlastName;
    
    NSString *SettedPassWord;
    NSString * SettedUsername;
    
    NSMutableArray *myArray;
    NSMutableArray *myArray2;
    
    NSData *serialized;
    NSData *serializ;
    
}
@property (weak, nonatomic) IBOutlet UITextField *ParentName;
@property (weak, nonatomic) IBOutlet UITextField *ParentPassWord;
- (IBAction)Finish:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *SetNewUsername;
@property (weak, nonatomic) IBOutlet UITextField *SetNewPassWord;
@end
