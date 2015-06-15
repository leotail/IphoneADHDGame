//
//  ViewControllernewregistrated.h
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
//NSString *Ar[30];
@interface ViewControllernewregistrated : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UILabel *Showregistration;
@property (weak, nonatomic) IBOutlet UITextField *PassWord;
- (IBAction)Enter:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *UserNameagain;
@property (weak, nonatomic) IBOutlet UITextField *PassWordagain;

@end
