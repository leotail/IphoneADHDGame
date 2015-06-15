//
//  ViewControllerexistplayer.h
//  MemoryGame
//
//  Created by Hao Zhuang on 11/22/12.
//  Copyright (c) 2012 Hao Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerexistplayer : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UILabel *check;


@property (weak, nonatomic) IBOutlet UITextField *PassWord;
- (IBAction)finish:(id)sender;
@end
